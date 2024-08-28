import Foundation

public class FetchMealsUseCase {
    private let mealRepository: MealRepository

    init(mealRepository: MealRepository) {
        self.mealRepository = mealRepository
    }

    func execute() async throws -> [Meal] {
        return try await mealRepository.fetchMeals()
    }
}
