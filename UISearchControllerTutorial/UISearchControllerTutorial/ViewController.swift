//
//  ViewController.swift
//  UISearchControllerTutorial
//
//  Created by Duy Bui on 3/31/19.
//  Copyright © 2019 DuyBui. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var tableView: UITableView!
  var cellIdentifier = "cell"
  var filteredFootballer = [Footballer]()
  let searchController = UISearchController(searchResultsController: nil)
  override func viewDidLoad() {
    
    super.viewDidLoad()
    tableView.dataSource = self
    
    searchController.searchResultsUpdater = self
    searchController.dimsBackgroundDuringPresentation = false
    definesPresentationContext = true
    tableView.tableHeaderView = searchController.searchBar
    searchController.searchBar.tintColor = UIColor.white
    searchController.searchBar.barTintColor = UIColor.red
  }
  
  private func filterFootballers(for searchText: String) {
    filteredFootballer = allPlayers.filter { player in
      return player.name.lowercased().contains(searchText.lowercased())
    }
    tableView.reloadData()
  }
}

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if searchController.isActive && searchController.searchBar.text != "" {
      return filteredFootballer.count
    }
    return allPlayers.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
    
    let footballer: Footballer
    if searchController.isActive && searchController.searchBar.text != "" {
      footballer = filteredFootballer[indexPath.row]
    } else {
      footballer = allPlayers[indexPath.row]
    }
    
    cell.textLabel?.text = footballer.name
    cell.detailTextLabel?.text = footballer.league
    return cell
  }
}

extension ViewController: UISearchResultsUpdating {
  func updateSearchResults(for searchController: UISearchController) {
    filterFootballers(for: searchController.searchBar.text ?? "")
  }
}
