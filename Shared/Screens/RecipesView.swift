//
//  RecipesView.swift
//  recipes
//
//  Created by Zaid Jamil on 1/17/22.
//

import SwiftUI

struct RecipesView: View {
    var item : Data.resultItem? = nil
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: item?.thumbnail_url ?? "" )) { image in
                image.resizable()
                    .cornerRadius(8)
                    .aspectRatio( contentMode: .fit)
                    
            } placeholder: {
                Image(systemName: "info.circle")
                    .frame(width: 120, height: 120)
                    .background(Color.gray.opacity(0.5))
            }
            
            Text(item?.name ?? "title")
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .padding(.vertical,8)
                .fixedSize(horizontal: false, vertical: true)
                
        }.padding()
    }
}

struct RecipesView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesView()
    }
}
