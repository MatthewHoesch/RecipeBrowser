import SwiftUI

class RecipeListViewModel: ObservableObject {
    @Published var viewState: RecipeListViewState

    private var getRecipiesUseCase: GetRecipesUseCase

    init(viewState: RecipeListViewState = .init(), getRecipiesUseCase: GetRecipesUseCase = .init()) {
        self.viewState = viewState
        self.getRecipiesUseCase = getRecipiesUseCase
    }

    @MainActor
    func getInitalState() async {
        viewState.state = .loading
        viewState.recipes.meals = []
        viewState.recipes = await getRecipiesUseCase.call() ?? MealResponseModel(meals: [])

        if viewState.recipes.meals.isEmpty {
            viewState.state = .empty
        } else {
            viewState.state = .content
        }
    }
}
