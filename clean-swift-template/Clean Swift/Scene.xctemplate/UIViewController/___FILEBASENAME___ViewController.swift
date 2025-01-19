import UIKit

typealias ___VARIABLE_sceneName___RouterInterface = ___VARIABLE_sceneName___RouterProtocol & ___VARIABLE_sceneName___DataPassingProtocol

protocol ___VARIABLE_sceneName___ViewControllerProtocol: AnyObject {
    
}

class ___VARIABLE_sceneName___ViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    // MARK: - Public Properties
    var interactor: ___VARIABLE_sceneName___InteractorProtocol!
    var router: ___VARIABLE_sceneName___RouterInterface!
    
    // MARK: - Private Properties
    
    // MARK: - View Life Cycle Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Method Private
    
}

// MARK: - ___VARIABLE_sceneName___ViewControllerProtocol
extension ___VARIABLE_sceneName___ViewController: ___VARIABLE_sceneName___ViewControllerProtocol {
    
}
