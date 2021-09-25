//
//  EmptyPokemon.swift
//  labz
//
//  Created by Alexander Rojas Benavides on 9/25/21.
//

import SwiftUI

struct EmptyPokemon: View {
    var body: some View {
        VStack {
            Image("pokemonEgg")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100, alignment: .center)
            Text("Este pokemon no ha eclosionado todavia!")
                .font(.title2)
                .fontWeight(.heavy)
        }
    }
}

struct EmptyPokemon_Previews: PreviewProvider {
    static var previews: some View {
        EmptyPokemon()
    }
}
