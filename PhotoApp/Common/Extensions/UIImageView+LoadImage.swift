import Kingfisher
import UIKit

extension UIImageView {
    func loadImage(
        from urlString: String?,
        placeholder: UIImage? = nil,
        completion: ((Result<RetrieveImageResult, KingfisherError>) -> Void)? = nil
    ) {
        guard let urlString = urlString, let url = URL(string: urlString) else {
            image = placeholder
            return
        }

        // Set background color for loading state
        backgroundColor = .systemGray6

        kf.indicatorType = .activity

        let options: KingfisherOptionsInfo = [
            // เพิ่ม fade animation เมื่อโหลดรูปเสร็จ ใช้เวลา 0.2 วินาที
            .transition(.fade(0.2)),

            // เก็บรูปต้นฉบับไว้ใน cache เพื่อใช้ซ้ำ
            .cacheOriginalImage,

            // ลดขนาดรูปก่อนแสดงผลเพื่อประหยัด memory
            .processor(DownsamplingImageProcessor(size: bounds.size)),

            // ปรับขนาดรูปให้เหมาะกับความละเอียดของหน้าจอ
            .scaleFactor(UIScreen.main.scale),
            .progressiveJPEG(
                ImageProgressive(
                    isBlur: true,
                    isFastestScan: true,
                    scanInterval: 0.1
                )
            ),

            // Background processing
            .backgroundDecode,
            .callbackQueue(.mainAsync),
        ]

        kf.setImage(
            with: url,
            placeholder: placeholder,
            options: options,
            completionHandler: completion
        )
    }

    func cancelImageLoading() {
        kf.cancelDownloadTask()
        backgroundColor = .clear
    }
}
