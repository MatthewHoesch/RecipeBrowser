import Foundation

class SessionFactory: NSObject, URLSessionDelegate {

    static let shared = SessionFactory()

    func getSharedURLSession() -> URLSession {
        let sessionConfig = URLSessionConfiguration.default
        return URLSession(configuration: sessionConfig, delegate: self, delegateQueue: nil)
    }

    // Delegate method to handle SSL pinning and allow untrusted certificates (development only)
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        if let serverTrust = challenge.protectionSpace.serverTrust {
            let credential = URLCredential(trust: serverTrust)
            completionHandler(.useCredential, credential)
        } else {
            completionHandler(.performDefaultHandling, nil)
        }
    }
}
