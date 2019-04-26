//
//  TokopediaProductTarget.swift
//  networking_example
//
//  Created by nakama on 26/04/19.
//  Copyright © 2019 nakama. All rights reserved.
//

import Foundation
import Moya

enum TokopediaProductTarget {
    case fetchProduct(query: String, priceMin: Double, priceMax: Double, start: Int, rows: Int)
}

extension TokopediaProductTarget: TargetType {
    var baseURL: URL {
        return URL(string: "https://ace.tokopedia.com")!
    }
    
    var path: String {
        switch self {
        case .fetchProduct:
            return "/search/v2.5/product"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case let .fetchProduct(query, priceMin, priceMax, start, rows):
            let params: [String: Any] = [
                "q": query,
                "pmin": priceMin,
                "pmax": priceMax,
                "start": start,
                "rows": rows
            ]
            return Task.requestParameters(parameters: params, encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    
}
