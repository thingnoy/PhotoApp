import UIKit

extension UITableView {
    func registerNib<T: UITableViewCell>(cellType: T.Type) {
        let nibName = String(describing: cellType)
        print("Registering nib with name: \(nibName)")  // debug print
        register(UINib(nibName: nibName, bundle: nil), forCellReuseIdentifier: nibName)
    }
}
