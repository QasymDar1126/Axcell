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
    
    var arrayOfVideoKeys = ["8YH0-jO14NQ", "Y6Q4G54yURY", "5Tl4Yvh1BbE"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func didTapSelect(videoKey: String) {
        let cameraVc = storyboard!.instantiateViewController(identifier: "CameraViewController") as! CameraViewController
        // 3
        cameraVc.videoKey = videoKey
        navigationController?.pushViewController(cameraVc, animated: true) // segue (animation)
    }
}

extension SelectVideoViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfVideoKeys.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath) as! VideoCell
        
        // 1
        cell.videoKey = arrayOfVideoKeys[indexPath.row]
        cell.ytPlayerView.loadVideoID(cell.videoKey)
        cell.delegate = self
        
        return cell
    }
    
}

