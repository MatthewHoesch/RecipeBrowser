import SwiftUI

@main
struct RecipeBrowserApp: App {
    // Initialize the dependencies here
    let mealRepository: MealRepository
    let fetchMealsUseCase: FetchMealsUseCase

    init() {
        // Initialize the services and repositories
        let mealAPIService = MealAPIService()
        self.mealRepository = MealRepositoryImpl(apiService: mealAPIService)

        // Initialize the use cases
        self.fetchMealsUseCase = FetchMealsUseCase(mealRepository: mealRepository)
    }

    var body: some Scene {
        WindowGroup {
            // Pass dependencies into the MealListView
            MealListView(
                viewModel: MealListViewModel(fetchMealsUseCase: fetchMealsUseCase)
            )
        }
    }
}
