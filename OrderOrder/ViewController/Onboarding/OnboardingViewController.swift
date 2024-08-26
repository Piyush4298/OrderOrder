//
//  OnboardingViewController.swift
//  OrderOrder
//
//  Created by Piyush Pandey on 21/07/24.
//

import UIKit

class OnboardingViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var actionButton: UIButton!
    
    var slides: [OnboardingSlide] = []
    var currentPage: Int = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1 {
                actionButton.setTitle("Let's Go", for: .normal)
            } else {
                actionButton.setTitle("Next", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        collectionView.dataSource = self
        collectionView.delegate = self
        actionButton.layer.cornerRadius = 12
        collectionView.isPagingEnabled = true
        
        slides = [
            OnboardingSlide(title: "Delicious Dishes",
                            description: "Experience a variety of amazing dishes from different cultures around the world",
                            image: UIImage(named: "slide1")!),
            OnboardingSlide(title: "World-Class Chefs",
                            description: "Our dishes are preferred and prepared by only the best.",
                            image: UIImage(named: "slide2")!),
            OnboardingSlide(title: "Nation Wide Delivery",
                            description: "Instant delivery at your doorstep, irrespective of your location",
                            image: UIImage(named: "slide3")!)
        ]
        pageControl.numberOfPages = slides.count
    }

    @IBAction func actionButtonClicked(_ sender: UIButton) {
        if currentPage == slides.count - 1 {
            let navVC = storyboard?.instantiateViewController(identifier: "HomeNavigationController") as! UINavigationController
            navVC.modalPresentationStyle = .fullScreen
            navVC.modalTransitionStyle = .flipHorizontal
            UserDefaults.standard.hasOnBoarded = true
            present(navVC, animated: true)
        } else {
            currentPage += 1
            let indexPath = IndexPath(row: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    
}

extension OnboardingViewController: UICollectionViewDelegate,
                                    UICollectionViewDataSource,
                                    UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, 
                                                      for: indexPath) as! OnboardingCollectionViewCell
        cell.configure(slides[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
}
