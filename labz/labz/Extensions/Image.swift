//
//  Image.swift
//  labz
//
//  Created by Alexander Rojas Benavides on 9/25/21.
//

import SwiftUI

extension Image {
    func data(url:URL) -> Self {
        if let data = try? Data(contentsOf: url) {
            guard let image = UIImage(data: data) else {
                return Image(systemName: "square.fill")
            }
            return Image(uiImage: image)
                .resizable()
        }
        return self
            .resizable()
    }
}
