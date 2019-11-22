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
    
var separatorColor: UIColor?
var sectionIndexColor: UIColor?
var sectionIndexBackgroundColor: UIColor?

    var someEpisode = [[GOTEpisode]]() {
        didSet {
            tableView.reloadData()
        }
    }
    

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .lightGray
    tableView.dataSource = self
    tableView.delegate = self
    loadData()
//    print("there are \(GOTEpisode.seasonSection().count) seasons.")
    self.tableView.backgroundColor = UIColor.systemGreen
  }

    func loadData() {
        someEpisode = GOTEpisode.seasonSection()
    }
    

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return someEpisode[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let episode = someEpisode[indexPath.section][indexPath.row]
        
        if episode.season % 2 == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "episodeCell", for: indexPath) as? EpisodeCell else {
                fatalError("Some Error")
                
            }
            cell.configuredCell(for: episode)
            cell.backgroundColor = .systemGreen
            return cell
        } else {
            guard let cellTwo = tableView.dequeueReusableCell(withIdentifier: "episodeCellTwo", for: indexPath) as? EpisodeCellTwo else {
                fatalError("Some Error")
                
            }
            cellTwo.configuredCell(for: episode)
            cellTwo.backgroundColor = .lightGray
            return cellTwo
            
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return someEpisode.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        sectionIndexBackgroundColor = .orange
        return  someEpisode[section].first?.name
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let headerView = view as? UITableViewHeaderFooterView {
            headerView.contentView.backgroundColor = .lightGray
            headerView.backgroundView?.backgroundColor = .black
            headerView.textLabel?.textColor = .black
        }
    }
 
    
}
