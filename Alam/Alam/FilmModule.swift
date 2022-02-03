//
//  FilmModule.swift
//  Alam
//
//  Created by bnkwsr2 on 04.12.2021.
//

import Foundation
import Alamofire

class FilmModule : ObservableObject {
    @Published var film : Film?
    func GetFilms() {
        AF.request("http://cinema.areas.su/movies/1", method: .get)
            .responseDecodable(of: Film.self) { res in
                    debugPrint(res)
                self.film = res.value
            }
    }
    struct Film : Codable {
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
