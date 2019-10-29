//
//  SearchResultViewController.swift
//  Tricktionary
//
//  Created by Marek  Šťovíček on 04/02/2019.
//  Copyright © 2019 Marek Šťovíček. All rights reserved.
//

import Foundation
import UIKit

class SearchResultViewController: UITableViewController, UISearchResultsUpdating, UISearchBarDelegate {
    
    // MARK: Variables
    
    var viewModel: TricksViewModel!
    var viewController: TricksViewController!
    
    // MARK: Table view
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if viewController.isFiltering() {
            return viewModel.filteredTricks.count
        }
        
        return viewModel.tricks.value.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: nil)
        let selected: Trick
        if viewController.isFiltering() {
            selected = viewModel.filteredTricks[indexPath.row]
        } else {
            selected = viewModel.tricks.value[indexPath.row]
        }
        cell.textLabel?.text = selected.name
        cell.detailTextLabel?.text = "Level \(selected.level) \(selected.type)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem: Trick
        if viewController.isFiltering() {
            selectedItem = viewModel.filteredTricks[indexPath.row]
        } else {
            selectedItem = viewModel.tricks.value[indexPath.row]
        }
        dismiss(animated: true, completion: {
            let coord = TrickCoordinator(presenter: self.viewController.navigationController, trickName: selectedItem.name)
            coord.start()
        })
    }
    
    // MARK
    
    func updateSearchResults(for searchController: UISearchController) {
        viewController.filterContentForSearchText(searchController.searchBar.text!)
        tableView.reloadData()
    }
}
