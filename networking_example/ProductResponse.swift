//
//  ProductResponse.swift
//  networking_example
//
//  Created by nakama on 26/04/19.
//  Copyright © 2019 nakama. All rights reserved.
//

import Foundation

struct ProductResponse: Decodable {
    let status: ProductResponseStatus?
    let header: ProductResponseHeader?
    let data: [ProductResponseData]?
}

struct ProductResponseStatus: Decodable {
    let errorCode: Int
    let message: String
}

struct ProductResponseHeader: Decodable {
    let totalData: Int
    let totalDataNoCategory: Int
    let additionalParams: String
    let processTime: Double
    let suggestionInstead: String?
}

struct ProductResponseData: Decodable {
    let name: String
    let id: Int
    let price: String
    let imageUri: String
}
