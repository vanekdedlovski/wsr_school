//
//  AlbumsModule.swift
//  Alam
//
//  Created by bnkwsr2 on 03.12.2021.
//

import Foundation
import Alamofire

class AlbumsModule: ObservableObject {
    @Published var AlbumsS:[Albums] = []
    func GetAlbums() {
        AF.request("https://jsonplaceholder.typicode.com/albums", method: .get)
            .responseDecodable(of: [Albums].self) { res in
                debugPrint(res)
                self.AlbumsS = res.value ?? []
            }
    }
    struct Albums: Decodable {
        let userId : Int
        let id : Int
        let title : String
        
    }
}
