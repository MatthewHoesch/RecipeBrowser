import Foundation

struct Constants {
    struct Environment {
        static let backendServer = "https://themealdb.com"
    }

    struct Endpoints {
        struct Recipe {
            static let list = Constants.Environment.backendServer + "/api/json/v1/1/filter.php?c=Dessert"
            static let details = Constants.Environment.backendServer + "/api/json/v1/1/lookup.php" //need to append query param
        }
    }
}
