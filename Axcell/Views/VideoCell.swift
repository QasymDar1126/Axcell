
//  VideoCell.swift
//  Axcell
//
//  Created by Qasym Dar on 9/9/21.
//

import UIKit
import YouTubePlayer

class VideoCell: UITableViewCell {
    
    var delegate: SelectVideoViewController!
    var videoFilename: String!
    
    @IBOutlet weak var playerView: PlayerView!
    
    @IBAction func selectVideo(_ sender: Any) {
        // segue
        delegate.didTapSelect(videoFilename: videoFilename) // 2
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
