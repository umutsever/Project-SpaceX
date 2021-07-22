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
    
    var launchDetail: PastLaunchModel!

    override func viewDidLoad() {
        super.viewDidLoad()

       populateView()
    }
    
    private func populateView() {
        missionImageView.kf.setImage(with: launchDetail.links.asUrl)
        missionNameLabel.text = launchDetail.mission_name
        missionDetailLabel.text = launchDetail.details
        missionYearLabel.text = launchDetail.launch_year
    }
   

}
