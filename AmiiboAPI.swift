//
//  AmiiboAPI.swift
//  CollectionViewAPI
//
//  Created by Sean Kang on 2020/10/28.
//

import Foundation

final class AmiiboAPI {
    
    static let shared = AmiiboAPI()
    
    func fetchAmiiboList(onCompletion: @escaping ([Amiibo]) -> ()) {
        let urlString = "http://www.amiiboapi.com/api/amiibo"
        let url = URL(string: urlString)!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else {
                print("data was nil")
                return
            }
            
            guard let amiiboList = try? JSONDecoder().decode(AmiiboList.self, from: data) else {
                 print("Failed to decode")
                return
            }
            onCompletion(amiiboList.amiibo)
            
        }
        task.resume()
    }
}

struct AmiiboList: Codable {
    let amiibo: [Amiibo]
}

struct Amiibo: Codable {
    let amiiboSeries: String
    let character: String
    let gameSeries: String
    let head: String
    let image: String
    let name: String
    let release: AmiiboRelease
    let tail: String
    let type: String
}

struct AmiiboRelease: Codable {
    let au: String?
    let eu: String?
    let jp: String?
    let na: String?
}
