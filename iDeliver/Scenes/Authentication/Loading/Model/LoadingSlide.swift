//
//  LoadingSlide.swift
//  iDeliver
//
//  Created by Kenan Baylan on 28.04.2023.
//

import Foundation
import UIKit

struct LoadingSlide {
    let imageView: UIImage
    let header: String
    let description: String
    
    
    static let loadingContenData: [LoadingSlide] = [
        
        LoadingSlide(imageView: UIImage(named: "image1")! , header: "Find Your Dream Job Here!", description: "Explore all the most exciting job roles based on your interest and study major."),
        
        LoadingSlide(imageView: UIImage(named: "image2")! , header: "Find Your Dream Job Here!", description: "Explore all the most exciting job roles based on your interest and study major."),
        
        LoadingSlide(imageView: UIImage(named: "image3")! , header: "Find Your Dream Job Here!", description: "Explore all the most exciting job roles based on your interest and study major."),
        
    ]
    
    
}
