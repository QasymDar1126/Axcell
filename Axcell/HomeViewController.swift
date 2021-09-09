//
//  HomeViewController.swift
//  Axcell
//
//  Created by Qasym Dar on 9/2/21.
//

import UIKit

class HomeViewController: UIViewController {


    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    @IBAction func didTapSoccerBall(_ sender: Any) {
    }
    @IBAction func didTapFootball(_ sender: Any) {
        
        // segue to Football VC
    }
    
    
    @IBAction func didTapTennisBall(_ sender: Any) {
        
        // segue to Tennis VC
        
        let tennisVC = storyboard?.instantiateViewController(identifier: "TennisSetupVC")
        
        navigationController?.pushViewController(tennisVC!, animated: true)
        
        // present(tennisVC!, animated: true, completion: nil)
      
}
    
    
    
}

