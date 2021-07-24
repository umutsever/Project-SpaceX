//
//  LaunchDetailViewController.swift
//  Project-SpaceX
//
//  Created by Umut Sever on 23.07.2021.
//

import UIKit
import Kingfisher

class LaunchDetailViewController: UIViewController {
    
    @IBOutlet weak var missionImageView: UIImageView!
    @IBOutlet weak var missionNameLabel: UILabel!
    @IBOutlet weak var missionYearLabel: UILabel!
    @IBOutlet weak var missionDetailLabel: UILabel!
    
    var launchDetail: LaunchModel!

    override func viewDidLoad() {
        super.viewDidLoad()
       populateView()
    }
    
    private func populateView() {
        missionImageView.kf.setImage(with: launchDetail.links.patch.small?.asUrl ?? URL(string: "https://i.imgur.com/BrW201S.png"))
        missionNameLabel.text = launchDetail.name
        missionDetailLabel.text = launchDetail.details ?? "There is no specific information about this mission."
        missionYearLabel.text = launchDetail.date_utc
    }
   

}
