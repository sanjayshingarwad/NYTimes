//
//  NYTimesTableViewCell.swift
//  NYTimes
//
//  Created by Sanjay Shingarwad on 12/07/18.
//  Copyright © 2018 Sanjay Shingarwad. All rights reserved.
//

import UIKit

class NYTimesTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var autherLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var cellImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func updateCellResult(news: News?) {
        if let newsFeed = news {
            self.titleLable.text = newsFeed.title
            self.autherLabel.text = newsFeed.byline
            self.dateLabel.text = newsFeed.published_date
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
