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
    
    var rockets: [RocketModel] = []
    var pastLaunches: [LaunchModel] = []
    var upcomingLaunches: [LaunchModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ProgressHUD.show("Loading.. 🚀")
        registerCell()
        getRequest()
    }
    
    private func getRequest() {
            let group = DispatchGroup()
            group.enter()
            NetworkService.shared.getPastLaunch { [weak self] (result) in
                switch result {
                case .success(let past):
                    self?.pastLaunches = past
                    self?.pastLaunchesCollectionView.reloadData()
                    group.leave()
                case .failure(let error):
                    ProgressHUD.showError(error.localizedDescription)
                }
            }
            group.enter()
            NetworkService.shared.getUpcomingLaunch { [weak self] (result) in
                switch result {
                case .success(let upcoming):
                    self?.upcomingLaunches = upcoming
                    self?.upcomingLaunchesCollectionView.reloadData()
                    group.leave()
                    
                case .failure(let error):
                    ProgressHUD.showError(error.localizedDescription)
                }
            }
            group.enter()
            NetworkService.shared.getRockets { [weak self] (result) in
                switch result {
                case .success(let rocket):
                    self?.rockets = rocket
                    self?.rocketCollectionView.reloadData()
                    group.leave()
                case .failure(let error):
                    ProgressHUD.showError(error.localizedDescription)
                }
            }
        
        group.notify(queue: .main) {
            ProgressHUD.dismiss()
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
        if collectionView != rocketCollectionView {
            let controller = LaunchDetailViewController.instantiate()
            controller.launchDetail = collectionView == pastLaunchesCollectionView ? pastLaunches[indexPath.row] : upcomingLaunches[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        }
        }
          
    }
    

