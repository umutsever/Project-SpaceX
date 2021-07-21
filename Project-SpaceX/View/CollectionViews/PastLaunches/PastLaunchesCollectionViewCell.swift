//
//  PastLaunchesCollectionViewCell.swift
//  Project-SpaceX
//
//  Created by Umut Sever on 22.07.2021.
//

import UIKit
import Kingfisher

class PastLaunchesCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: PastLaunchesCollectionViewCell.self)
    @IBOutlet weak var missionNameLabel: UILabel!
    @IBOutlet weak var missionPatchImage: UIImageView!
    @IBOutlet weak var launchYearLabel: UILabel!
    @IBOutlet weak var launchDetailLabel: UILabel!
    
    func setup(_ pastLaunches:PastLaunchModel) {
        missionNameLabel.text = pastLaunches.mission_name
        missionPatchImage.kf.setImage(with: pastLaunches.links.asUrl)
        launchYearLabel.text = pastLaunches.launch_year
        launchDetailLabel.text = pastLaunches.details
    }
 

}
