//
//  MainModule.swift
//  cinema
//
//  Created by bnkwsr2 on 08.12.2021.
//

import Foundation
import Alamofire
import Kingfisher
import SwiftUI

class MainModule : ObservableObject {
    @Published var firstName = "John"
    @Published var lastName = "Johnson"
    @Published var email = "vasya@mail.com"
    @Published var password = "qwerty"
    @Published var password2 = "qwerty"
    @Published var error = ""
    @AppStorage("token") var token = ""
    @Published var isPresent = false
    @Published var Covers:Cover?
    @Published var Filter = "inTrend"
    @Published var Movies:[Movie] = []
    @Published var movie:Movie?
    @Published var Episodes:[Episode] = []

    func LoginLn(success : @escaping () -> Void)
    {
        if (email == "" || password == "") {
            error = "Заполните все поля"
            return
        }
        
        let login = Login(email: email, password: password)
        token = ""
        error = ""
        AF.request("http://cinema.areas.su/auth/login", method: .post, parameters: login)
            .responseDecodable(of: TokenType.self) { res in
                self.token = "\(res.value!.token)"
                success()
            }
            .responseString { [self] res in
                if (token == "") {
                    error = res.value ?? ""
                    isPresent = true
                }
            }
    }
    func RegisterLn() {
        if (email == "" || password == "" || firstName == "" || lastName == "") {
            error = "Заполните поля"
            isPresent = true
            return
        }
        if (password != password2) {
            error = "Проверьте корректность пароля"
            isPresent = true
            return
        }

        let register = Register(email: email, password: password, firstName: firstName, lastName: lastName)
        AF.request("http://cinema.areas.su/auth/register", method: .post, parameters: register)
            .responseString { [self] res  in
                error = "Успешная регистрация"
                isPresent = true
            }
    }
    func GetCover() {
        AF.request("http://cinema.areas.su/movies/cover",method: .get)
            .responseDecodable(of: Cover.self) { res in
                self.Covers = res.value
            }
    }
    func GetMovies() {
        AF.request("http://cinema.areas.su/movies?filter=\(Filter)")
            .responseDecodable(of: [Movie].self) { res in
                self.Movies = res.value ?? []
            }
    }
    func GetUsersMovies() {
        var headers = HTTPHeaders()
        headers.add(HTTPHeader(name: "Authorization", value: "Bearer \(token)"))
        debugPrint(headers)
        AF.request("http://cinema.areas.su/usermovies?filter=lastView", method: .get, headers: headers)
            .responseDecodable(of: [Movie].self) {
                res in
                self.movie = res.value?.last
            }
    }
    func GetEpisode(movieId : String) {
        AF.request("http://cinema.areas.su/movies/\(movieId)/episodes")
            .responseDecodable(of: [Episode].self) { res in
                self.Episodes = res.value ?? []
                debugPrint(res)
            }
    }
}
struct Login : Encodable {
    let email : String
    let password : String
}
struct TokenType : Decodable {
    let token : Int
}

struct Register : Encodable {
    let email : String
    let password : String
    let firstName : String
    let lastName : String
}

struct Cover : Codable {
    let movieId : String
    let backgroundImage : String
    let foregroundImage : String
}
struct Movie : Codable {
    let movieId : String
    let name : String
    let description : String
    let age : String
    let images : [String]?
    let poster : String
    let tags : [Tag]?
}
struct Tag : Codable {
    let idTags : String
    let tagName : String
}
struct Episode : Codable {
    let episodeId : String
    let name : String
    let description : String
    let director : String
    let stars : [String]?
    let year : String
    let images : [String]?
    let runtime : String
    let preview : String
    let moviesId : String
}
