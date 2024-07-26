//
//  SettingsViewController.swift
//  InstagramClone
//
//  Created by Selim on 26.07.2024.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func logoutButtonClicked(_ sender: Any) {
        performSegue(withIdentifier: "toSigninVC", sender: nil)
    }
}
