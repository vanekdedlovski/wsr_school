//
//  Comment.swift
//  Alam
//
//  Created by bnkwsr2 on 03.12.2021.
//

import Foundation
import Alamofire

class CommentModule: ObservableObject {
    @Published var Comments:[Comment] = []
    func GetComment() {
        AF.request("https://jsonplaceholder.typicode.com/comments", method: .get)
            .responseDecodable(of: [Comment].self) { res in
                debugPrint(res)
                self.Comments = res.value ?? []
            }
    }
    struct Comment: Decodable {
        let postId : Int
        let id : Int
        let name : String
        let email : String
        let body : String
    }
}

