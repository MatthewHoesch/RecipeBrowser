//
//  GetDessertsUseCase.swift
//  RecipeBrowser
//
//  Created by Matthew Hoesch on 8/15/24.
//

import Foundation

class GetRecipesUseCase {
    var repository: RecipeListRepository = RecipeListRepository()

    func call() async -> MealResponseModel? {
        return await repository.getDessertList()
    }
}
