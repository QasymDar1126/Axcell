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
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var playerView: PlayerView!
    @IBOutlet weak var playbackSlider: UISlider!
    
    var videoUrl: URL?
    
    var isDebug = false

    override func viewDidLoad() {
        super.viewDidLoad()

        // coming from the Camera VC
        // print(videoUrl!)
        
        if isDebug {
            // not use the camera
            let filePath = Bundle.main.path(forResource: "TennisForehand1", ofType: "mp4")!
            videoUrl = URL(fileURLWithPath: filePath)
        }
        
        let player = VideoPlayer(urlAsset: videoUrl!, view: playerView, startAutoPlay: true, repeatAfterEnd: false)
        
        player.playerRate = 0.50
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        playbackSlider.minimumValue = 0
        
        let duration : CMTime = playerView.player!.currentItem!.asset.duration
        let seconds : Float64 = CMTimeGetSeconds(duration)
        
        playbackSlider.maximumValue = Float(seconds)
        playbackSlider.isContinuous = true
        playbackSlider.tintColor = UIColor.green
        
        playerView.player!.addPeriodicTimeObserver(forInterval: CMTimeMakeWithSeconds(1, preferredTimescale: 1), queue: DispatchQueue.main) { time in
            
            if self.playerView.player!.currentItem?.status == .readyToPlay {
                let currentTime = CMTimeGetSeconds(self.playerView.player!.currentTime())

                let secs = Int(currentTime)
                self.timeLabel.text = String(format: "%01d:%02d", secs/60, secs%60) as String
                self.playbackSlider.value = Float(currentTime)
            }
        }
    }
    
    @IBAction func didTapVerifyNext(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "OverlayVideoViewController") as! OverlayVideoViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func didSlideSlider(_ sender: Any) {
        print(playbackSlider.value)
        
        let seconds : Int64 = Int64(playbackSlider.value)
        let targetTime:CMTime = CMTimeMake(value: seconds, timescale: 1)
        
        playerView.player!.seek(to: targetTime)
        
        if playerView.player!.rate == 0
        {
//            playerView.player?.play()
        }
        
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
