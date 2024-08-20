import Foundation

class MealAPIService: NSObject, URLSessionDelegate {
    private var session: URLSession! // Use implicitly unwrapped optional

    override init() {
        super.init()
        setupSession() // Initialize URLSession after calling super.init()
    }

    private func setupSession() {
        let config = URLSessionConfiguration.default
        session = URLSession(configuration: config, delegate: self, delegateQueue: nil)
    }

    func fetchMeals() async throws -> [MealDTO] {
        let url = URL(string: Constants.Endpoints.Recipe.list)!
        let (data, response) = try await session.data(from: url)

        // Debug: Print the raw response
        if let rawString = String(data: data, encoding: .utf8) {
            print("Raw response: \(rawString)")
        }

        // Check for a successful response status code
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }

        // Decode the JSON response into MealListResponseDTO
        let responseDTO = try JSONDecoder().decode(MealListResponseDTO.self, from: data)
        return responseDTO.meals
    }


    // Implement URLSessionDelegate method
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        if challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust {
            let serverTrust = challenge.protectionSpace.serverTrust!
            let credential = URLCredential(trust: serverTrust)
            completionHandler(.useCredential, credential)
        } else {
            completionHandler(.performDefaultHandling, nil)
        }
    }
}
