//
//  FilterModule.swift
//  Alam
//
//  Created by bnkwsr2 on 04.12.2021.
//

import Foundation
import Alamofire
class FilterModule : ObservableObject {
    @Published var Filter = "inTrend"
    @Published var Filters:[Filter] = []
    func GetFilter() {
        AF.request("http://cinema.areas.su/movies\(Filter)", method: .get)
            .responseDecodable(of: [Filter].self) { res in
                    debugPrint(res)
                self.Filters = res.value ?? []
            }
    }
    struct Filter : Codable {
        let movieId : String
        let name : String
        let description : String
        let age : String
        let images : [String]
        let poster : String
        let tags : [Tag]
        
        
        
    }
    struct Tag : Codable {
        let idTags : String
        let tagName : String
    }
}
