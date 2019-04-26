//
//  ViewController.swift
//  networking_example
//
//  Created by nakama on 26/04/19.
//  Copyright © 2019 nakama. All rights reserved.
//

import UIKit
import Moya

class ViewController: UIViewController {

    private let provider = MoyaProvider<TokopediaProductTarget>()
    private let jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()

    private func loadData() {
        provider
            .request(.fetchProduct(query: "samsung", priceMin: 5000000, priceMax: 10000000, start: 0, rows: 10)) { [weak self] result in
            guard let `self` = self else { return }
            switch result {
            case .success(let value):
                let data = value.data
                do {
                    let mappedResponse = try self.jsonDecoder.decode(ProductResponse.self, from: data)
                    print(mappedResponse)
                } catch (let decodeError) {
                    print(decodeError)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        
    }

}

