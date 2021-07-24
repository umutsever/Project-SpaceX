//
//  HomeViewController.swift
//  Project-SpaceX
//
//  Created by Umut Sever on 21.07.2021.
//

import UIKit
import ProgressHUD

class HomeViewController: UIViewController {
    @IBOutlet weak var rocketCollectionView: UICollectionView!
    @IBOutlet weak var pastLaunchesCollectionView: UICollectionView!
    @IBOutlet weak var upcomingLaunchesCollectionView: UICollectionView!
    
    var rockets: [RocketModel] = [
        .init(flickr_images: ["https://imgur.com/DaCfMsj.jpg"], rocket_name: "Falcon 1", description: "falcon"),
        .init(flickr_images: ["https://farm1.staticflickr.com/929/28787338307_3453a11a77_b.jpg"], rocket_name: "Falcon 2", description: "falcon"),
        .init(flickr_images: ["https://farm5.staticflickr.com/4599/38583829295_581f34dd84_b.jpg"], rocket_name: "Falcon 3", description: "falcon"),
        .init(flickr_images: ["https://live.staticflickr.com/65535/48954138962_ee541e6755_b.jpg"], rocket_name: "Falcon 4", description: "falcon")]
    
    var pastLaunches: [LaunchModel] = []
    var upcomingLaunches: [LaunchModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ProgressHUD.show("Loading.. 🚀")
        registerCell()
        getRequest()
    }
    
    
    
    private func getRequest() {
        NetworkService.shared.getPastLaunch { [weak self] (result) in
            switch result {
            case .success(let past):
                self?.pastLaunches = past
                self?.pastLaunchesCollectionView.reloadData()
                ProgressHUD.dismiss()
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
        
        NetworkService.shared.getUpcomingLaunch { [weak self] (result) in
            switch result {
            case .success(let upcoming):
                self?.upcomingLaunches = upcoming
                self?.upcomingLaunchesCollectionView.reloadData()
                ProgressHUD.dismiss()
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
        
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == rocketCollectionView {
            let controller = RocketDetailViewController.instantiate()
            controller.rocket = rockets[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        } else {
            let controller = LaunchDetailViewController.instantiate()
            controller.launchDetail = collectionView == pastLaunchesCollectionView ? pastLaunches[indexPath.row] : upcomingLaunches[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
            }
        }
       
        
        
    }
    

