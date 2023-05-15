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
            pageControl.currentPage = currentPageNumber
            if currentPageNumber == pageControl.numberOfPages - 1 {
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
        
        configureViewModel()
        
        pageControl.numberOfPages = loadingSlidesCount
    }
    
    func configureViewModel(){
        viewModel.coordinator = LoadingCoordinator(navigationController: navigationController ?? UINavigationController())
    }
    
    @IBAction func nextButtonClicked(_ sender: Any) {
        if pageControl.currentPage == pageControl.numberOfPages - 1 {
            viewModel.nextLogin()
        } else {
            currentPageNumber += 1
            let indexPath = IndexPath(row: currentPageNumber, section: 0)
            loadinCollectionView.isPagingEnabled = false
            loadinCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            loadinCollectionView.isPagingEnabled = true
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
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        currentPageNumber = indexPath.row
    }
}
