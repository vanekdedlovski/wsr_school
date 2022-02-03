//
//  MoviesModule.swift
//  Alam
//
//  Created by bnkwsr2 on 04.12.2021.
//

import Foundation
import Alamofire

class MoviesModule : ObservableObject {
    @Published var movie : Movie?
    func GetMovies() {
        AF.request("http://cinema.areas.su/movies/cover", method: .get)
            .responseDecodable(of: Movie.self) { res in
                debugPrint(res)
                self.movie = res.value
            }
    }
    struct Movie : Codable {
        let movieId : String
        let backgroundImage : String
        let foregroundImage : String
    }
}
