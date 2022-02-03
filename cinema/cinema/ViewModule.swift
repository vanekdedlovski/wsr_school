//
//  ViewModule.swift
//  cinema
//
//  Created by bnkwsr2 on 10.12.2021.
//

import Foundation
import Alamofire
class ViewModule: ObservableObject {
    @Published var movieId = ""
    @Published var CurrentMovie:Movie?
    
    func getCurrentMovie() {
        AF.request("http://cinema.areas.su/movies/\(movieId)")
            .responseDecodable(of: Movie.self) { res in
                self.CurrentMovie = res.value
            }
    }
}
