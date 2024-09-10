//
//  ContentView.swift
//  dogFacts
//
//  Created by Ananda Afryan on 05/09/24.
//

import SwiftUI

struct ContentView: View {
    var foodRecipeManager = RecipeService()
    
    @State var recipeList: [RecipeListResponseBody]?

    var body: some View {
        ZStack(alignment: .center) {
            if let recipeList = recipeList {
                ListRecipeView(recipeList: recipeList)
            } else {
                LoadingView().task {
                    do {
                        recipeList = try await foodRecipeManager.getListOfRecipe()
                    } catch {
                        print("Error getting recipe: \(error)")
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
