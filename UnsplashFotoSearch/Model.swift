//
//  Model.swift
//  UnsplashFotoSearch
//
//  Created by Стас Жингель on 22.09.2021.
//

import Foundation

let accessKey = "s9Rcmxkag-IqMsZibpRBIqnRXFnMiBxHMNEUj5Ik33M"

struct APIResponse: Decodable {
    let total: Int
    let total_pages: Int
    let results: [Result]
}

struct Result: Decodable {
    let id: String
    let urls: URLS
}

struct URLS: Decodable {
    let regular: String
}
