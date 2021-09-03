//
//  ViewController.swift
//  Axcell
//
//  Created by Qasym Dar on 9/2/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var basketballbutton: UIButton!
     
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    @IBAction func didTapBasketballButton(_ sender: Any) {
        // go to a new screen
        // ("segue" to a new "View Controller")
        
        basketballbutton.setTitleColor(.green, for: .normal)
    }
    
}

