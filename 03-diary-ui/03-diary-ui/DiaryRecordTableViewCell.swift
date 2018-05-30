//
//  DiaryRecordTableViewCell.swift
//  03-diary-ui
//
//  Created by Mariana Ruzhytska on 28/05/2018.
//  Copyright © 2018 Mariana Ruzhytska. All rights reserved.
//

import UIKit

class DiaryRecordTableViewCell: UITableViewCell {
    
    static let identifier: String = "diaryCell"
    
    @IBOutlet weak var title: UILabel!
//    class var identifier: String {
//        return String(describing: self)
//    }
    class var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
