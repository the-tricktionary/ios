//
//  TrickDetailDataSource.swift
//  Tricktionary
//
//  Created by Marek  Šťovíček on 23/12/2018.
//  Copyright © 2018 Marek Šťovíček. All rights reserved.
//

import Foundation
import UIKit

class TrickDetailDataSource: NSObject, UITableViewDataSource {
    
    // MARK: Variables
    
    var viewModel: TrickDetailViewModel!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let descriptionCell = DescriptionCell()
            descriptionCell.descriptionText.text = viewModel.trick.description
            return descriptionCell
        } else if indexPath.row == 1 {
            let videoCell = VideoCell()
            videoCell.setVideo(url: viewModel.trick.videos.youtube!)
            return videoCell
        } else if indexPath.row == 2 {
            let infoCell = InformationCell()
            infoCell.title.text = "Level WJR:"
            infoCell.info.text = "1"
            return infoCell
        } else if indexPath.row == 3 {
            let infoCell = InformationCell()
            infoCell.title.text = "Level IJRF:"
            infoCell.info.text = "2"
            return infoCell
        }
        
        return UITableViewCell()
    }
}
