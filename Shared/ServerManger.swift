//
//  ServerManger.swift
//  recipes
//
//  Created by Zaid Jamil on 1/17/22.
//

import Foundation

class  ServerManger: ObservableObject {
    @Published var list = [Data.resultItem]()
    
    var from : Int = 0
    var searched : String = ""
    
    func fetch(){
        guard let url = URL(string: "https://tasty.p.rapidapi.com/recipes/list?from=\(from)&size=10&tags=easy&q=\(searched)") else{return}
        
        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        let headers = [
            "x-rapidapi-host": "tasty.p.rapidapi.com",
            "x-rapidapi-key": "8833ae11d1msh9ea6cd30a4c66eap1ef146jsnc3323f97e0c0"
        ]
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        URLSession.shared.dataTask(with: request) { data, reps, error in
            if(error != nil){
                print(error!)
            }else{
                guard let res = data else {return}
                do{
                    let dictionary = try JSONDecoder().decode(Data.self, from: res)
                    DispatchQueue.main.async {
//                        print(dictionary)
                        self.list.append(contentsOf: dictionary.results)
                        }
                }catch{
                    print("Error parsing data")
                    print(error)
                }
                
            }
        }.resume()
    }
    
    func fetchSearch (search : String) {
        guard let url = URL(string: "https://tasty.p.rapidapi.com/recipes/list?from=0&size=10&tags=easy&q=\(search)") else{return}
        
        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        let headers = [
            "x-rapidapi-host": "tasty.p.rapidapi.com",
            "x-rapidapi-key": "8833ae11d1msh9ea6cd30a4c66eap1ef146jsnc3323f97e0c0"
        ]
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        URLSession.shared.dataTask(with: request) { data, reps, error in
            if(error != nil){
                print(error!)
            }else{
                guard let res = data else {return}
                do{
                    let dictionary = try JSONDecoder().decode(Data.self, from: res)
                    DispatchQueue.main.async {
//                        print(dictionary)
                        self.searched = search
                        self.from = 0
                        self.list = dictionary.results
                        }
                }catch{
                    print("Error parsing data")
                    print(error)
                }
                
            }
        }.resume()
    }
}
