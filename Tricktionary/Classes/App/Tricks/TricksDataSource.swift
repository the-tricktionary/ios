//
//  TricksDataSource.swift
//  Tricktionary
//
//  Created by Marek Šťovíček on 15/11/2018.
//  Copyright © 2018 Marek Šťovíček. All rights reserved.
//

import Foundation
import UIKit

extension TricksViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.sections.value.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.sections.value[section].rows.count
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as? TypeHeaderView else {
            return nil
        }
        let section = viewModel.sections.value[section]
        view.customize(with: section.name, collapsed: section.collapsed)
        view.onTapped = { [weak self] sectionName in
            self?.viewModel.toggleSection(name: sectionName)
            print("Section: \(sectionName)")
        }
        return view
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let trick = viewModel.sections.value[indexPath.section].rows[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: TrickLevelCell.reuseIdentifier(), for: indexPath) as! TrickLevelCell
        cell.title.text = trick.name
        cell.isTopBorderVisible(false)
        return cell
    }
}
