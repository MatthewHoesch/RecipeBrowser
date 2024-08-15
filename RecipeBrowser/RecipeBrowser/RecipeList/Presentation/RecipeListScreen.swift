//
//  ContentView.swift
//  RecipeBrowser
//
//  Created by Matthew Hoesch on 8/15/24.
//

import SwiftUI

struct RecipeListScreen: View {
    @StateObject var viewModel: RecipeListViewModel
    @Environment(\.horizontalSizeClass) var sizeClass

    init(viewModel: RecipeListViewModel = .init()) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .task {
            await viewModel.getInitalState()
        }
    }
}

#Preview {
    RecipeListScreen()
}
