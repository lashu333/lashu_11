//
//  PlantDataSource.swift
//  lashu_11
//
//  Created by Lasha Tavberidze on 06.12.24.
//

import UIKit

struct PlantDataSource{
    static let shared = PlantDataSource()
    let plants: [Plant] = [
       Plant(name: "leaf", image: UIImage(named: "leaf"), description: "A verdant leaf extending from a branch, showcasing intricate venation patterns and subtle color gradients. Its surface reflects light with a translucent quality, representing the delicate complexity of photosynthetic structures in nature."),
       
       Plant(name: "tree", image: UIImage(named: "tree"), description: "A mature tree with extensive root systems and a robust trunk, demonstrating decades of growth through its textured bark and complex branching architecture. Multiple layers of foliage create depth and intricate silhouettes against the surrounding landscape."),
       
       Plant(name: "flower", image: UIImage(named: "flower"), description: "An elegant botanical specimen with multiple layered petals, revealing intricate geometric patterns and subtle color transitions. Its reproductive structures are strategically positioned, showcasing the sophisticated design of flowering plant reproductive mechanisms."),
       
       Plant(name: "frozen Bubble", image: UIImage(named: "deadNature"), description: "A crystalline formation representing the intersection of water and extreme temperature, capturing the moment of phase transition. Surface tensions and microscopic structural variations create complex geometric patterns within the frozen medium."),
       
       Plant(name: "flower on a tree", image: UIImage(named: "someTree"), description: "A vibrant floral element emerging from a tree's branch, creating a striking visual contrast between its intense coloration and the surrounding green foliage. The flower represents a singular moment of botanical reproductive potential within a complex ecological system."),
       
       Plant(name: "pretty view", image: UIImage(named: "view"), description: "A comprehensive landscape revealing multiple topographical layers, displaying intricate interactions between geological formations, vegetation patterns, and atmospheric conditions. Depth and perspective create a complex visual narrative of environmental interconnectedness."),
       
       Plant(name: "wiwvebi", image: UIImage(named: "wiwvebi"), description: "Dense vegetation characterized by multiple green tones and complex textural elements, representing a rich ecological microenvironment. The plants demonstrate sophisticated adaptation strategies, with varied leaf structures and growth patterns indicating resilience and environmental interaction.")
    ]
}
