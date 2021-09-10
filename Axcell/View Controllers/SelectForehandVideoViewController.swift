//
//  SelectForehandVideoViewController.swift
//  Axcell
//
//  Created by Qasym Dar on 9/8/21.
//  https://www.youtube.com/watch?v=8YH0-jO14NQ
//

import UIKit

class SelectForehandVideoViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var arrayOfVideoKeys = ["8YH0-jO14NQ", "sGX0M22xhPw"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension SelectForehandVideoViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfVideoKeys.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath) as! VideoCell
        
        cell.ytPlayerView.loadVideoID(arrayOfVideoKeys[indexPath.row])
        
        return cell
    }
    
}
