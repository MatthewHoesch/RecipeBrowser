import SwiftUI

struct MealListView: View {
    @StateObject var viewModel: MealListViewModel

    var body: some View {
        NavigationView {
            switch viewModel.mealsState {
            case .loading:
                ProgressView()
                    .onAppear {
                        Task {
                            await viewModel.loadMeals()
                        }
                    }
            case .success(let meals):
                List(meals, id: \.id) { meal in
                        Text(meal.name)
                }
            case .failure(let error):
                Text("Error: \(error.localizedDescription)")
            }
        }
    }
}
