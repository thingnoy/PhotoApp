import UIKit

protocol ___VARIABLE_sceneName___DataPassingProtocol {
    var dataStore: ___VARIABLE_sceneName___DataStoreProtocol { get }
}

protocol ___VARIABLE_sceneName___RouterProtocol {
    
}

class ___VARIABLE_sceneName___Router: ___VARIABLE_sceneName___DataPassingProtocol {
    
    weak var viewController: ___VARIABLE_sceneName___ViewController?
    
    var dataStore: ___VARIABLE_sceneName___DataStoreProtocol
    
    init(
        dataStore: ___VARIABLE_sceneName___DataStoreProtocol,
        viewController: ___VARIABLE_sceneName___ViewController
    ) {
        self.viewController = viewController
        self.dataStore = dataStore
    }
}

// MARK: - ___VARIABLE_sceneName___RouterProtocol
extension ___VARIABLE_sceneName___Router: ___VARIABLE_sceneName___RouterProtocol {
    
}
