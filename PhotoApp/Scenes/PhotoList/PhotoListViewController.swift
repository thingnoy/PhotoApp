import Kingfisher
import UIKit

typealias PhotoListRouterInterface = PhotoListDataPassingProtocol & PhotoListRouterProtocol

protocol PhotoListViewControllerProtocol: AnyObject {
    func displayPhotos(viewModel: PhotoListModel.FetchPhotos.ViewModel)
}

class PhotoListViewController: UIViewController {
    // MARK: - IBOutlets

    @IBOutlet var tableView: UITableView!

    // MARK: - Public Properties

    var interactor: PhotoListInteractorProtocol!
    var router: PhotoListRouterInterface!

    @IBAction func onTabClear(_: Any) {
        // ล้าง cache ทั้งหมด
        KingfisherManager.shared.cache.clearCache()

        // ล้างรายการ animation ที่เคยทำไว้
        animatedCells.removeAll()
    }

    private let refreshControl = UIRefreshControl()
    private var animatedCells = Set<Int>()
    private var displayedPhotos: [PhotoListModel.FetchPhotos.ViewModel.DisplayedPhoto] = []

    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        fetchPhotos()
    }

    private func setupTableView() {
        // use extension to register cell
        tableView.registerNib(cellType: PhotoTableViewCell.self)

        tableView.dataSource = self
        tableView.delegate = self

        // Setup pull to refresh
        refreshControl.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }

    private func fetchPhotos() {
        let request = PhotoListModel.FetchPhotos.Request()
        interactor?.fetchPhotos(request: request)
    }

    @objc private func handleRefresh() {
        fetchPhotos()
    }
}

// MARK: - PhotoListViewControllerProtocol

extension PhotoListViewController: PhotoListViewControllerProtocol {
    func displayPhotos(viewModel: PhotoListModel.FetchPhotos.ViewModel) {
        displayedPhotos = viewModel.displayedPhotos
        tableView.reloadData()

        // หยุด animation refresh control
        refreshControl.endRefreshing()
    }
}

extension PhotoListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return displayedPhotos.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PhotoTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        let photo = displayedPhotos[indexPath.row]
        cell.configure(with: photo)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        router?.routeToPhotoDetail(at: indexPath)
    }

    func tableView(_: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // Skip if this cell was already animated
        guard !animatedCells.contains(indexPath.row) else { return }

        // Add this cell to animated set
        animatedCells.insert(indexPath.row)

        // Set initial state
        cell.transform = CGAffineTransform(translationX: 0, y: 100)
        cell.alpha = 0

        UIView.animate(
            withDuration: 1.0,
            delay: 0,
            usingSpringWithDamping: 0.8,
            initialSpringVelocity: 0.3,
            options: .curveEaseOut,
            animations: {
                cell.transform = .identity
                cell.alpha = 1
            }
        )
    }
}
