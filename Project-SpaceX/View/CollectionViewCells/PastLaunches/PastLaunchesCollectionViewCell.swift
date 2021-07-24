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
    @IBOutlet weak var launchSuccessLabel: UILabel!
    @IBOutlet weak var launchYearLabel: UILabel!
    
 
    
    func setup(_ pastLaunches: LaunchModel) {
        

        missionNameLabel.text = pastLaunches.name
        missionPatchImage.kf.setImage(with: pastLaunches.links.patch.small?.asUrl)
        if pastLaunches.success == true {
            launchSuccessLabel.textColor = .green
            launchSuccessLabel.text = "Success"
        } else {
            launchSuccessLabel.textColor = .red
            launchSuccessLabel.text = "Failed"
        }
        launchYearLabel.text = String(pastLaunches.date_utc.dropLast(14))
    }
 

}
