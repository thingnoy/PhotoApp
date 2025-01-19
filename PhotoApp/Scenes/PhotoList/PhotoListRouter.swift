import UIKit

protocol PhotoListDataPassingProtocol {
    var dataStore: PhotoListDataStoreProtocol { get }
}

protocol PhotoListRouterProtocol {
    func routeToPhotoDetail(at indexPath: IndexPath)
}

class PhotoListRouter: PhotoListDataPassingProtocol {
    weak var viewController: PhotoListViewController?

    var dataStore: PhotoListDataStoreProtocol

    init(
        dataStore: PhotoListDataStoreProtocol,
        viewController: PhotoListViewController
    ) {
        self.viewController = viewController
        self.dataStore = dataStore
    }
}

// MARK: - PhotoListRouterProtocol

extension PhotoListRouter: PhotoListRouterProtocol {
    func routeToPhotoDetail(at indexPath: IndexPath) {
        guard let viewController = viewController else {
            return
        }
        // let storyboard = UIStoryboard(name: "PhotoDetail", bundle: nil)
        // let destinationVC = storyboard.instantiateViewController(withIdentifier: "PhotoDetailViewController") as! PhotoDetailViewController
        // var destinationDS = destinationVC.router!.dataStore!
        // passDataToPhotoDetail(source: dataStore!, destination: &destinationDS, at: indexPath)

        guard let photo = dataStore.photos?[indexPath.row] else { return }
        let destinationVC = PhotoDetailBuilder.build(model: PhotoDetailModel.LoadPhoto.Response(photo: photo))
        navigateToPhotoDetail(source: viewController, destination: destinationVC as! PhotoDetailViewController)
    }

    // MARK: - Navigation

    private func navigateToPhotoDetail(source: PhotoListViewController, destination: PhotoDetailViewController) {
        source.navigationController?.pushViewController(destination, animated: true)
    }

    // MARK: - Passing data

    // private func passDataToPhotoDetail(source: PhotoListDataStore, destination: inout PhotoDetailDataStore, at indexPath: IndexPath) {
    //     destination.photo = source.photos?[indexPath.row]
    // }
}
