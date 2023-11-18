//
//  BucketTableViewCell.swift
//  BucketSystem
//
//  Created by Oh Chi Hyun on 2023/11/13.
//

import UIKit

class BucketTableViewCell: UITableViewCell {

    @IBOutlet weak var dowLavel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.dowLavel.text = "도우변경 : 도우";
        self.sizeLabel.text = "";
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
