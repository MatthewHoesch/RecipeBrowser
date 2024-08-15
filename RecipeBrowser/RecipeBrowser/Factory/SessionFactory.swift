import Foundation

class SessionFactory {

    static let shared = SessionFactory()

    func getSharedURLSession() -> URLSession {
        return URLSession.shared
    }
}
