import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    func getData() {
        let manager = DataManager(repository: NetworkManager.shared)
        let urlString = "https://run.mocky.io/v3/f66d53cb-1429-4e15-9a4f-29d3042aff5e"
        manager.fetchData(url: URL(string: urlString)) { result in
            switch result{
                case .success(let responseData):
                    debugPrint(responseData)
                case .failure(let error):
                    debugPrint(error.localizedDescription)
            }
        }
    }
}


