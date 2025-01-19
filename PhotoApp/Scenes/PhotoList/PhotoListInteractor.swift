import UIKit

protocol PhotoListDataStoreProtocol {
    var photos: [Photo]? { get set }
}

protocol PhotoListInteractorProtocol {
    func fetchPhotos(request: PhotoListModel.FetchPhotos.Request)
}

class PhotoListInteractor {
    var presenter: PhotoListPresenterProtocol
    var worker: PhotoListWorkerProtocol
    var dataStore: PhotoListDataStoreProtocol

    init(
        presenter: PhotoListPresenterProtocol,
        worker: PhotoListWorkerProtocol,
        dataStore: PhotoListDataStoreProtocol
    ) {
        self.presenter = presenter
        self.worker = worker
        self.dataStore = dataStore
    }
}

// MARK: - PhotoListInteractorProtocol

extension PhotoListInteractor: PhotoListInteractorProtocol {
    func fetchPhotos(request _: PhotoListModel.FetchPhotos.Request) {
        worker.fetchPhotos { [weak self] result in
            switch result {
            case let .success(photos):
                self?.dataStore.photos = photos
                let response = PhotoListModel.FetchPhotos.Response(photos: photos)
                self?.presenter.presentPhotos(response: response)
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }
}
