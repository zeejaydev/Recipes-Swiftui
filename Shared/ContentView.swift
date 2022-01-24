//
//  ContentView.swift
//  Shared
//
//  Created by Zaid Jamil on 1/9/22.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("firstTime") var firstTime:Bool = true
    var body: some View {
        if firstTime {
            onboarding(firstTime: $firstTime)
        }else{
            mainView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    @State var firstTime:Bool = true
    static var previews: some View {
        ContentView()
    }
}
