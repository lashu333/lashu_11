//
//  PlantTableViewCell.swift
//  lashu_11
//
//  Created by Lasha Tavberidze on 06.12.24.
//

import UIKit

class PlantTableViewCell: UITableViewCell {
//MARK: Outlets
    @IBOutlet weak var plantImage: UIImageView!
    @IBOutlet weak var plantName: UILabel!
    @IBOutlet weak var plantDescription: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUpCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(with plant: Plant) {
        plantName?.text = plant.name
        plantDescription?.text = plant.description
        plantImage?.image = plant.image
    }
    private func setUpCell() {
        plantName.alpha = 0
        plantDescription.alpha = 0
        plantImage.layer.cornerRadius = plantImage.frame.height / 2.3
        plantImage.layer.borderWidth = plantImage.frame.height / 10
        let blurEffect = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = plantImage.bounds
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        plantImage.addSubview(blurView)
        UIView.animate(withDuration: 0.5) {
            blurView.alpha = 0
        }
        plantImage.transform = .init(scaleX: 0.8, y: 0.8)
        if let borderColor = UIColor(named: "borderColor") {
            plantImage.layer.borderColor = borderColor.cgColor
        }
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
            self.plantName.alpha = 1
            self.plantImage.layer.cornerRadius = self.plantImage.frame.height / 5
        }, completion: nil)
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
            self.plantDescription.alpha = 1
            self.plantImage.layer.borderWidth = self.plantImage.frame.height / 15
            self.plantImage.transform = .identity

        }, completion: nil)
    }
}
