

import UIKit
import Alamofire

class SignInViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var mail_tf: UITextField!
    @IBOutlet weak var password_tf: UITextField!
    
    @IBOutlet weak var inputTextField: UITextField!
    
    private var datePicker: UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTextField()
        
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        inputTextField.inputView = datePicker
        datePicker?.addTarget(self, action: #selector(SignInViewController.dateChange(datePicker:)), for: .valueChanged)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(SignInViewController.viewTapped(gestureRecognizer:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @objc func dateChange(datePicker: UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        inputTextField.text = dateFormatter.string(from: datePicker.date)
        view.endEditing(true)
    }
    
    @IBAction func back_btn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signIn_btn(_ sender: Any) {

        if mail_tf.text == "" {
            print("mail nil")
        }
        else if password_tf.text == "" {
            print("password nil")
        }
        else {
            let mail = mail_tf.text
            login2(postEmail: mail!, enterPassword: password_tf.text!)
            
        }
    }
    
    
    //http method1
    func login(postEmail: String, enterPassword: String) {
        Alamofire.request("http://140.116.226.182/mems_main/selectDB.php", method: .post, parameters: ["loginEmail":postEmail])
            .response { response in
                
                if (response.data != nil) {//解閉包，如果有東西則執行下列程式
                    if let utf8Text = String(data: response.data!, encoding: .utf8) {
                        print("-----password-----\(utf8Text)-------------")
                        
                        //subString
                        let startindex = utf8Text.index(utf8Text.startIndex, offsetBy: 11)
                        let endIndex = utf8Text.index(utf8Text.endIndex, offsetBy: -2)
                        let str = utf8Text[startindex...endIndex]
                        
                        //subString
                        
                        
                        self.passwordConfirm(password: String(str), enterPassword: enterPassword)
                        
                        
                    }
                } else {
                    print("error")
                }
        }
    }
    
    func passwordConfirm(password: String, enterPassword: String) {
        print("password:\(password), enterPassword:\(enterPassword)")
        print(password)
        print(enterPassword)
        if password == enterPassword {
            print("good")
            self.performSegue(withIdentifier: "login_segue", sender: self)//換頁
        }
        else {
            print("fail")
        }
    }
    //http method1
    
    //http method2
    func login2(postEmail: String, enterPassword: String) {
        Alamofire.request("http://140.116.226.182/mems_main/selectDB2.php", method: .post, parameters: ["loginEmail":postEmail, "loginPassword":enterPassword])
            .response { response in
                
                if (response.data != nil) {//解閉包，如果有東西則執行下列程式
                    if let utf8Text = String(data: response.data!, encoding: .utf8) {
                        print("----------\(utf8Text)-------------")
                        
                        if utf8Text == "success" {
                            self.passwordConfirm2()
                        }
                        else {
                            print("帳號密碼錯誤")
                        }
                        
                        
                    }
                } else {
                    print("error")
                }
        }
    }
    
    func passwordConfirm2() {
        self.performSegue(withIdentifier: "login_segue", sender: self)//換頁
    }
    //http method2
    
    
    
    
    
    
    
    
    
    
    
    //textField函式
    func configureTextField() {
        mail_tf.delegate = self
        password_tf.delegate = self
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    //textField函式
}
