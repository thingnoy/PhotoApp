import Alamofire
import Foundation

protocol PhotoListWorkerProtocol {
    func fetchPhotos(completion: @escaping (Result<[Photo], Error>) -> Void)
}

class PhotoListWorker: PhotoListWorkerProtocol {
    func fetchPhotos(completion: @escaping (Result<[Photo], Error>) -> Void) {
        let urlString = "https://picsum.photos/v2/list?page=1&limit=100"
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data received"])))
                return
            }

            do {
                let photos = try JSONDecoder().decode([Photo].self, from: data)
                completion(.success(photos))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }

//     func fetchPhotos(completion: @escaping (Result<[Photo], Error>) -> Void) {
//         let url = "https://picsum.photos/v2/list?page=1&limit=100"
//
//         AF.request(url)
//             .responseDecodable(of: [Photo].self) { response in
//                 switch response.result {
//                 case let .success(photos):
//                     completion(.success(photos))
//                 case let .failure(error):
//                     completion(.failure(error))
//                 }
//             }
//     }
}
