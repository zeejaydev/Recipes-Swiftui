//
//  mainView.swift
//  recipes (iOS)
//
//  Created by Zaid Jamil on 1/9/22.
//

import SwiftUI

struct mainView: View {
    @ObservedObject var serverManger = ServerManger()
    @State private var search : String = ""
    var body: some View {
        NavigationView {
            VStack{
                //Search Bar
                HStack{
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(Color(red: 0.9921568627450981, green: 0.5019607843137255, blue: 0.3803921568627451))
                    TextField("Search recipes", text: $search).onChange(of: search) { newValue in
                        if(newValue.count >= 4){
                            serverManger.fetchSearch(search: search)
                        }
                    }
                    }.padding()
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1).foregroundColor(Color(red: 0.7490196078431373, green: 0.7764705882352941, blue: 0.8627450980392157)))
                        .padding(.horizontal)
                // Recipes View
                ScrollView{
                    if serverManger.list.count < 1{
                        VStack{
                            ProgressView()
                        }.frame(width: 400, height:500)
                    }else {
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 140),spacing:16)],spacing: 20) {
                           
                            ForEach(serverManger.list){ item in
                                NavigationLink(destination: RecipeDetails(item: item) ){
                                    RecipesView(item: item)
                                }.buttonStyle(PlainButtonStyle())
                            }
                            if serverManger.from < 100 {
                                ProgressView()
                                    .multilineTextAlignment(.center)
                                    .onAppear {
                                    serverManger.from += 10
                                    serverManger.fetch()
                                }
                            }
                        }
                        
                    }
                }
            }.navigationTitle("Discover")
        }.onAppear {
            serverManger.fetch()
        }
    }
}

struct mainView_Previews: PreviewProvider {
    static var previews: some View {
        mainView()
    }
}
