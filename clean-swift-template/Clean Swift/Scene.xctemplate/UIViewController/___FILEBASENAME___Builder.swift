import UIKit

struct ___VARIABLE_sceneName___Builder { }

extension ___VARIABLE_sceneName___Builder {
    static func build(parameter: [String: Any?]?) -> UIViewController {
        let bundle = Bundle(for: ___VARIABLE_sceneName___ViewController.self)
        let identifier = String(describing: ___VARIABLE_sceneName___ViewController.self)
        
        let storyboard = UIStoryboard(name: "___VARIABLE_sceneName___", bundle: bundle)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: identifier) as? ___VARIABLE_sceneName___ViewController else {
            fatalError("ViewController is undefined.")
        }
        
        let worker = ___VARIABLE_sceneName___Worker()
        let presenter = ___VARIABLE_sceneName___Presenter(viewController: viewController)
        let dataStore = ___VARIABLE_sceneName___DataStore()
        let interactor = ___VARIABLE_sceneName___Interactor(
            presenter: presenter,
            worker: worker,
            dataStore: dataStore
        )
        let router = ___VARIABLE_sceneName___Router(dataStore: dataStore, viewController: viewController)
        
        viewController.interactor = interactor
        viewController.router = router
        return viewController
    }
}
