//
//  ViewController.swift
//  InstagramClone
//
//  Created by Selim on 25.07.2024.
//

import UIKit
import Firebase


class ViewController: UIViewController {
    @IBOutlet weak var nameText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    var error = ErrorMiddleware()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func signinButtonClicked(_ sender: Any) {
        
        if nameText.text != "" && passwordText.text != ""
        {
            Auth.auth().createUser(withEmail: nameText.text!, password: passwordText.text!) { authData, error in
                
                if error != nil {
                    let alert = self.error.errorFunc(_title: "Error!", _message: error!.localizedDescription)
                    self.present(alert, animated: true)
                }
                else{
                    self.performSegue(withIdentifier: "toHomeVC", sender: nil)
                }
                
            }
        }
        
        else{
            let action = error.errorFunc(_title: "Boş Alan", _message: "Boş alanları doldurunuz")
            self.present(action, animated: true)
        }
        
    }
    
    
    @IBAction func loginButtonClicked(_ sender: Any) {
        performSegue(withIdentifier: "toLoginVC", sender: nil)
    }
    
}

