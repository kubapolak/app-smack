//
//  ChannelVC.swift
//  smack
//
//  Created by Mac on 9/23/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
    }

    

}
