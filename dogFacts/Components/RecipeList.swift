//
//  RecipeList.swift
//  dogFacts
//
//  Created by Ananda Afryan on 05/09/24.
//

import SwiftUI

struct RecipeList: View {
    var recipeId: Int
    var imageUrl: String
    var reciptTile: String

    var body: some View {
        NavigationLink(destination: RecipeDetailView(recipeId: recipeId)) {
            HStack(alignment: .center) {
                AsyncImage(url: URL(string: imageUrl)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .clipped()
                        .cornerRadius(5.0)
                } placeholder: {
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                        .foregroundColor(.gray)
                }
                Text(reciptTile)
                    .font(.system(size: 20))
                    .fontWeight(.medium)
                    .foregroundColor(.black)
                Spacer()
            }
        }
    }
}

#Preview {
    RecipeList(recipeId: 1, imageUrl: "https://img.spoonacular.com/recipes/715415-312x231.jpg", reciptTile: "testtestertoketkeotkektjrkgrkgrkgrgnrjgnrjgnjgnrgj")
}
