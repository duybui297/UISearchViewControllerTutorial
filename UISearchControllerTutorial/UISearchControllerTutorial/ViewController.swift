//
//  ViewController.swift
//  UISearchControllerTutorial
//
//  Copyright © 2019. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var tableView: UITableView!
  var cellIdentifier = "cell"
  override func viewDidLoad() {
    
    super.viewDidLoad()
    tableView.dataSource = self
  }
}

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return allPlayers.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
    cell.textLabel?.text = allPlayers[indexPath.row].name
    cell.detailTextLabel?.text = allPlayers[indexPath.row].league
    return cell
  }
}
