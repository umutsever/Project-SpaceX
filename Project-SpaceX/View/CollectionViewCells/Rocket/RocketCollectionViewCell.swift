//
//  RocketCollectionViewCell.swift
//  Project-SpaceX
//
//  Created by Umut Sever on 21.07.2021.
//

import UIKit
import Kingfisher

class RocketCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: RocketCollectionViewCell.self)
    @IBOutlet weak var rocketImageView: UIImageView!
    @IBOutlet weak var rocketNameLabel: UILabel!
    
    
    func setup(_ rocket: RocketModel) {
        rocketImageView.kf.setImage(with: rocket.flickr_images?[0].asUrl)
        rocketNameLabel.text = rocket.name
        
    }

}
