

import UIKit
import DLRadioButton
class AccountViewController: UIViewController, UITextFieldDelegate {
    
    
    var sex_str: String = ""
    
    var height = CGRect(x: 0, y: 0, width: 10, height: 10)
    var activeTextField: UITextField!
    
    
    @IBOutlet weak var name_tf: UITextField!
    @IBOutlet weak var birth_tf: UITextField!
    @IBOutlet weak var addr_tf: UITextField!
    @IBOutlet weak var mail_tf: UITextField!
    @IBOutlet weak var password_tf: UITextField!
    @IBOutlet weak var passwordConfirm_tf: UITextField!
    
    @IBAction func male_rbtn(_ sender: DLRadioButton) {
        sex_str = "M"
    }
    
    @IBAction func female_rbtn(_ sender: DLRadioButton) {
        sex_str = "F"
    }
    
    @IBAction func creat_btn(_ sender: UIButton) {
        if name_tf.text == "" {
            print("name nil")
        }
        else if sex_str == "" {
            print("sex nil")
        }
        else if birth_tf.text == "" {
            print("birth nil")
        }
        else if addr_tf.text == "" {
            print("addr nil")
        }
        else if mail_tf.text == "" {
            print("mail nil")
        }
        else if password_tf.text == "" {
            print("password nil")
        }
        else if passwordConfirm_tf.text == "" {
            print("password confirm nil")
        }
        else {
            print("information all down")
            if password_tf.text == passwordConfirm_tf.text {
                httpRequest.addInformation(postName: name_tf.text!, postSex: sex_str, postBirth: birth_tf.text!, postAddr: addr_tf.text!, postEmail: mail_tf.text!, postPassword: password_tf.text!)
                print("have send to server")
            }
            else {
                print("password did not confirm")
                print(passwordConfirm_tf.text!)
                print(password_tf.text!)
            }
        }
    }
    @IBAction func back_btn(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    /*@IBAction func touch(_ sender: UIButton) {
        if name_textField.text == "" {
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
        else if password_textField.text == "" {
            print("nil")
        }
        else if passwordConfirm.text == "" {
            print("nil")
        }
        else {
            print("http")
            httpRequest.addInformation(postName: name_textField.text!, postSex: sex_str, postBirth: birth_textField.text!, postAddr: addr_textField.text!, postEmail: email_textField.text!, postPassword: password_textField.text!)
            //httpRequest.addInformation(postName: name_textfield.text!, postSex: sex_str, postBirth: birth_textField.text!, postEmail: email_textField.text!, postPhone: phone_textField.text!, postAdd: add_textField.text!)
        }
        
    }*/
    
    
    
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        activeTextField = textField
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        view.frame.origin.y = 0
    }
    
    deinit {
        //stop listening for keyboard hide/show events
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        
    }
    @objc func keyboardWillChange(notification: Notification) {
        print("Keyboard will show: \(notification.name.rawValue)")
        
        guard let keyboardRect = (notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        
        if activeTextField == mail_tf || activeTextField == password_tf || activeTextField == passwordConfirm_tf {
            view.frame.origin.y = -keyboardRect.height
        }
        /*if notification.name == UIResponder.keyboardWillShowNotification || notification.name == UIResponder.keyboardWillChangeFrameNotification {
            view.frame.origin.y = -keyboardRect.height
        } else {
            view.frame.origin.y = 0
        }*/
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTextField()
        //****
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        
        print("viewDidLoad")

    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear")
    }
    
    func configureTextField() {
        name_tf.delegate = self
        birth_tf.delegate = self
        mail_tf.delegate = self
        addr_tf.delegate = self
        password_tf.delegate = self
        passwordConfirm_tf.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //按return收起鍵盤
        textField.resignFirstResponder()
        return true
    }
    //**
    
    //**
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //點空白處收起鍵盤
        self.view.endEditing(true)
    }
    
    
   

   

}
