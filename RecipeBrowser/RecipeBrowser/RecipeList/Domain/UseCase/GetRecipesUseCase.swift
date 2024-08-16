import Foundation

class GetRecipesUseCase {
    var repository: RecipeListRepository = RecipeListRepository()

    func call() async -> MealResponseModel? {
        return await repository.getDessertList()
    }
}
