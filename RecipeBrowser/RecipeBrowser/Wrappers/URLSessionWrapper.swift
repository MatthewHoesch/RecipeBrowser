import Foundation

class URLSessionWrapper {

    func data(for request: URLRequest, with session: URLSession) async -> ((Data, URLResponse?)?, Error?) {
        var returnData: (Data, URLResponse)
        do {
            returnData = try await session.data(for: request)
        } catch {
            return ((Data(), URLResponse()), error)
        }

        return (returnData, nil)
    }

    func data(for url: URL, with session: URLSession) async -> ((Data, URLResponse?)?, Error?) {
        var returnData: (Data, URLResponse)
        do {
            returnData = try await session.data(from: url)
        } catch {
            return ((Data(), URLResponse()), error)
        }

        return (returnData, nil)
    }
}
