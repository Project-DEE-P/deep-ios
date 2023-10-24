//
//  Response.swift
//  DEEP-iOS
//
//  Created by 이민규 on 10/24/23.
//

import Foundation

struct Response: Codable {
    let status: Int
    let message: String
}

class DataResponse<T: Codable>: Codable {
    var status: Int
    var message: String
    var data: T
}
