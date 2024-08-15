import Foundation
import OSLog

class HTTPService: NSObject {
    static let shared = HTTPService()

    var session = URLSession.shared
    var sessionFactory: SessionFactory = SessionFactory.shared
    var urlSessionWrapper: URLSessionWrapper = URLSessionWrapper()

    // MARK: - Get request

    func perform(get request: URLRequest) async -> (Data?, HTTPURLResponse?) {
        return await sendRequest(request: request)
    }

    // MARK: - Private call, sending the actual request

    private func sendRequest(request: URLRequest) async -> (Data?, HTTPURLResponse?) {
        session = sessionFactory.getSharedURLSession()
        let ((dataResponse, _)) = await urlSessionWrapper.data(for: request, with: session)
        let data = dataResponse?.0
        let response = dataResponse?.1
        let httpResponse = response as? HTTPURLResponse
        return (data, httpResponse)
    }
}
