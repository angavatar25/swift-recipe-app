//
//  DogBreedDataModel.swift
//  dogFacts
//
//  Created by Ananda Afryan on 05/09/24.
//

import Foundation

public struct Response: Decodable {
    var results: [RecipeListResponseBody]
}

public struct RecipeListResponseBody: Decodable {
    var id: Int
    var title: String
    var image: String
    var imageType: String
}
