//
//  ChangeNameVC.swift
//  smack
//
//  Created by Mac on 10/1/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit

class ChangeNameVC: UIViewController {

    //Outlets
    
    @IBOutlet weak var currentNameLbl: UILabel!
    
    @IBOutlet weak var newNameTxt: UITextField!
    
    @IBOutlet weak var bgView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    @IBAction func closeModalPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func changeNamePressed(_ sender: Any) {
        guard let newName = newNameTxt.text , newNameTxt.text != "" else { return }
        AuthService.instance.updateUserName(newName: newName) { (success) in
            if success {
                UserDataService.instance.refreshUserName(newName: newName)
                NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
                self.dismiss(animated: true, completion: nil)
            } else {
                print("o-oh!")
            }
        }
    }
    
    func setupView() {
        currentNameLbl.text = UserDataService.instance.name
        
        newNameTxt.attributedPlaceholder = NSAttributedString(string: "new name", attributes: [NSAttributedStringKey.foregroundColor: smackPurplePlaceHolder])
        
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(ProfileVC.closeTap(_:)))
        bgView.addGestureRecognizer(closeTouch)
        
    }
    
    @objc func closeTap(_ recognizer: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }

}
