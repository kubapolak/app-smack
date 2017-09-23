//
//  CreateAccountVC.swift
//  smack
//
//  Created by Mac on 9/23/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func closePressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }

}
