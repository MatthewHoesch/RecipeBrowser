import Foundation

class RecipeListDataSource {
    static let shared: RecipeListDataSource = RecipeListDataSource()

    var recipes = Constants.Endpoints.Recipe.list
    var service: HTTPService = HTTPService.shared

    func getRecipeList() async -> MealResponseModel? {
        guard let url = URL(string: recipes) else {
            return nil
        }

        let (data, response) = await service.perform(get: URLRequest(url: url))

        if response?.statusCode == 200 {
            return mapRecipeListSuccessResponse(using: data)
        } else {
            return nil
        }
    }

    private func mapRecipeListSuccessResponse(using data: Data?) -> MealResponseModel? {
        guard let data = data, let result = try? JSONDecoder().decode(MealResponseModel.self, from: data) else {
            return nil
        }
        return result
    }
}
