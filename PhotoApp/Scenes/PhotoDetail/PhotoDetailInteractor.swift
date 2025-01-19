import UIKit

protocol PhotoDetailDataStoreProtocol {
    var photo: Photo? { get set }
}

protocol PhotoDetailInteractorProtocol {
    func loadPhoto(request _: PhotoDetailModel.LoadPhoto.Request)
}

class PhotoDetailInteractor {
    var presenter: PhotoDetailPresenterProtocol
    var worker: PhotoDetailWorkerProtocol
    var dataStore: PhotoDetailDataStoreProtocol

    init(
        presenter: PhotoDetailPresenterProtocol,
        worker: PhotoDetailWorkerProtocol,
        dataStore: PhotoDetailDataStoreProtocol
    ) {
        self.presenter = presenter
        self.worker = worker
        self.dataStore = dataStore
    }
}

// MARK: - PhotoDetailInteractorProtocol

extension PhotoDetailInteractor: PhotoDetailInteractorProtocol {
    func loadPhoto(request: PhotoDetailModel.LoadPhoto.Request) {
        guard let photo = dataStore.photo else { return }
        let response = PhotoDetailModel.LoadPhoto.Response(photo: photo)
        presenter.presentPhoto(response: response)
    }
}
