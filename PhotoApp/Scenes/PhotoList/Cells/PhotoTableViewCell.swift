import UIKit

class PhotoTableViewCell: UITableViewCell {
    static let identifier = String(describing: PhotoTableViewCell.self)

    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var authorLabel: UILabel!

    private var previousFrame: CGRect = .zero

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView.cancelImageLoading()
        photoImageView.image = nil
    }

    private func setupUI() {
        photoImageView.contentMode = .scaleAspectFill
        photoImageView.clipsToBounds = true
        authorLabel.font = .systemFont(ofSize: 16)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }

    func configure(with photo: PhotoListModel.FetchPhotos.ViewModel.DisplayedPhoto) {
        authorLabel.text = photo.author

        photoImageView.loadImage(from: photo.thumbnailUrl, placeholder: UIImage(named: "loading"))
    }
}
