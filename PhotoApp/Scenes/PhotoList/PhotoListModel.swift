import UIKit

enum PhotoListModel {
    enum FetchPhotos {
        struct Request {}

        struct Response {
            let photos: [Photo]
        }

        struct ViewModel {
            struct DisplayedPhoto {
                let id: String
                let author: String
                let thumbnailUrl: String
            }
            let displayedPhotos: [DisplayedPhoto]
        }
    }
}
