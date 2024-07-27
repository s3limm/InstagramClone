//
//  UploadViewController.swift
//  InstagramClone
//
//  Created by Selim on 26.07.2024.
//

import UIKit
import FirebaseStorage

class UploadViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    var error = ErrorMiddleware()
    
    @IBOutlet weak var commentText: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let keyboardGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(keyboardGestureRecognizer)
        
        imageView.isUserInteractionEnabled = true
        let imageViewGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ImageSelection))
        imageView.addGestureRecognizer(imageViewGestureRecognizer)
       
    }
    
    @objc func ImageSelection()
    {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true)
        
    }
    
    //What will happen after choosed image
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info:  [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func hideKeyboard()
    {
        view.endEditing(true)
    }
    

    
    @IBAction func shareButtonClicked(_ sender: Any) {
        
        let storage = Storage.storage()
        
        let storageReferance = storage.reference()

        let mediaFolder = storageReferance.child("media")
        
        
        
        if let data = imageView.image?.jpegData(compressionQuality: 0.5)
        {
            let uuid = UUID().uuidString
            
            let imageReferance = mediaFolder.child("\(uuid).jpg")
            imageReferance.putData(data, metadata: nil) { metadata, error in
                
                if error != nil {
                    let alert =  self.error.errorFunc(_title: "Error!", _message: error!.localizedDescription)
                    self.present(alert, animated: true)
                }
                else {
                    imageReferance.downloadURL { url, error in
                        
                        if error == nil{
                            
                            let imageUrl = url?.absoluteString
                            print(imageUrl)
                            
                        }
                    }
                }
                
            }
        }
        
    }
    

}
