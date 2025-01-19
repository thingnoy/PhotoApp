import UIKit

enum PhotoDetailModel {
    enum LoadPhoto {
        struct Request {}

        struct Response {
            let photo: Photo
        }

        struct ViewModel {
            let id: String
            let author: String
            let imageUrl: String
            let dimensions: String
        }
    }
}
