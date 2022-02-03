//
//  MainModule.swift
//  ozon
//
//  Created by bnkwsr2 on 13.01.2022.
//

import Foundation
import Alamofire

class MainModule : ObservableObject {
    @Published var poiks = ""
    @Published var categor:[AllCategories] = []
    @Published var Allproduct:[Product] = []
    func GetCategories() {
//        AF.request("https://fakestoreapi.com/products/categories", method: .get)
//            .responseDecodable(of: [AllCategories].self) { res in
//
//                self.categor = res.value ?? []
//            }
        categor = [AllCategories(categories: "electronics"), AllCategories(categories: "jewelery"), AllCategories(categories: "men's clothing"), AllCategories(categories: "women's clothing")]
    }
    func GetProduct() {
        AF.request("https://fakestoreapi.com/products", method: .get)
            .responseDecodable(of: [Product].self) { res in
                debugPrint(res)
                self.Allproduct = res.value ?? []
            }
    }
}
struct AllCategories : Codable {
    let categories : String
  
}
struct Product : Codable {
    let id : Int
    let title : String
    let price : Double
    let description : String
    let category : String
    let image : String
    let rating : AllRating
}
struct AllRating : Codable {
    let rate : Double
    let count : Int
}
