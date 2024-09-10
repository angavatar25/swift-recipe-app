//
//  RecipeManagers.swift
//  dogFacts
//
//  Created by Ananda Afryan on 10/09/24.
//

import Foundation

class RecipeManagers {
    func searchRecipe(input: String, recipeData: [RecipeListResponseBody]) -> [RecipeListResponseBody] {
        if (input.isEmpty) {
            return recipeData
        } else {
            return recipeData.filter {$0.title.localizedCaseInsensitiveContains(input)}
        }
    }
}
