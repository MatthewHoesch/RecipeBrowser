import Foundation

@MainActor
class MealListViewModel: ObservableObject {
    private let fetchMealsUseCase: FetchMealsUseCase
    @Published var mealsState: ViewState<[Meal]> = .loading

    init(fetchMealsUseCase: FetchMealsUseCase) {
        self.fetchMealsUseCase = fetchMealsUseCase
    }

    func loadMeals() async {
        do {
            let meals = try await fetchMealsUseCase.execute()
            mealsState = .success(meals)
        } catch {
            mealsState = .failure(error)
        }
    }
}
