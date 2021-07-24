//
//  RocketDetailViewController.swift
//  Project-SpaceX
//
//  Created by Umut Sever on 23.07.2021.
//

import UIKit

class RocketDetailViewController: UIViewController {
    @IBOutlet weak var rocketDetailTableView: UITableView!
    @IBOutlet weak var rocketNameLabel: UILabel!
    @IBOutlet weak var rocketDetailLabel: UILabel!
    
    var rocket: RocketModel!
    var rocketDetail: [RocketModel] = [.init(flickr_images: ["https://imgur.com/DaCfMsj.jpg",
                                                             "https://imgur.com/azYafd8.jpg"], rocket_name: "Rocket Name", description: "SpaceX's 21st ISS resupply mission on behalf of NASA and the first under the CRS-2 contract, this mission brings essential supplies to the International Space Station using the cargo variant of SpaceX's Dragon 2 spacecraft. The external payload for this mission is the Nanoracks Bishop Airlock. Falcon 9 and Dragon launch from LC-39A, Kennedy Space Center and the booster is expected to land on an ASDS. The mission will be complete with return and recovery of the Dragon capsule and down cargo.SpaceX's 21st ISS resupply mission on behalf of NASA and the first under the CRS-2 contract, this mission brings essential supplies to the International Space Station using the cargo variant of SpaceX's Dragon 2 spacecraft. The external payload for this mission is the Nanoracks Bishop Airlock. Falcon 9 and Dragon launch from LC-39A, Kennedy Space Center and the booster is expected to land on an ASDS. The mission will be complete with return and recovery of the Dragon capsule and down cargo.SpaceX's 21st ISS resupply mission on behalf of NASA and the first under the CRS-2 contract, this mission brings essential supplies to the International Space Station using the cargo variant of SpaceX's Dragon 2 spacecraft. The external payload for this mission is the Nanoracks Bishop Airlock. Falcon 9 and Dragon launch from LC-39A, Kennedy Space Center and the booster is expected to land on an ASDS. The mission will be complete with return and recovery of the Dragon capsule and down cargo.")]
    override func viewDidLoad() {
        super.viewDidLoad()
        title = rocket.rocket_name
       registerCell()
    }
    
    
    private func registerCell() {
        rocketDetailTableView.register(UINib(nibName: RocketDetailTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: RocketDetailTableViewCell.identifier)
    }
   

}

extension RocketDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        rocketDetail.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = rocketDetailTableView.dequeueReusableCell(withIdentifier: RocketDetailTableViewCell.identifier, for: indexPath) as! RocketDetailTableViewCell
        cell.setup(rocketDetail[indexPath.row])
        return cell
    }
    
    
}
