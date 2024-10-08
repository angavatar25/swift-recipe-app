//
//  ApiService.swift
//  dogFacts
//
//  Created by Ananda Afryan on 05/09/24.
//

import Foundation

class RecipeService {
    private let mainUrl = "https://api.spoonacular.com"
    private let API_KEY: String = String(ProcessInfo.processInfo.environment["RECIPE_API_KEY"] ?? "")

    func getListOfRecipe() async throws -> [RecipeListResponseBody] {
        guard let url = URL(string: "\(mainUrl)/recipes/complexSearch?number=30&apiKey=\(API_KEY)") else { fatalError("Missing URL") }
        
        let urlRequest = URLRequest(url: url)
        
        let (results, res) = try await URLSession.shared.data(for: urlRequest)

        guard (res as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching") }
        
        let decodedData = try JSONDecoder().decode(Response.self, from: results)
      
        return decodedData.results
    }
    
    func getDetailRecipe(recipeId: Int) async throws -> RecipeDetailDataModel {
        guard let url = URL(string: "\(mainUrl)/recipes/\(recipeId)/information?apiKey=\(API_KEY)") else { fatalError("Missing URL") }
        
        let urlRequest = URLRequest(url: url)
        
        let (data, res) = try await URLSession.shared.data(for: urlRequest)
        
        guard (res as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching") }
        
        let decodedData = try JSONDecoder().decode(RecipeDetailDataModel.self, from: data)
        
        
        return decodedData
    }
}
