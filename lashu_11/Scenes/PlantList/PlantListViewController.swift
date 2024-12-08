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
    @IBOutlet weak var progressView: UIProgressView!
    // MARK: Properties
    let plants = PlantDataSource.shared.plants
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        setUpUI()
    }
    
    // MARK: Functions
    private func setUpUI() {
        moveProgress()
        setupNavigationBar()
        setupRecentlyOpenedImage()
        setupTableView()
        setupBackgroundAnimation()
    }
    private func moveProgress(){
        progressView.progress = Float(plantTableView.contentOffset.y / Double((110 * plants.count))) * 4
    }
    private func setupNavigationBar() {
        navigationController?.navigationBar.isHidden = true
    }
    
    private func setupRecentlyOpenedImage() {
        recentlyOpenedPlantImage.layer.cornerRadius = recentlyOpenedPlantImage.frame.height / 2
        recentlyOpenedPlantImage.image = plants.first?.image
        addBlurEffect(to: recentlyOpenedPlantImage)
        animateImageTransform()
    }
    
    private func setupTableView() {
        plantTableView.isScrollEnabled = plants.count * 110 > 560
        plantTableView.dataSource = self
        plantTableView.delegate = self
        plantTableView.register(UINib(nibName: "PlantTableViewCell", bundle: nil), forCellReuseIdentifier: "PlantCellViewID")
    }
    
    private func setupBackgroundAnimation() {
        let originalColor = view.backgroundColor
        
        UIView.animate(withDuration: 0.2, delay: 0, options: [.curveEaseInOut], animations: {
            self.recentlyOpenedPlantImage.layer.cornerRadius = self.recentlyOpenedPlantImage.frame.height / 5.6
            self.recentlyOpenedPlantImage.transform = .identity
        }) { _ in
            let targetColor: UIColor = (self.traitCollection.userInterfaceStyle == .dark) ? .systemBlue : .systemPink
            self.animateBackground(to: targetColor, originalColor: originalColor)
        }
    }
    
    private func animateBackground(to targetColor: UIColor, originalColor: UIColor?) {
        UIView.animate(withDuration: 0.3, delay: 0, options: [.curveEaseIn], animations: {
            self.view.backgroundColor = targetColor
            self.plantTableView.backgroundColor = targetColor
            self.recentlyOpenedPlantImage.backgroundColor = targetColor
        }) { _ in
            UIView.animate(withDuration: 1, delay: 0, options: [.curveEaseOut], animations: {
                self.view.backgroundColor = originalColor
                self.plantTableView.backgroundColor = originalColor
                self.recentlyOpenedPlantImage.backgroundColor = originalColor
            })
        }
    }
    
    private func addBlurEffect(to imageView: UIImageView) {
        let blurEffect = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = imageView.bounds
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        imageView.addSubview(blurView)
        
        UIView.animate(withDuration: 0.5) {
            blurView.alpha = 0
        }
    }
    
    private func animateImageTransform() {
        recentlyOpenedPlantImage.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
    }
    
    func moveToDetailedView(plant: Plant) {
        let storyboard = UIStoryboard(name: "PlantDetails", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "PlantDetailsViewController") as? PlantDetailsViewController else {
            fatalError("Unable to instantiate PlantDetailsViewController")
        }
        viewController.plant = plant
        viewController.delegate = self
        navigationController?.pushViewController(viewController, animated: true)
    }
}

// MARK: - extensions
extension PlantListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        plants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PlantCellViewID", for: indexPath) as? PlantTableViewCell else {
            fatalError("Unable to dequeue PlantTableViewCell")
        }
        let plant = plants[indexPath.row]
        cell.configure(with: plant)
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        animateCellAppearance(cell, at: indexPath)
    }
    
    private func animateCellAppearance(_ cell: UITableViewCell, at indexPath: IndexPath) {
        cell.alpha = 0.3
        let originalColor = cell.backgroundColor
        cell.backgroundColor = .clear
        cell.transform = CGAffineTransform(translationX: 0, y: 12)
        
        UIView.animate(withDuration: 0.3, delay: 0.02 * Double(indexPath.row), options: [.curveEaseOut], animations: {
            cell.alpha = 1
            cell.backgroundColor = originalColor
            cell.transform = .identity
        })
    }
}
extension PlantListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let plant = plants[indexPath.row]
        moveToDetailedView(plant: plant)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        moveProgress()    }
}
extension PlantListViewController: PlantDetailsDelegate {
    func didSelectPlant(_ plant: Plant) {
        guard let newImage = plant.image else { return }
        let UIImageView = UIImageView(image: newImage)
        UIImageView.alpha = 0
        UIImageView.frame = recentlyOpenedPlantImage?.bounds ?? CGRect.zero
        UIImageView.contentMode = .scaleAspectFill
        UIImageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        recentlyOpenedPlantImage?.addSubview(UIImageView)
        UIView.animate(withDuration: 0.29,delay:0, options: .curveEaseOut) {
            UIImageView.alpha = 1
        } completion: { _ in
            self.recentlyOpenedPlantImage?.image = newImage
            UIImageView.removeFromSuperview()
        }
    }
}
extension PlantTableViewCell {
    func configure(with plant: Plant) {
        plantName?.text = plant.name
        plantDescription?.text = plant.description
        plantImage?.image = plant.image
    }
}
