//
//  TodosModule.swift
//  Alam
//
//  Created by bnkwsr2 on 03.12.2021.
//

import Foundation
import Alamofire

class TodosModule: ObservableObject {
    @Published var Todos:[Todo] = []
    func GetTodos() {
        AF.request("https://jsonplaceholder.typicode.com/todos", method: .get)
            .responseDecodable(of: [Todo].self) { res in
                debugPrint(res)
                self.Todos = res.value ?? []
            }
    }
    struct Todo: Decodable {
        let userId : Int
        let id : Int
        let title : String
        let completed : Bool
    }
}
