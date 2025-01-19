import UIKit

typealias PhotoDetailRouterInterface = PhotoDetailRouterProtocol & PhotoDetailDataPassingProtocol

protocol PhotoDetailViewControllerProtocol: AnyObject {
    func displayPhoto(viewModel: PhotoDetailModel.LoadPhoto.ViewModel)
}

class PhotoDetailViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var imageView: UIImageView!
        @IBOutlet private weak var authorLabel: UILabel!
        @IBOutlet private weak var dimensionsLabel: UILabel!

    // MARK: - Public Properties
    var interactor: PhotoDetailInteractorProtocol!
    var router: PhotoDetailRouterInterface!


        // MARK: - View lifecycle
        override func viewDidLoad() {
            super.viewDidLoad()
            setupUI()
            loadPhoto()
        }

    @IBAction func onTapBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    private func setupUI() {
            title = "Photo Detail"
            imageView.contentMode = .scaleAspectFit
        }

        private func loadPhoto() {
            let request = PhotoDetailModel.LoadPhoto.Request()
            interactor?.loadPhoto(request: request)
        }

        func displayPhoto(viewModel: PhotoDetailModel.LoadPhoto.ViewModel) {
            authorLabel.text = "By: \(viewModel.author)"
            dimensionsLabel.text = "Dimensions: \(viewModel.dimensions)"

            // Load image
            if let url = URL(string: viewModel.imageUrl) {
                // Show loading indicator
                let activityIndicator = UIActivityIndicatorView(style: .medium)
                activityIndicator.center = imageView.center
                imageView.addSubview(activityIndicator)
                activityIndicator.startAnimating()

                URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
                    DispatchQueue.main.async {
                        activityIndicator.removeFromSuperview()

                        if let error = error {
                            // Handle error - show alert
                            print("Error loading image: \(error)")
                            return
                        }

                        if let data = data, let image = UIImage(data: data) {
                            self?.imageView.image = image
                        }
                    }
                }.resume()
            }
        }

}

// MARK: - PhotoDetailViewControllerProtocol
extension PhotoDetailViewController: PhotoDetailViewControllerProtocol {
    
}
