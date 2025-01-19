import UIKit

protocol PhotoDetailDataPassingProtocol {
    var dataStore: PhotoDetailDataStoreProtocol { get }
}

protocol PhotoDetailRouterProtocol {
    
}

class PhotoDetailRouter: PhotoDetailDataPassingProtocol {
    
    weak var viewController: PhotoDetailViewController?
    
    var dataStore: PhotoDetailDataStoreProtocol
    
    init(
        dataStore: PhotoDetailDataStoreProtocol,
        viewController: PhotoDetailViewController
    ) {
        self.viewController = viewController
        self.dataStore = dataStore
    }
}

// MARK: - PhotoDetailRouterProtocol
extension PhotoDetailRouter: PhotoDetailRouterProtocol {
    
}
