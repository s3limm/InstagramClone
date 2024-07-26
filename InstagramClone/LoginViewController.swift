//
//  LoginViewController.swift
//  InstagramClone
//
//  Created by Selim on 26.07.2024.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func LoginButtonClicked(_ sender: Any) {
    }
    @IBAction func redirectToSignin(_ sender: Any) {
        performSegue(withIdentifier: "redirectToSigninVC", sender: nil)
    }
}
