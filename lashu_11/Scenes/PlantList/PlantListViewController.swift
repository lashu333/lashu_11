//
//  PlantListViewController.swift
//  lashu_11
//
//  Created by Lasha Tavberidze on 05.12.24.
//

import UIKit

class PlantListViewController: UIViewController {
    // MARK: Outlets
    @IBOutlet weak var recentlyOpenedPlantImage: UIImageView!
    @IBOutlet weak var PlantTableView: UITableView!
    // MARK: Properties
    let plants: [Plant] = [Plant(name: "leaf", image: UIImage(named: "leaf") , description: "very green leaf"), Plant(name: "tree", image: UIImage(named: "tree"), description: "pretty long tree"), Plant(name: "flower", image:UIImage(named: "flower") , description: "pretty pretty flower")]
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        PlantTableView.dataSource = self
        PlantTableView.register(UINib(nibName: "PlantTableViewCell", bundle: nil), forCellReuseIdentifier: "PlantCellViewID")
        
    }
    
    
}
extension PlantListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        plants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlantCellViewID", for: indexPath) as! PlantTableViewCell
        let plant = plants[indexPath.row]
        cell.plantName?.text = plant.name
        cell.plantDescription?.text = plant.description
        if let image = plant.image {
            cell.plantImage?.image = image
        }
        return cell
    }
}

