//
//  ListRecipeView.swift
//  dogFacts
//
//  Created by Ananda Afryan on 05/09/24.
//

import SwiftUI

let arrayResponse: [RecipeListResponseBody] = [
    RecipeListResponseBody(id: 1, title: "test", image: "https://img.spoonacular.com/recipes/716406-312x231.jpg", imageType: ".jpg"),
    RecipeListResponseBody(id: 2, title: "test", image: "https://img.spoonacular.com/recipes/716406-312x231.jpg", imageType: ".jpg"),
    RecipeListResponseBody(id: 3, title: "avocado green", image: "https://img.spoonacular.com/recipes/716406-312x231.jpg", imageType: ".jpg"),
]

struct ListRecipeView: View {
    @State private var searchText = ""
    
    var recipeManager = RecipeManagers()
    
    let recipeList: [RecipeListResponseBody]
    
    var recipeFiltered: [RecipeListResponseBody] {
        recipeManager.searchRecipe(input: searchText, recipeData: recipeList)
    }
    
    init(recipeList: [RecipeListResponseBody]) {
        self.recipeList = recipeList
    }

    var body: some View {
        NavigationView {
            VStack {
                TextField("Search Recipe...", text: $searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1.5)
                    )
                Text("Recipe List")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                    .padding(.top, 20)
                ScrollView {
                    VStack {
                        ForEach(recipeFiltered, id: \.id) {recipe in
                            RecipeList(recipeId: recipe.id, imageUrl: recipe.image, reciptTile: recipe.title)
                        }
                    }
                }
                Spacer()
            }.padding()
        }
    }
}

#Preview {
    ListRecipeView(recipeList: arrayResponse)
}
