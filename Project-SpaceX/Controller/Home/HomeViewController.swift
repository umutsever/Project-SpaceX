//
//  HomeViewController.swift
//  Project-SpaceX
//
//  Created by Umut Sever on 21.07.2021.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var rocketCollectionView: UICollectionView!
    @IBOutlet weak var pastLaunchesCollectionView: UICollectionView!
    @IBOutlet weak var upcomingLaunchesCollectionView: UICollectionView!
    
    var rockets: [RocketModel] = [
        .init(flickr_images: ["https://imgur.com/DaCfMsj.jpg"], rocket_name: "Falcon 1", rocket_id: "falcon"),
            .init(flickr_images: ["https://farm1.staticflickr.com/929/28787338307_3453a11a77_b.jpg"], rocket_name: "Falcon 2", rocket_id: "falcon"),
            .init(flickr_images: ["https://farm5.staticflickr.com/4599/38583829295_581f34dd84_b.jpg"], rocket_name: "Falcon 3", rocket_id: "falcon"),
            .init(flickr_images: ["https://live.staticflickr.com/65535/48954138962_ee541e6755_b.jpg"], rocket_name: "Falcon 4", rocket_id: "falcon")]
    
    var pastLaunches: [PastLaunchModel] = [
        .init(mission_name: "Falcon", launch_year: "2006", links: "https://images2.imgbox.com/3c/0e/T8iJcSN3_o.png", details: "Engine failure at 33 seconds and loss of vehicle"),
        .init(mission_name: "Falcon", launch_year: "2006", links: "https://images2.imgbox.com/3c/0e/T8iJcSN3_o.png", details: "Engine failure at 33 seconds and loss of vehicle"),
        .init(mission_name: "Falcon", launch_year: "2006", links: "https://images2.imgbox.com/3c/0e/T8iJcSN3_o.png", details: "Engine failure at 33 seconds and loss of vehicle"),
        .init(mission_name: "Falcons", launch_year: "2006", links: "https://images2.imgbox.com/3c/0e/T8iJcSN3_o.png", details: "Engine failure at 33 seconds and loss of vehicle"),
        .init(mission_name: "Falcon", launch_year: "2006", links: "https://images2.imgbox.com/3c/0e/T8iJcSN3_o.png", details: "Engine failure at 33 seconds and loss of vehicle")
    ]
    
    var upcomingLaunches: [UpcomingLaunchModel] = [
        .init(mission_name: "Falcon", launch_year: "2020", links: "https://imgur.com/jHNFSY6.png", details: "SpaceX's 21st ISS resupply mission on behalf of NASA and the first under the CRS-2 contract, this mission brings essential supplies to the International Space Station using the cargo variant of SpaceX's Dragon 2 spacecraft. The external payload for this mission is the Nanoracks Bishop Airlock. Falcon 9 and Dragon launch from LC-39A, Kennedy Space Center and the booster is expected to land on an ASDS. The mission will be complete with return and recovery of the Dragon capsule and down cargo."),
        .init(mission_name: "Falcon", launch_year: "2020", links: "https://imgur.com/jHNFSY6.png", details: "SpaceX's 21st ISS resupply mission on behalf of NASA and the first under the CRS-2 contract, this mission brings essential supplies to the International Space Station using the cargo variant of SpaceX's Dragon 2 spacecraft. The external payload for this mission is the Nanoracks Bishop Airlock. Falcon 9 and Dragon launch from LC-39A, Kennedy Space Center and the booster is expected to land on an ASDS. The mission will be complete with return and recovery of the Dragon capsule and down cargo."),
        .init(mission_name: "Falcon", launch_year: "2020", links: "https://imgur.com/jHNFSY6.png", details: "SpaceX's 21st ISS resupply mission on behalf of NASA and the first under the CRS-2 contract, this mission brings essential supplies to the International Space Station using the cargo variant of SpaceX's Dragon 2 spacecraft. The external payload for this mission is the Nanoracks Bishop Airlock. Falcon 9 and Dragon launch from LC-39A, Kennedy Space Center and the booster is expected to land on an ASDS. The mission will be complete with return and recovery of the Dragon capsule and down cargo."),
        .init(mission_name: "Falcon", launch_year: "2020", links: "https://imgur.com/jHNFSY6.png", details: "SpaceX's 21st ISS resupply mission on behalf of NASA and the first under the CRS-2 contract, this mission brings essential supplies to the International Space Station using the cargo variant of SpaceX's Dragon 2 spacecraft. The external payload for this mission is the Nanoracks Bishop Airlock. Falcon 9 and Dragon launch from LC-39A, Kennedy Space Center and the booster is expected to land on an ASDS. The mission will be complete with return and recovery of the Dragon capsule and down cargo.")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      registerCell()
    }

    
    private func registerCell() {
        rocketCollectionView.register(UINib(nibName: RocketCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: RocketCollectionViewCell.identifier)
        
        pastLaunchesCollectionView.register(UINib(nibName: PastLaunchesCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: PastLaunchesCollectionViewCell.identifier)
        
        upcomingLaunchesCollectionView.register(UINib(nibName: UpcomingLaunchesCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: UpcomingLaunchesCollectionViewCell.identifier)
    }

}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView {
        case pastLaunchesCollectionView:
            return pastLaunches.count
        case rocketCollectionView:
            return rockets.count
        case upcomingLaunchesCollectionView:
            return upcomingLaunches.count
        default:
            return 0
        }
       
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        switch collectionView {
        case pastLaunchesCollectionView:
            let cell = pastLaunchesCollectionView.dequeueReusableCell(withReuseIdentifier: PastLaunchesCollectionViewCell.identifier, for: indexPath) as! PastLaunchesCollectionViewCell
            cell.setup(pastLaunches[indexPath.row])
            return cell
        case rocketCollectionView:
            let cell = rocketCollectionView.dequeueReusableCell(withReuseIdentifier: RocketCollectionViewCell.identifier, for: indexPath) as! RocketCollectionViewCell
            cell.setup(rockets[indexPath.row])
            return cell
        case upcomingLaunchesCollectionView:
            let cell = upcomingLaunchesCollectionView.dequeueReusableCell(withReuseIdentifier: UpcomingLaunchesCollectionViewCell.identifier, for: indexPath) as! UpcomingLaunchesCollectionViewCell
            cell.setup(upcomingLaunches[indexPath.row])
            return cell
          
        default:
            return UICollectionViewCell()
        }
        
        
        
        
        
        
        
        
      
    }
    
    
}
