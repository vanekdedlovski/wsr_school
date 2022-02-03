//
//  PostModule.swift
//  Alam
//
//  Created by bnkwsr2 on 03.12.2021.
//

import Foundation
import Alamofire

class PostModule: ObservableObject {
    @Published var isClick = ""
    @Published var  Posts:[Post] = []
    func GetPost() {
        AF.request("https://jsonplaceholder.typicode.com/posts", method: .get)
            .responseDecodable(of: [Post].self) { res in
                debugPrint(res)
                self.Posts = res.value ?? []
            }
    }
    struct Post: Decodable {
        let userId : Int
        let id : Int
        let title : String
        let body : String
    }
}

