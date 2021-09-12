//
//  SelectVideoViewController.swift
//  Axcell
//
//  Created by Qasym Dar on 9/8/21.
//  https://www.youtube.com/watch?v=8YH0-jO14NQ
//

import UIKit

class SelectVideoViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var arrayOfVideoFilenames = ["one", "two"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let playerView = PlayerView()
        view.addSubview(playerView)
    }
    
    func didTapSelect(videoFilename: String) {
        let cameraVc = storyboard!.instantiateViewController(identifier: "CameraViewController") as! CameraViewController
        // 3
        cameraVc.videoFilename = videoFilename
        navigationController?.pushViewController(cameraVc, animated: true) // segue (animation)
    }
}

extension SelectVideoViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfVideoFilenames.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath) as! VideoCell
        
        // 1
        var videoPlayer: VideoPlayer?
        if let filePath = Bundle.main.path(forResource: arrayOfVideoFilenames[indexPath.row], ofType: "mp4") {
                    let fileURL = NSURL(fileURLWithPath: filePath)
            videoPlayer = VideoPlayer(urlAsset: fileURL, view: cell.playerView)
                    if let player = videoPlayer {
                        player.playerRate = 0.67
                    }
                }
        
        cell.delegate = self
        cell.videoFilename = arrayOfVideoFilenames[indexPath.row]
        
        return cell
    }
    
}

