//
//  ViewController.swift
//  Week 13
//
//  Created by Thomas Hinrichs on 03/04/2020.
//  Copyright © 2020 Thomas Hinrichs. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var imageTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        
        let Tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(DismissKeyboard))
        
        view.addGestureRecognizer(Tap)
    }
    
    @objc func DismissKeyboard() {
        
        view.endEditing(true)
    }
    
    @IBAction func photoBtnPressed(_ sender: UIButton) {
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func cameraBtnPressed(_ sender: UIButton) {
        launchCamera()
    }
    
    fileprivate func launchCamera() {
        imagePicker.sourceType = .camera
        imagePicker.showsCameraControls = true
        imagePicker.allowsEditing = true
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = image
        } else {
            print("Error")
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveImageTextBtnPressed(_ sender: UIButton) {
        let s = imageTextField.text!
        let s2 = NSAttributedString(string: s, attributes: [.font: UIFont(name: "Georgia", size: 100)!, .foregroundColor: UIColor.white])
        let sz = imageView.image!.size
        let r = UIGraphicsImageRenderer(size: sz)
        imageView.image = r.image {
            _ in
            imageView.image!.draw(at:.zero)
            s2.draw(at: CGPoint(x: 30, y: sz.height-150))
        }
    }
    
}

