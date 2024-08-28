import Foundation

protocol MealRepository {
    func fetchMeals() async throws -> [Meal]
}

class MealRepositoryImpl: MealRepository {
    private let apiService: MealAPIService

    init(apiService: MealAPIService) {
        self.apiService = apiService
    }

    func fetchMeals() async throws -> [Meal] {
        let mealsDTO = try await apiService.fetchMeals()
        return mealsDTO.map { $0.toDomain() }
    }
}
