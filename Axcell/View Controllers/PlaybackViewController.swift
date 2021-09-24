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
    
    var videoUrl: URL?

    override func viewDidLoad() {
        super.viewDidLoad()

        // coming from the Camera VC
        print(videoUrl)
        
        let player = AVPlayer(url: videoUrl!)
        let playerViewController: AVPlayerViewController!
        playerViewController = AVPlayerViewController()
        playerViewController.view.frame = self.view.frame
        playerViewController.player = player
        playerViewController.showsPlaybackControls = true
        playerViewController.videoGravity = .resizeAspectFill
        self.view.addSubview(playerViewController.view)
        playerViewController.player!.play()
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
