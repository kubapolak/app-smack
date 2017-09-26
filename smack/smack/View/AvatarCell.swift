//
//  AvatarCell.swift
//  smack
//
//  Created by Mac on 9/26/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit

class AvatarCell: UICollectionViewCell {
    
    @IBOutlet weak var avatarImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpView()
    }
    
    func setUpView() {
        self.layer.backgroundColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
    }
}
