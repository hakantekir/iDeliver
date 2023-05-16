//
//  LoadingCollectionViewCell.swift
//  iDeliver
//
//  Created by Kenan Baylan on 28.04.2023.
//

import UIKit

class LoadingCollectionViewCell: UICollectionViewCell {
    
    
    static let identifier = String(describing: LoadingCollectionViewCell.self)
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    func setupSlideView(_ slide: LoadingSlide ) {
        self.imageView.image = slide.imageView
        self.headerLabel.text = slide.header
        self.descriptionLabel.text = slide.description
        
    }
}
