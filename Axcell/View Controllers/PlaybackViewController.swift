//
//  PlaybackViewController.swift
//  Axcell
//
//  Created by Qasym Dar on 9/19/21.
//

import UIKit
import AVFoundation
import AVKit

class PlaybackViewController: UIViewController {
    
    @IBOutlet weak var playerView: PlayerView!
    
    var videoUrl: URL?

    override func viewDidLoad() {
        super.viewDidLoad()

        // coming from the Camera VC
        // print(videoUrl!)
        
        //let filePath = Bundle.main.path(forResource: "TennisForehand1", ofType: "mp4")!
        //let fileURL = NSURL(fileURLWithPath: filePath)
        
        let player = VideoPlayer(urlAsset: videoUrl!, view: playerView, startAutoPlay: true, repeatAfterEnd: false)
        
        
    }
    
    @IBAction func didTapVerifyNext(_ sender: Any) {
        
        // segue to next VC
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
