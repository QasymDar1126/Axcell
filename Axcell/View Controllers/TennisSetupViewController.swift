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
        
        let vc = storyboard?.instantiateViewController(identifier: "SelectVideoViewController")
        
        navigationController?.pushViewController(vc!, animated: true)
    }
    @IBAction func didTapBackhand(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "SelectVideoViewController")
        
        navigationController?.pushViewController(vc!, animated: true)
        
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
