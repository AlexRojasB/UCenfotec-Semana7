//
//  PokemonCard.swift
//  labz
//
//  Created by Alexander Rojas Benavides on 9/25/21.
//

import Foundation
class PokemonCard: Hashable, Codable {
    static func == (lhs: PokemonCard, rhs: PokemonCard) -> Bool {
        lhs.id == rhs.id
    }
    
    let id: String
    let name: String
    let images: PokemonImage
    var offset: Int?
    
    private enum CodingKeys: String, CodingKey {
           case id, name, images
    }
    
    func hash(into hasher: inout Hasher) {
          hasher.combine(id)
          hasher.combine(name)
      }
}

