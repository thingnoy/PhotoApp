import UIKit

struct PhotoDetailBuilder { }

extension PhotoDetailBuilder {
    static func build(model: PhotoDetailModel.LoadPhoto.Response) -> UIViewController {
        let bundle = Bundle(for: PhotoDetailViewController.self)
        let identifier = String(describing: PhotoDetailViewController.self)
        
        let storyboard = UIStoryboard(name: "PhotoDetail", bundle: bundle)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: identifier) as? PhotoDetailViewController else {
            fatalError("ViewController is undefined.")
        }
        
        let worker = PhotoDetailWorker()
        let presenter = PhotoDetailPresenter(viewController: viewController)
        let dataStore = PhotoDetailDataStore(photo: model.photo)
        let interactor = PhotoDetailInteractor(
            presenter: presenter,
            worker: worker,
            dataStore: dataStore
        )
        let router = PhotoDetailRouter(dataStore: dataStore, viewController: viewController)
        
        viewController.interactor = interactor
        viewController.router = router
        return viewController
    }
}
