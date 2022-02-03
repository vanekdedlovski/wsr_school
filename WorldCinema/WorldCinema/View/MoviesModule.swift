//
//  MoviesModule.swift
//  WorldCinema
//
//  Created by bnkwsr2 on 06.12.2021.
//

import Foundation
import Alamofire
class FilterModule : ObservableObject {
    @Published var filter = "inTrend"
    @Published var Filters:[Filter] = []
    func GetMovies() {
        AF.request("http://cinema.areas.su/movies\(filter)", method: .get)
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
