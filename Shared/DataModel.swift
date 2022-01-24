//
//  حه.swift
//  recipes (iOS)
//
//  Created by Zaid Jamil on 1/10/22.
//

import Foundation
import SwiftUI

class Data: Codable {
    var results:[resultItem]=[resultItem]()
    
    class resultItem: Codable,Identifiable{
        var id:Int
        let thumbnail_url:String
        let name:String
        let instructions:[instructionItems]?//added a ? here becuse its an optional property it could be nil
        let sections:[sectionItems]?
        let video_url:String?
    }
    
    class instructionItems: Codable,Identifiable{
        var id:Int
        let display_text:String
    }
    
    class sectionItems: Codable,Identifiable{
        var id:Int?
        let components:[componentItems]
    }
    
    class componentItems: Codable,Identifiable{
        var id:Int
        let raw_text:String
        let ingredient:IngredentItem
    }
    class IngredentItem: Codable {
        var id: Int
        let name: String
    }
}






