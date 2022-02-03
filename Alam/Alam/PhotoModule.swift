//
//  PhotoModule.swift
//  Alam
//
//  Created by bnkwsr2 on 03.12.2021.
//

import Foundation
import Alamofire
import Kingfisher
class PhotoModule: ObservableObject {
    @Published var Photos:[Photo] = []
    func GetPhotos() {
        AF.request("https://jsonplaceholder.typicode.com/photos", method: .get)
            .responseDecodable(of: [Photo].self) { res in
                debugPrint(res)
                self.Photos = res.value ?? []
            }
    }
    struct Photo: Decodable {
        let albumId : Int
        let id : Int
        let title : String
        let url : String
        let thumbnailUrl : String
    }
}
