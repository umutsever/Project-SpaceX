//
//  UpcomingLaunchesCollectionViewCell.swift
//  Project-SpaceX
//
//  Created by Umut Sever on 23.07.2021.
//

import UIKit
import Kingfisher

class UpcomingLaunchesCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: UpcomingLaunchesCollectionViewCell.self)

    @IBOutlet weak var missionPatchImage: UIImageView!
    @IBOutlet weak var missionNameLabel: UILabel!
    @IBOutlet weak var missionYearLabel: UILabel!
    @IBOutlet weak var missionDetailLabel: UILabel!
    
    
    func setup(_ upcomingLunches: UpcomingLaunchModel) {
        missionPatchImage.kf.setImage(with: upcomingLunches.links.asUrl)
        missionNameLabel.text = upcomingLunches.mission_name
        missionYearLabel.text = upcomingLunches.launch_year
        missionDetailLabel.text = upcomingLunches.details
    }

}
