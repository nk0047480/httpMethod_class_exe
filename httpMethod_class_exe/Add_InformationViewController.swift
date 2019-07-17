//
//  Add_InformationViewController.swift
//  httpMethod_class_exe
//
//  Created by Hsia JiaHung on 2019/7/10.
//  Copyright © 2019年 MEMS. All rights reserved.
//

import UIKit
import DLRadioButton

class Add_InformationViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var name_textfield: UITextField!
    //@IBOutlet weak var sex_textField: UITextField!
    @IBOutlet weak var birth_textField: UITextField!
    @IBOutlet weak var email_textField: UITextField!
    @IBOutlet weak var phone_textField: UITextField!
    @IBOutlet weak var add_textField: UITextField!
    
    var sex_str: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    

    @IBAction func fgdg(_ sender: DLRadioButton) {
        print("male")
        sex_str = "M"
    }
    
    @IBAction func hgjjjg(_ sender: DLRadioButton) {
        print("female")
        sex_str = "F"
    }
    

    
    /*@IBAction func DLR_btn(_ sender: DLRadioButton) {
        if sender.tag == 1 {
            print("egg")
        } else {
            print("apple")
        }
    }*/
    
    
    @IBAction func back_btn(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func touch(_ sender: UIButton) {
        if name_textfield.text == "" {
            print("nil")
        }
        else if sex_str == "" {
            print("nil")
        }
        else if birth_textField.text == "" {
            print("nil")
        }
        else if email_textField.text == "" {
            print("nil")
        }
        else if phone_textField.text == "" {
            print("nil")
        }
        else if add_textField.text == "" {
            print("nil")
        }
        else {
            print(name_textfield.text!)
            
            httpRequest.addInformation(postName: name_textfield.text!, postSex: sex_str, postBirth: birth_textField.text!, postEmail: email_textField.text!, postPhone: phone_textField.text!, postAdd: add_textField.text!)
        }

    }
    func configureTextField() {
        name_textfield.delegate = self
        //sex_textField.delegate = self
        birth_textField.delegate = self
        email_textField.delegate = self
        phone_textField.delegate = self
        add_textField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
     override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    

    
   /* override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }*/

    /*
     if name_textField.text == "" {
     print("nil")
     }
     else if sex_textField.text == "" {
     print("nil")
     }
     else {
     print(name_textField.text!)
     httpRequest.addInformation(postName: name_textField.text!, postSex: sex_textField.text!)
     
     }
     
     override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
     self.view.endEditing(true)
     }
    */
}

