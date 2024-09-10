//
//  RecipeDetailDataModel.swift
//  dogFacts
//
//  Created by Ananda Afryan on 09/09/24.
//

import Foundation

public struct RecipeDetailDataModel: Decodable {
    var image: String
    var title: String
    var cookingMinutes: Float?
    var pricePerServing: Float?
    var summary: String
    var extendedIngredients: [IngredientsDataModel]
}

public struct IngredientsDataModel: Decodable {
    var id: Int
    var nameClean: String
    var amount: Float
    var unit: String
}
