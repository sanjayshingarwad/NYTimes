//
//  NYTimesCollectionViewCell.swift
//  NYTimes
//
//  Created by Sanjay Shingarwad on 29/07/18.
//  Copyright © 2018 Sanjay Shingarwad. All rights reserved.
//

import UIKit
import Kingfisher

class NYTimesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var autherLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var cellImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.cellImageView.layer.cornerRadius = self.cellImageView.frame.size.width / 2
        self.cellImageView.layer.masksToBounds = true
    }
    
    func updateCellResult(news: News?) {
        if let newsFeed = news {
            self.titleLable.text = newsFeed.title
            self.autherLabel.text = newsFeed.byline
            self.dateLabel.text = newsFeed.published_date
            if let url = news?.imageUrl {
                self.cellImageView.kf.setImage(with: URL(string: url))
            }
        }
    }
}
