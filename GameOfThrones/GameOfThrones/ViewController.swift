//
//  ViewController.swift
//  GameOfThrones
//
//  Created by Alex Paul on 11/16/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var someEpisode = [GOTEpisode]() {
        didSet {
            tableView.reloadData()
        }
    }
    

  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
    print("there are \(GOTEpisode.seasonSection().count) seasons.")
   
  }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = tableView.dequeueReusableCell(withIdentifier: "animalCell", for: indexPath)
        
        return cell
    }
    
}
