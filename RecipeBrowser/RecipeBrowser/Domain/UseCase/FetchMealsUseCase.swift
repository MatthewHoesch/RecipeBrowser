import Foundation

public class FetchMealsUseCase {
    private let mealRepository: MealRepository

    public init(mealRepository: MealRepository) {
        self.mealRepository = mealRepository
    }

    public func execute() async throws -> [Meal] {
        return try await mealRepository.getMeals()
    }
}
