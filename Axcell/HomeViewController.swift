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
        
        // segue to Football ViewController
    }
    
    
    @IBAction func didTapTennisBall(_ sender: Any) {
        
        // segue to Tennis ViewController
        
        let vc = storyboard?.instantiateViewController(identifier: "TennisSetupViewController")
        
        navigationController?.pushViewController(vc!, animated: true)
        
        // present(tennisViewController!, animated: true, completion: nil)
      
}
    
    
    
}

