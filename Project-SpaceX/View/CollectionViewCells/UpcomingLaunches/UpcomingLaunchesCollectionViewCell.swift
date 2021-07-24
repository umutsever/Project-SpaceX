//
//  UpcomingLaunchesCollectionViewCell.swift
//  Project-SpaceX
//
//  Created by Umut Sever on 23.07.2021.
//

import UIKit


class UpcomingLaunchesCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: UpcomingLaunchesCollectionViewCell.self)

    @IBOutlet weak var missionPatchImage: UIImageView!
    @IBOutlet weak var missionNameLabel: UILabel!
    @IBOutlet weak var missionYearLabel: UILabel!
    @IBOutlet weak var missionDetailLabel: UILabel!
    
    
    func setup(_ upcomingLunches: LaunchModel) {
        
        missionPatchImage.kf.setImage(with: upcomingLunches.links.patch.small?.asUrl ?? URL(string: "https://i.imgur.com/BrW201S.png"))
        missionNameLabel.text = upcomingLunches.name
        missionYearLabel.text = String(upcomingLunches.date_utc.dropLast(14))
        missionDetailLabel.text = upcomingLunches.details ?? "There is no specific information about this mission."
    }

}
