//
//  PlaybackViewController.swift
//  Axcell
//
//  Created by Qasym Dar on 9/19/21.
//

import UIKit

class PlaybackViewController: UIViewController {
    
    var videoUrl: URL?

    override func viewDidLoad() {
        super.viewDidLoad()

        // coming from the Camera VC
        print(videoUrl)
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
