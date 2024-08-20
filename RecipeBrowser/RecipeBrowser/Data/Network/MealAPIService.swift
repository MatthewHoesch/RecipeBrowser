import Foundation

class MealAPIService {
    func fetchMeals() async throws -> [MealDTO] {
        let url = URL(string: Constants.Endpoints.Recipe.list)!
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(MealListResponseDTO.self, from: data)
        return response.meals
    }
}
