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
        print("Outlets initialized: \(plantName != nil), \(plantDescription != nil), \(plantImage != nil)")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
