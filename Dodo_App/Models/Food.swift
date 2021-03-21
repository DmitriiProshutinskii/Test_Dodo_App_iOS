//
//  Food.swift
//  Dodo_App
//
//  Created by Физтех.Радио on 18.03.2021.
//

import Foundation

struct Foods {
    var result: [Food]
}

struct Food: Decodable, Identifiable, Hashable {
    static func == (lhs: Food, rhs: Food) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    var id: UUID
    
    var title: String
    var overview: String
    var price: Int
    var imageURL: URL
    
    init(title:String, overview:String, price: Int, imageURL: URL) {
        self.title = title
        self.overview = overview
        self.price = price
        self.imageURL = imageURL
        self.id = UUID()
    }
}
