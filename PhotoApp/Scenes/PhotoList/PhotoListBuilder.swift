import UIKit

struct PhotoListBuilder { }

extension PhotoListBuilder {
    static func build(parameter: [String: Any?]?) -> UIViewController {
        let bundle = Bundle(for: PhotoListViewController.self)
        let identifier = String(describing: PhotoListViewController.self)
        
        let storyboard = UIStoryboard(name: "PhotoList", bundle: bundle)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: identifier) as? PhotoListViewController else {
            fatalError("ViewController is undefined.")
        }
        
        let worker = PhotoListWorker()
        let presenter = PhotoListPresenter(viewController: viewController)
        let dataStore = PhotoListDataStore()
        let interactor = PhotoListInteractor(
            presenter: presenter,
            worker: worker,
            dataStore: dataStore
        )
        let router = PhotoListRouter(dataStore: dataStore, viewController: viewController)
        
        viewController.interactor = interactor
        viewController.router = router
        return viewController
    }
}
