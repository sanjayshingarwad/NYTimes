//
//  NYTimesFeedViewController.swift
//  NYTimes
//
//  Created by Sanjay Shingarwad on 12/07/18.
//  Copyright © 2018 Sanjay Shingarwad. All rights reserved.
//

import UIKit

class NYTimesFeedViewController: UIViewController {
    
    @IBOutlet weak var nytimesCollectinView: UICollectionView!
    
    private let client = NewsClient()
    private var results = [News]()
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        // Create Activity Indicator
        let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
        activityIndicator.hidesWhenStopped = false
        return activityIndicator
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Position Activity Indicator in the center of the main view
        self.view.addSubview(self.activityIndicator)
        self.activityIndicator.center = view.center
        self.startLoadingNewsFeeds()
        
    }
    
    
    /// Load feeds
    private func startLoadingNewsFeeds() {
        
        self.activityIndicator.startAnimating()
        self.client.getFeed(from: .topRated) { [weak self] result in
            
            switch result {
            case .success(let movieFeedResult):
                guard let newsResults = movieFeedResult?.results else { return }
                self?.results = newsResults
                self?.nytimesCollectinView.reloadData()
                self?.hideActivityIndicator()
            case .failure(let error):
                print("the error \(error)")
                self?.hideActivityIndicator()
                
            }
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pushNYTimesFeedViewControllerSegue" {
            if let destinationVC = segue.destination as? NYTimesNewsDetailViewController {
                destinationVC.news = sender as? News
            }
        }
    }
    
    func hideActivityIndicator() {
        self.activityIndicator.stopAnimating()
        self.activityIndicator.isHidden = true
    }
    
}

extension NYTimesFeedViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.results.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: NYTimesCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "NYTimesCollectionViewCell", for: indexPath) as! NYTimesCollectionViewCell
        cell.updateCellResult(news: self.results[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "pushNYTimesFeedViewControllerSegue", sender: self.results[indexPath.row])
    }
}


