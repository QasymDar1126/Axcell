
//  VideoCell.swift
//  Axcell
//
//  Created by Qasym Dar on 9/9/21.
//

import UIKit
import YouTubePlayer

class VideoCell: UITableViewCell {
    
    var delegate: SelectVideoViewController!
    var videoKey: String!
    
    @IBOutlet weak var ytPlayerView: YouTubePlayerView!
    
    @IBAction func selectVideo(_ sender: Any) {
        // segue
        delegate.didTapSelect(videoKey: videoKey) // 2
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
