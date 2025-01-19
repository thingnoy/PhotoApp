//
//  PhotoTableViewCell.swift
//  PhotoApp
//
//  Created by supasai haplakhon on 19/1/25.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var authorLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    private func setupUI() {
        // Configure imageView
        photoImageView.contentMode = .scaleAspectFill
        photoImageView.clipsToBounds = true

        // Configure label
        authorLabel.font = .systemFont(ofSize: 16)
    }

    func configure(with photo: PhotoListModel.FetchPhotos.ViewModel.DisplayedPhoto) {
        authorLabel.text = photo.author

        if let url = URL(string: photo.thumbnailUrl) {
            URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.photoImageView.image = image
                    }
                }
            }.resume()
        }
    }

}
