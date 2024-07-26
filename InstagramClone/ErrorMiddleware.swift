//
//  ErrorMiddleware.swift
//  InstagramClone
//
//  Created by Selim on 26.07.2024.
//

import Foundation
import UIKit

class ErrorMiddleware {
    
    
    func errorFunc(_title : String, _message : String) -> UIAlertController{
        
        let alert = UIAlertController(title: _title, message: _message, preferredStyle: UIAlertController.Style.alert)
        
        let action = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default) { UIAlertAction in
        print("Ok button Clicked")
        }
        
        alert.addAction(action)
        
        return alert
    }

    
}
