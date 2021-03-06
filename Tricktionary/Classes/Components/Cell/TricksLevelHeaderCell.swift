//
//  TricksLevelHeaderCell.swift
//  Tricktionary
//
//  Created by Marek Šťovíček on 15/11/2018.
//  Copyright © 2018 Marek Šťovíček. All rights reserved.
//

import Foundation
import UIKit

class TrickLevelHeaderCell: BaseCell {
    
    // MARK: Variables
    
    fileprivate let view: UIView = UIView()
    
    let title: UILabel = UILabel()
    
    // MARK: Life cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
        setup()
        setupViewConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Privates
    
    fileprivate func setupSubviews() {
        addSubview(view)
        view.addSubview(title)
    }
    
    fileprivate func setup() {
        contentView.backgroundColor = Color.background
        layerView = view
        view.backgroundColor = Color.levelHeader
        
        selectionStyle = .none
        
        title.textColor = UIColor.white
        title.font = UIFont.boldSystemFont(ofSize: 24)
        title.textAlignment = .center
    }
    
    fileprivate func setupViewConstraints() {
        
        view.snp.makeConstraints { (make) in
            make.top.equalTo(contentView).inset(8)
            make.leading.equalTo(contentView).inset(16)
            make.trailing.equalTo(contentView).inset(16)
            make.bottom.equalTo(contentView)
        }
        
        title.snp.makeConstraints { (make) in
            make.centerY.equalTo(view)
            make.left.equalTo(view).inset(10)
            make.right.equalTo(view)
            make.height.equalTo(view.snp.height)
        }
    }
    
    // MARK: Public
    
    class func reuseIdentifier() -> String {
        return "cz.pixmo.tricktionary.TrickLevelHeaderCell"
    }
}
