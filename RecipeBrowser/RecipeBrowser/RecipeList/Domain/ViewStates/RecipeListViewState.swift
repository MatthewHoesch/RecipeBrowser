enum RecipeListViewStates {
    case content
    case empty
    case loading
}

struct RecipeListViewState {
    var recipes: MealResponseModel = MealResponseModel(meals: [])
    var state: RecipeListViewStates = .loading
}
