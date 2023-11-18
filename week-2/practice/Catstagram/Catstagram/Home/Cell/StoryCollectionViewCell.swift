//
//  StoryCollectionViewCell.swift
//  Catstagram
//
//  Created by Oh Chi Hyun on 2023/11/18.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var viewImageViewBackground: UIView!
    
    @IBOutlet weak var imageViewUserProfile: UIImageView!
    @IBOutlet weak var viewUserProfileBackground: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        viewImageViewBackground.layer.cornerRadius = 24
        viewUserProfileBackground.layer.cornerRadius = 23.5
        imageViewUserProfile.layer.cornerRadius = 22.5
        imageViewUserProfile.clipsToBounds = true
    }

}
