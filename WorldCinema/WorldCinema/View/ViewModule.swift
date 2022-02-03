//
//  ViewModule.swift
//  WorldCinema
//
//  Created by bnkwsr2 on 07.12.2021.
//

import Foundation
import Alamofire
class ViewModule : ObservableObject {
    @Published var movieId = ""
    @Published var currentMovie:Filter?
}
