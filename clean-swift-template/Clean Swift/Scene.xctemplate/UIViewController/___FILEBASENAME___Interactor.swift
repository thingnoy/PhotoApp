import UIKit

protocol ___VARIABLE_sceneName___DataStoreProtocol {
    
}

protocol ___VARIABLE_sceneName___InteractorProtocol {
    
}

class ___VARIABLE_sceneName___Interactor {
    var presenter: ___VARIABLE_sceneName___PresenterProtocol
    var worker: ___VARIABLE_sceneName___WorkerProtocol
    var dataStore: ___VARIABLE_sceneName___DataStoreProtocol
    
    init(
        presenter: ___VARIABLE_sceneName___PresenterProtocol,
        worker: ___VARIABLE_sceneName___WorkerProtocol,
        dataStore: ___VARIABLE_sceneName___DataStoreProtocol
    ) {
        self.presenter = presenter
        self.worker = worker
        self.dataStore = dataStore
    }
}

// MARK: - ___VARIABLE_sceneName___InteractorProtocol
extension ___VARIABLE_sceneName___Interactor: ___VARIABLE_sceneName___InteractorProtocol {
    
}
