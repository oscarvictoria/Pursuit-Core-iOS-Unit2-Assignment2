//
//  EpisodeCell.swift
//  GameOfThrones
//
//  Created by Oscar Victoria Gonzalez  on 11/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class EpisodeCell: UITableViewCell {

  @IBOutlet weak var episodeImage: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var seasonLabel: UILabel!
    
    func configuredCell(for episode: GOTEpisode) {
        episodeImage.image = UIImage(named:episode.mediumImageID)
        titleLabel.text = episode.name
        seasonLabel.text = "S:\(episode.season.description) E:\(episode.number.description)"
    }

}
