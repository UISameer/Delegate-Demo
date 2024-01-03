import Foundation

enum NetworkError: Error {
    case errorResponse(errorString: String)
    case invalidURL
    case missingData
}

protocol DataRepository {
    func execute(url: URL?, completionHandler: @escaping (Result<Data, Error>) -> ())
}

class NetworkManager: DataRepository {
    static let shared = NetworkManager()
    
    private init() {
    }
    
    func execute(url: URL?, completionHandler: @escaping (Result<Data, Error>) -> ()) {
        guard let url = url else {
            completionHandler(.failure(NetworkError.invalidURL))
            return
        }
            // Get data
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completionHandler(.failure(error))
            }
            if let data = data {
                completionHandler(.success(data))
            } else {
                completionHandler(.failure(NetworkError.missingData))
            }
        }
        .resume()
    }
}
