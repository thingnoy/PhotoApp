//
//  PhotoTableViewCell.swift
//  PhotoApp
//
//  Created by supasai haplakhon on 19/1/25.
//

import Kingfisher
import UIKit

class PhotoTableViewCell: UITableViewCell {
    static let identifier = String(describing: PhotoTableViewCell.self)

    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var authorLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    // ยกเลิกการโหลดรูปเมื่อ cell ถูก reuse
    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView.kf.cancelDownloadTask()

        photoImageView.image = UIImage()
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

//       if let url = URL(string: photo.thumbnailUrl) {
//           URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
//               if let data = data, let image = UIImage(data: data) {
//                   DispatchQueue.main.async {
//                       self?.photoImageView.image = image
//                   }
//               }
//           }.resume()
//       }

        // แสดง loading indicator ระหว่างโหลดรูป
        photoImageView.kf.indicatorType = .activity

        // ใส่ animation fade เวลารูปโหลดเสร็จ
        let options: KingfisherOptionsInfo = [
            .transition(.fade(0.2)),
            .cacheOriginalImage,
        ]

        // ปรับขนาดรูปก่อนแสดง ช่วยประหยัด memory
        let processor = DownsamplingImageProcessor(size: photoImageView.bounds.size)

        // เพิ่ม placeholder รูปและจัดการ error
        photoImageView.kf.setImage(
            with: URL(string: photo.thumbnailUrl),
            placeholder: UIImage(named: "placeholder"),
            options: options
        ) { result in
            switch result {
            case let .success(value):
                print("รูปโหลดสำเร็จ: \(value.source.url?.absoluteString ?? "")")
            case let .failure(error):
                print("โหลดรูปไม่สำเร็จ: \(error.localizedDescription)")
            }
        }

        // simple use
        // photoImageView.kf.setImage(with: URL(string: photo.thumbnailUrl))
    }
}
