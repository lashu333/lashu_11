//
//  PlantDetailsViewController.swift
//  lashu_11
//
//  Created by Lasha Tavberidze on 06.12.24.
//

import UIKit

class PlantDetailsViewController: UIViewController {
    //MARK: Outlets
    @IBOutlet weak var plantName: UILabel!
    @IBOutlet weak var plantImage: UIImageView!
    @IBOutlet weak var plantDescription: UILabel!
    //MARK: Properties
    weak var delegate: PlantDetailsDelegate?
    var plant: Plant?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let plant = plant {
            plantName.text = plant.name
            plantDescription.text = plant.description
            if let image = plant.image {
                plantImage.image = image
            }
            delegate?.didSelectPlant(plant)
        }
        // Do any additional setup after loading the view.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
protocol PlantDetailsDelegate: AnyObject {
    func didSelectPlant(_ plant: Plant)
}
