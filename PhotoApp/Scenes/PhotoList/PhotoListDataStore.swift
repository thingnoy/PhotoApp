class PhotoListDataStore: PhotoListDataStoreProtocol {
    var photos: [Photo]?

    init() {}

    init(photos: [Photo]?) {
        self.photos = photos
    }
}
