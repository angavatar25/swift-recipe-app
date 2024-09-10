//
//  RecipeDetailView.swift
//  dogFacts
//
//  Created by Ananda Afryan on 09/09/24.
//

import SwiftUI

struct RecipeDetailView: View {
    let recipeId: Int

    let imageDummy: String = "https://img.spoonacular.com/recipes/716406-312x231.jpg"
    
    var foodRecipeManager = RecipeService()
    
    @State var recipeDetail: RecipeDetailDataModel?

    var body: some View {
        if let recipeDetail = recipeDetail {
            ScrollView {
                VStack(alignment: .leading) {
                    AsyncImage(url: URL(string: recipeDetail.image)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipped()
                    } placeholder: {
                        Image(systemName: "photo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40)
                            .foregroundColor(.gray)
                    }
                    VStack(alignment: .leading, spacing: 10) {
                        Text(recipeDetail.title)
                            .font(.system(size: 35))
                            .fontWeight(.bold)
                        HStack {
                            HStack {
                                Image(systemName: "clock")
                                    .foregroundColor(.gray)
                                Text("\(String(recipeDetail.cookingMinutes ?? 0)) min")
                            }
                            HStack {
                                Image(systemName: "dollarsign.circle")
                                    .foregroundColor(.gray)
                                Text("$\(String(recipeDetail.pricePerServing ?? 0))")
                            }
                        }
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Description")
                                .fontWeight(.bold)
                            Text(recipeDetail.summary).font(.system(size: 13))
                        }.padding(.vertical, 20)
                        VStack(alignment: .leading) {
                            Text("Ingredients")
                                .fontWeight(.bold)
                            VStack {
                                ForEach(recipeDetail.extendedIngredients, id: \.id) { detail in
                                    HStack {
                                        Text(detail.nameClean .capitalized)
                                            .padding(10)
                                        Spacer()
                                        Text("\(detail.amount) \(detail.unit)")
                                            .padding(10)
                                    }.background(.gray)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                }
                            }
                        }
                    }.padding(20)
                }
                Spacer()
            }
        } else {
            LoadingView().task {
                do {
                    print(recipeId)
                    recipeDetail = try await foodRecipeManager.getDetailRecipe(recipeId: recipeId)
                } catch {
                    print("Err: \(error)")
                }
            }

        }
    }
}

#Preview {
    RecipeDetailView(recipeId: 1)
}
