//
//  MainModule.swift
//  WorldCinema
//
//  Created by bnkwsr2 on 30.11.2021.
//

import Foundation
import Alamofire

class MainModule: ObservableObject {
    @Published var isLogin = true
    @Published var login = "vasya@mail.com"
    @Published var password = "qwerty"
    @Published var password2 = "qwerty"
    @Published var firstName = "John"
    @Published var lastName = "Johnson"
    @Published var Register = ""

    
    @Published var error = ""
    @Published var token = ""
    
    @Published var filter = "inTrend"
    @Published var Filters:[Filter] = []
    @Published var  movie:Filter?
    
    @Published var MoviesCover:[MovieCover] = []
    @Published var Episodes:[Episode] = []
    
    func loginIn() {
        if (login == "" || password == "") {
            error = "Заполните все поля"
            return
        }
        let loginStruct = Login(email: login, password: password)
        error = ""
        token = ""
        
        AF.request("http://cinema.areas.su/auth/login",
                   method: .post,
                   parameters: loginStruct,
                   encoder: JSONParameterEncoder.default)
            .responseDecodable(of: TokenType.self) { [self] response in
                debugPrint(response)
                
                if (response.value?.token != nil) {
                    debugPrint(response.value?.token)
                    token = String(response.value!.token)
                    
                }
            }
            .responseString { [self] response in
                if (token == "") {
                    debugPrint(response.value)
                    error = response.value ?? ""
                }
                
            }
       
    }
    
    func RegisterIn() {
        if (firstName == "" || lastName == "" || login == "" || password == "" || password2 == "") {
            error = "Заполните все поля"
            return
            
        }
        let RegisterStruct =  WorldCinema.Register(firstname: "John", lastname: "Johnson", email: "vasya@mail.com", password: "qwerty")
        AF.request("http://cinema.areas.su/auth/register",
                   method: .post,
                   parameters: RegisterStruct,
                   encoder: JSONParameterEncoder.default)
            .responseString() { [self] response in
                debugPrint(response)
                
            }
        
    }
    
    func GetMovies() {
        AF.request("http://cinema.areas.su/movies?filter=\(filter)", method: .get)
            .responseDecodable(of: [Filter].self) { res in
                self.Filters = res.value ?? []
            }
    }
    func GetLast() {
        var headers = HTTPHeaders()
        headers.add(HTTPHeader(name: "Authorization", value: "Bearer \(254570)"))

        AF.request("http://cinema.areas.su/usermovies?filter=lastView", method: .get, headers: headers)
            .responseDecodable(of: [Filter].self) { res in
                debugPrint(res)
                self.movie = res.value?.first
            }
    }
    func GetCover() {
        AF.request("http://cinema.areas.su/movies/cover", method: .get)
            .responseDecodable(of: [MovieCover].self) { res in
                debugPrint(res)
                self.MoviesCover = res.value ?? []
            }
    }
    func GetEpisode() {
        AF.request("http://cinema.areas.su/movies/1/episodes", method: .get)
            .responseDecodable(of: [Episode].self) { res in
                debugPrint(res)
                self.Episodes = res.value ?? []
            }
        
    }
   
}
struct Login: Encodable {
    let email : String
    let password : String
}
struct Register: Encodable {
    let firstname: String
    let lastname : String
    let email : String
    let password : String
}
struct TokenType: Decodable {
    let token: Int
    
}
struct Filter : Codable {
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
struct MovieCover : Codable {
    let movieId : String
    let backgroundImage : String
    let foregroundImage : String
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
