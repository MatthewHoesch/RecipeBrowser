import Foundation

struct MealListResponseDTO: Decodable {
    let meals: [MealDTO]
}

struct MealDTO: Decodable {
    let idMeal: String
    let strMeal: String
    let strMealThumb: String?

    func toDomain() -> Meal {
        return Meal(id: idMeal, name: strMeal, thumbnailURL: strMealThumb)
    }
}
