import Foundation

class RecipeListRepository {
    var datasource: RecipeListDataSource = RecipeListDataSource.shared

    func getDessertList() async -> MealResponseModel? {
        return await datasource.getRecipeList()
    }
}
