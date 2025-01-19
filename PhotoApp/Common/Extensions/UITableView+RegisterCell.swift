import UIKit

extension UITableView {
    func registerNib<T: UITableViewCell>(cellType: T.Type) {
        let nibName = String(describing: cellType)
        print("Registering nib with name: \(nibName)") // debug print
        register(UINib(nibName: nibName, bundle: nil), forCellReuseIdentifier: nibName)
    }

    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        let identifier = String(describing: T.self)

        guard let cell = dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(identifier)")
        }

        return cell
    }
}
