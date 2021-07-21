//
//  OnboardingCollectionViewCell.swift
//  Project-SpaceX
//
//  Created by Umut Sever on 21.07.2021.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: OnboardingCollectionViewCell.self)
    
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func setup(_ slide: OnboardingSlides) {
        slideImageView.image = slide.image
        titleLabel.text = slide.title
        descriptionLabel.text = slide.description
    }
}
