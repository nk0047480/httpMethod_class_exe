//
//  detailViewController.swift
//  httpMethod_class_exe
//
//  Created by Hsia JiaHung on 2019/7/9.
//  Copyright © 2019年 MEMS. All rights reserved.
//

import UIKit
import Alamofire

class detailViewController: UIViewController {
    
    var passSelectName = ""

    
    
    
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var IDLable: UILabel!
    @IBOutlet weak var sexLable: UILabel!
    @IBOutlet weak var birthLable: UILabel!
    @IBOutlet weak var emailLable: UILabel!
    @IBOutlet weak var phoneLable: UILabel!
    @IBOutlet weak var addLable: UILabel!
    
    @IBAction func back_btn(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLable.text = passSelectName
        self.getStudentDetail(name: passSelectName)

    }
    
    func getStudentDetail(name: String) {
        
        Alamofire.request("http://192.168.0.117/mySQL_exe/getDetail.php", method: .post, parameters: ["name":name])
            .response { response in
                
                if (response.data != nil) {//解閉包，如果有東西則執行下列程式
                    if let utf8Text = String(data: response.data!, encoding: .utf8) {
                        var utf8TextArr = utf8Text.components(separatedBy: " ")
                        utf8TextArr.removeLast()
                        print(utf8TextArr)
                        print(utf8TextArr[0])
                        self.IDLable.text = "學生座號為：\(utf8TextArr[0])"
                        self.sexLable.text = "性別：\(utf8TextArr[2])"
                        self.birthLable.text = "出年月日:\(utf8TextArr[3])"
                        self.phoneLable.text = "手機號碼：\(utf8TextArr[5])"
                        self.emailLable.text = "信箱：\(utf8TextArr[4])"
                        self.addLable.text = "地址:\(utf8TextArr[6])"
                    }
                } else {
                    print("error")
                }
        }
        //print("===========\(self.responseDetail)")
    }
    

}
