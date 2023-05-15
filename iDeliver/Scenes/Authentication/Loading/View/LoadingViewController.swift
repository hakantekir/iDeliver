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
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nextButton: UIButton!
    
    
    //MARK: Variables
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
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        configureViewModel()
        
        pageControl.numberOfPages = viewModel.slides.count
    }
    
    func configureViewModel(){
        viewModel.coordinator = LoadingCoordinator(navigationController: navigationController ?? UINavigationController())
    }
    
    @IBAction func nextButtonClicked(_ sender: Any) {
        if pageControl.currentPage == pageControl.numberOfPages - 1 {
            viewModel.coordinator?.showLogin()
        } else {
            currentPageNumber += 1
            let indexPath = IndexPath(row: currentPageNumber, section: 0)
            collectionView.isPagingEnabled = false
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            collectionView.isPagingEnabled = true
        }
    }
}


extension LoadingViewController: UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let reuseIdentifier = LoadingCollectionViewCell.identifier
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! LoadingCollectionViewCell
        
        cell.setupSlideView(viewModel.slides[indexPath.row])
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
