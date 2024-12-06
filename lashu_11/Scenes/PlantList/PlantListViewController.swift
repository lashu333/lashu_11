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
    @IBOutlet weak var plantTableView: UITableView!
    // MARK: Properties
    let plants = PlantDataSource.shared.plants
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        recentlyOpenedPlantImage.image = plants[0].image
        // Do any additional setup after loading the view.
        if 541 > plants.count * 110{
            plantTableView.isScrollEnabled = false
        }
        plantTableView.dataSource = self
        plantTableView.delegate = self
        plantTableView.register(UINib(nibName: "PlantTableViewCell", bundle: nil), forCellReuseIdentifier: "PlantCellViewID")
    }
    //MARK: Functions
    func moveToDetailedView(plant: Plant){
        let sb = UIStoryboard(name: "PlantDetails", bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: "PlantDetailsViewController") as? PlantDetailsViewController else {
            fatalError("Unable to instantiate PlantDetailsViewController")
        }
        print("Passing plant: \(plant.name), \(plant.description)")
        vc.plant = plant
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
}
    //MARK: Extensions
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
extension PlantListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let plant = plants[indexPath.row]
        moveToDetailedView(plant: plant)
        plantTableView.deselectRow(at: indexPath as IndexPath, animated: true)
    }
}
extension PlantListViewController: PlantDetailsDelegate{
    func didSelectPlant(_ plant: Plant) {
        recentlyOpenedPlantImage?.image = plant.image
    }
    
}
