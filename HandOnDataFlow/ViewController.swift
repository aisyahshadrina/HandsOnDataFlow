//
//  ViewController.swift
//  HandOnDataFlow
//
//  Created by Aisyah Shadrina on 16/05/19.
//  Copyright © 2019 Aisyah Shadrina. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var fullnameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    
    
    @IBAction func registerPressed(_ sender: Any) {
        if fullnameTextField.text == "" || phoneTextField.text == ""{
            let alert = UIAlertController(title: "Error", message: "All text field must be filled", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default) { (alertAction) in
                alert.dismiss(animated: true, completion: nil)
            }
            alert.addAction(action)
            present (alert, animated: true, completion: nil)
        } else {
            performSegue(withIdentifier: "toConfirmPage", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ConfirmViewController {
            destination.fullname = fullnameTextField.text
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fullnameTextField.delegate = self
        phoneTextField.delegate = self
        // Do any additional setup after loading the view.
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == fullnameTextField {
            phoneTextField.becomeFirstResponder()
        } else if textField == phoneTextField {
            textField.resignFirstResponder()
        }
        
        return true
    }
}
