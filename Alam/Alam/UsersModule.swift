//
//  UsersModule.swift
//  Alam
//
//  Created by bnkwsr2 on 03.12.2021.
//

import Foundation
import Alamofire

class UsersModule: ObservableObject {
    @Published var Users:[User] = []
    func GetUsers() {
        AF.request("https://jsonplaceholder.typicode.com/users", method: .get)
            .responseDecodable(of: [User].self) { res in
                debugPrint(res)
                self.Users = res.value ?? []
            }
    }
    struct User : Codable {
        let id : Int
        let name : String
        let username : String
        let email : String
        let address : Address
        let phone : String
        let website : String
        let company : Company
    }
    struct Address : Codable {
        let street : String
        let suite : String
        let city : String
        let zipcode : String
        let geo : Geo
    }
    struct Geo : Codable {
        let lat : String
        let lng : String
    }
    struct Company : Codable {
        let name : String
        let catchPhrase : String
        let bs : String
    }
}
