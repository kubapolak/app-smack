//
//  ProfileVC.swift
//  smack
//
//  Created by Mac on 9/27/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

    //Outlets
    
    @IBOutlet weak var profileImg: UIImageView!
    
    @IBOutlet weak var userName: UILabel!
    
    @IBOutlet weak var userEmail: UILabel!
    
    @IBOutlet weak var bgView: UIView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(ProfileVC.userNameDataDidChange(_:)), name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupView()
    }
    
    @objc func userDataDidChange(_ notif: Notification) {
        setupView()
    }
 
    @IBAction func closeModalPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func changeNameBtnPressed(_ sender: Any) {
            let changeName = ChangeNameVC()
            changeName.modalPresentationStyle = .custom
            present(changeName, animated: true, completion: setupView)
    }
    
    @IBAction func logOutPressed(_ sender: Any) {
        UserDataService.instance.logOutUser()
        NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
        dismiss(animated: true, completion: nil)
    }
    
    @objc func userNameDataDidChange(_ notif: Notification) {
        setupView()
    }
    
    func setupView() {
        userName.text = UserDataService.instance.name
        userEmail.text = UserDataService.instance.email
        profileImg.image = UIImage(named: UserDataService.instance.avatarName)
        profileImg.backgroundColor = UserDataService.instance.returnUIColor(components: UserDataService.instance.avatarColor)
        
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(ProfileVC.closeTap(_:)))
        bgView.addGestureRecognizer(closeTouch)

    }
    
    @objc func closeTap(_ recognizer: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
}
