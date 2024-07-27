//
//  SettingsViewController.swift
//  InstagramClone
//
//  Created by Selim on 26.07.2024.
//

import UIKit
import Firebase

class SettingsViewController: UIViewController {

    var error = ErrorMiddleware()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func logoutButtonClicked(_ sender: Any) {
        
        do {
            try Auth.auth().signOut()
            performSegue(withIdentifier: "toSigninVC", sender: nil)
        }
        catch {
            let alert = self.error.errorFunc(_title: "Bir sorunla karşılaşıldı", _message: "Çıkış yapılamadı lütfen tekrar deneyiniz")
        }
        
    }
}
