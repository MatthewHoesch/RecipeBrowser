enum ViewState<T> {
    case loading
    case success(T)
    case failure(Error)
}
