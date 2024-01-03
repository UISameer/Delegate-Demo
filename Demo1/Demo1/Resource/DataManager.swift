import Foundation


class DataManager {
    
    private let repository: DataRepository
    
    init(repository: DataRepository) {
        self.repository = repository
    }
    
    func fetchData(url: URL?, completion: @escaping (Result<ResponseData, Error>) -> ()) {
        repository.execute(url: url) { result in
            switch result {
                case .success(let data):
                    let result = Result(catching: {
                        try JSONDecoder().decode(ResponseData.self, from: data)
                    })
                    completion(result)
                case .failure(let error):
                    completion(.failure(error))
            }
        }
    }
}
