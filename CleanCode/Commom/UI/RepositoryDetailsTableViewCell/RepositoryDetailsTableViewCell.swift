//
//  RepositoryDetailsTableViewCell.swift
//  CleanCode
//
//  Created by Jose Martins on 22/03/21.
//

import UIKit

class RepositoryDetailsTableViewCell: UITableViewCell {
    @IBOutlet var lblFollowerName: UILabel!
    
    func loadUI(name: String?) {
        lblFollowerName.text = name
    }
}
