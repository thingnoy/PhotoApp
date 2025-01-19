import UIKit

protocol PhotoListPresenterProtocol {
    func presentPhotos(response: PhotoListModel.FetchPhotos.Response)
}

class PhotoListPresenter {
    weak var viewController: PhotoListViewControllerProtocol?

    init(viewController: PhotoListViewControllerProtocol) {
        self.viewController = viewController
    }
}

// MARK: - PhotoListPresenterProtocol

extension PhotoListPresenter: PhotoListPresenterProtocol {
    func presentPhotos(response: PhotoListModel.FetchPhotos.Response) {
        let displayedPhotos = response.photos.map { photo in
            PhotoListModel.FetchPhotos.ViewModel.DisplayedPhoto(
                id: photo.id,
                author: photo.author,
                thumbnailUrl: photo.downloadUrl
            )
        }

        let viewModel = PhotoListModel.FetchPhotos.ViewModel(displayedPhotos: displayedPhotos)
        DispatchQueue.main.async {
            self.viewController?.displayPhotos(viewModel: viewModel)
        }
    }
}
