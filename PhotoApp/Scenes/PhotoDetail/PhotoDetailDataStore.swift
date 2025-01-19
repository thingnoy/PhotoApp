class PhotoDetailDataStore: PhotoDetailDataStoreProtocol {
    var photo: Photo?

    init(photo: Photo) {
        self.photo = photo
    }
}
