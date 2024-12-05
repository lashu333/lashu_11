//
//  Plant.swift
//  lashu_11
//
//  Created by Lasha Tavberidze on 05.12.24.
//
import UIKit

struct Plant{
    var name: String
    var image: UIImage?
    var description: String
    init(name: String, image: UIImage? = nil, description: String) {
        self.name = name
        self.image = image
        self.description = description
    }
    
}
