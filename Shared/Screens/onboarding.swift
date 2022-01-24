//
//  onboarding.swift
//  recipes (iOS)
//
//  Created by Zaid Jamil on 1/9/22.
//

import SwiftUI

struct onboarding: View {
    @Binding var firstTime:Bool
    var body: some View {
        
        TabView {
            
            
            VStack {
                Spacer()
                Text("Recipes App")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(Color(hue: 0.463, saturation: 0.771, brightness: 0.586)
                    )
                Spacer()
            }.background(Image("background")
                            .resizable()
                            .scaledToFill()
                            ).edgesIgnoringSafeArea(.all)
                
                
            
            VStack{
                Image("firstImage")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .edgesIgnoringSafeArea(.top)
               
                VStack(alignment: .leading, spacing: 16) {
                    Text("Happy Cooking")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .foregroundColor(Color(red: 0.0784313725490196, green: 0.38823529411764707, blue: 0.32941176470588235))
//                        .border(Color.green)
                    Text("Discover millions of recipes, Healthy, American, Indian...etc ")
                        .font(.body)
                        
                        .foregroundColor(Color(red: 0.0784313725490196, green: 0.38823529411764707, blue: 0.32941176470588235))
                    Button(action: {
                        firstTime.toggle()
                    }, label: {
                        Text("Get the recipes")
                            .foregroundColor(Color.white)
                            .padding()
                    }).background(Color(red: 0.9921568627450981, green: 0.5019607843137255, blue: 0.3803921568627451)).cornerRadius(/*@START_MENU_TOKEN@*/8.0/*@END_MENU_TOKEN@*/)
                    
                }
                .padding(5)
                Spacer()
                
            }
        }.background(Color.white)
        .edgesIgnoringSafeArea(.all)
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
        
    }
}

struct onboarding_Previews: PreviewProvider {
    static var previews: some View {
//        onboarding() passed the binded view insted
        ContentView()
.previewInterfaceOrientation(.portrait)
    }
}
