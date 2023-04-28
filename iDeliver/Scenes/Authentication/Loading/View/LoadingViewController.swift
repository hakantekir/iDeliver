//
//  LoadingViewController.swift
//  iDeliver
//
//  Created by Kenan Baylan on 28.04.2023.
//

import UIKit

class LoadingViewController: UIViewController, Storyboarded {
    
    let viewModel = LoadingViewModel()
    
    
    //MARK: UIElements
    @IBOutlet weak var loadinCollectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nextButton: UIButton!
    
    
    //MARK: Variables
    var loadingSlidesCount = LoadingSlide.loadingContenData.count
    var currentPageNumber = 0 {
        didSet {
            if currentPageNumber == loadingSlidesCount - 1 {
                nextButton.setTitle("Get Started", for: .normal)
            } else {
                nextButton.setTitle("Next", for: .normal)
            }
        }
    }
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadinCollectionView.delegate = self
        loadinCollectionView.dataSource = self
        
        pageControl.numberOfPages = loadingSlidesCount
        
    }
    
    func configureViewModel(){
        viewModel.coordinator = LoadingCoordinator(navigationController: navigationController ?? UINavigationController())
    }
    
    
    
    @IBAction func nextButtonClicked(_ sender: Any) {
        
        if currentPageNumber == loadingSlidesCount - 1 {
            print("next login tapped()")
            viewModel.nextLogin()
            
            
        } else {
            
            currentPageNumber += 1
            pageControl.currentPage += 1
            let indexPath = IndexPath(item: currentPageNumber, section: 0)
            loadinCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            
        }
        
    }
    
    
}


extension LoadingViewController: UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return loadingSlidesCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let reuseIdentifier = LoadingCollectionViewCell.identifier
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! LoadingCollectionViewCell
        
        cell.setupSlideView(LoadingSlide.loadingContenData[indexPath.row])
        return cell
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        let currentPage = Int(scrollView.contentOffset.x) / Int(width)
        
        pageControl.currentPage = currentPageNumber
        currentPageNumber = currentPage // Next - Get started değişim için gerekli
        
    }
    
    
    
}
