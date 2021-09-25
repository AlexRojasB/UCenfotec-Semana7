//
//  APIExtensions.swift
//  labz
//
//  Created by Alexander Rojas Benavides on 9/25/21.
//

import Foundation
extension API {
    static func getPokemonListByName(pokemonName: String, page: Int, pageSize: Int = 20) -> URLRequest {
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://\(pokemonHost)/cards?q=name:\(pokemonName)&page=\(page)&pageSize=\(pageSize)")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        return request as URLRequest
    }
}
