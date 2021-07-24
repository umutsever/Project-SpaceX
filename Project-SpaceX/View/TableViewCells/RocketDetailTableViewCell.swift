//
//  RocketDetailTableViewCell.swift
//  Project-SpaceX
//
//  Created by Umut Sever on 23.07.2021.
//

import UIKit

class RocketDetailTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: RocketDetailTableViewCell.self)
    @IBOutlet weak var rocketDetailImage: UIImageView!
    
    
    func setup(_ rocket: RocketModel) {
        for i in rocket.flickr_images ?? [] {
            rocketDetailImage.kf.setImage(with: i.asUrl)
        }
    }
    
    
}
