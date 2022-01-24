//
//  RecipeDetails.swift
//  recipes
//
//  Created by Zaid Jamil on 1/17/22.
//

import SwiftUI
import AVKit

struct RecipeDetails: View {
    var item : Data.resultItem? = nil
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: item?.thumbnail_url ?? "")) { image in
                image.resizable()
                    .cornerRadius(8)
                    .aspectRatio( contentMode: .fit)
            } placeholder: {
                Image(systemName: "info.circle")
                    .frame(width: 120, height: 120)
                    .background(Color.gray.opacity(0.5))
            }
            .frame(width: 120, height: 120)
               
            Text(item?.name ?? "Titel")
                .padding()
            
            
            ScrollView {
                VStack(alignment: .leading, spacing: 8){
                    if(item?.instructions == nil){
                        Text("Recipes video")
                    
                    }else{
                        Text("Ingredients")
                            .font(.headline)
                            .padding(.vertical)
                        ForEach(item?.sections ?? []){ sec in
                            ForEach(sec.components){ comp in
                                Text(comp.raw_text)

                            }
                        }
                        
                        
                    }
                    if(item?.instructions == nil){
                        let player = AVPlayer(url: URL(string: item?.video_url! ?? "")!)
                        VideoPlayer(player: player).frame(width: 400,height: 400).onDisappear {
                            player.pause()
                        }
                    }else{
                        Text("Instructions")
                            .font(.headline)
                            .padding(.vertical)
                        ForEach(item?.instructions ?? []){ detail in
                            Text("* \(detail.display_text)")
                                .padding(8)
                        }
                    }
                }.padding()
                    
            }
         
        }
    }
    
}

//struct RecipeDetails_Previews: PreviewProvider {
//    static var previews: some View {
//        RecipeDetails()
//    }
//}
