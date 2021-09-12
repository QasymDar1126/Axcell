//
//  TennisSetupViewController.swift
//  Axcell
//
//  Created by Qasym Dar on 9/8/21.

import UIKit

class TennisSetupViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func didTapForehand(_ sender: Any) {
        // segue to SelectVideoViewController
        
        segueToCamera(sport: "Tennis", strokeType: "Forehand")
    }
    
    @IBAction func didTapBackhand(_ sender: Any) {
        segueToCamera(sport: "Tennis", strokeType: "Backhand")
    }
    
    func segueToCamera(sport: String, strokeType: String) {
        let vc = storyboard?.instantiateViewController(identifier: "SelectVideoViewController") as! SelectVideoViewController
        vc.arrayOfVideoFilenames = []
        
        let numberOfVideos = Data.videos[sport]![strokeType]!["numVideos"] as! Int
        var i = 1
        while(i <= numberOfVideos) {
            vc.arrayOfVideoFilenames.append("\(sport)\(strokeType)\(i)")
            i += 1
        }
        
        navigationController?.pushViewController(vc, animated: true)
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
