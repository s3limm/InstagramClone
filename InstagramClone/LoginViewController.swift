//
//  LoginViewController.swift
//  InstagramClone
//
//  Created by Selim on 26.07.2024.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    var error = ErrorMiddleware()
    
    @IBOutlet weak var userText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func LoginButtonClicked(_ sender: Any) {
        
        if userText.text != "" && passwordText.text != ""{
            
            Auth.auth().signIn(withEmail: userText.text!, password: passwordText.text!) { authdata, error in
                
                if error != nil {
                    let alert = self.error.errorFunc(_title: "Error!", _message: error!.localizedDescription)
                }
                
                else {
                    self.performSegue(withIdentifier: "loginToHomeVC", sender: nil)
                }
                
            }
            
        }
        else {
            let alert = self.error.errorFunc(_title: "Boş Alan", _message: "Boş alanları doldurunuz")
            self.present(alert, animated: true)
        }
        
    }
    
    @IBAction func redirectToSignin(_ sender: Any) {
        performSegue(withIdentifier: "redirectToSigninVC", sender: nil)
    }
}
