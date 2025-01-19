import UIKit

protocol PhotoDetailPresenterProtocol {
    func presentPhoto(response: PhotoDetailModel.LoadPhoto.Response)
}

class PhotoDetailPresenter {
    weak var viewController: PhotoDetailViewControllerProtocol?

    init(viewController: PhotoDetailViewControllerProtocol) {
        self.viewController = viewController
    }
}

// MARK: - PhotoDetailPresenterProtocol
extension PhotoDetailPresenter: PhotoDetailPresenterProtocol {
    func presentPhoto(response: PhotoDetailModel.LoadPhoto.Response) {
        let dimensions = "\(response.photo.width) × \(response.photo.height)"
        let viewModel = PhotoDetailModel.LoadPhoto.ViewModel(
            id: response.photo.id,
            author: response.photo.author,
            imageUrl: response.photo.downloadUrl,
            dimensions: dimensions
        )

        DispatchQueue.main.async {
            self.viewController?.displayPhoto(viewModel: viewModel)
        }
    }
}
