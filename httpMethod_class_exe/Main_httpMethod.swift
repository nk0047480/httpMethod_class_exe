//
//  Main_httpMethod.swift
//  httpMethod_class_exe
//
//  Created by Hsia JiaHung on 2019/7/8.
//  Copyright © 2019年 MEMS. All rights reserved.
//

import Foundation
import Alamofire
class httpRequest {
    
    static var responseData: Array<String> = []
    static var responseDetail: Array<String> = []
    
    static func getStudentInformation() {
        
        Alamofire.request("http://192.168.0.117/mySQL_exe/getStudentInformation.php", method: .post, parameters: ["name":"name"])
            .response { response in
                
                if response.data != nil {//解閉包，如果有東西則執行下列程式
                    if let utf8Text = String(data: response.data!, encoding: .utf8){
                        var utf8TextArr = utf8Text.components(separatedBy: " ")
                        utf8TextArr.removeLast()
                        self.responseData = utf8TextArr
                    }
                } else {
                    print("error")
                }
        }
    }
    
    static func getStudentDetail(name: String) {
        
        Alamofire.request("http://192.168.0.117/mySQL_exe/getDetail.php", method: .post, parameters: ["name":name])
            .response { response in
                
                if (response.data != nil) {//解閉包，如果有東西則執行下列程式
                    if let utf8Text = String(data: response.data!, encoding: .utf8) {
                        var utf8TextArr = utf8Text.components(separatedBy: " ")
                        utf8TextArr.removeLast()
                        self.labeltext(responseData: utf8TextArr)
                        //print("asdsadsadasd\(self.responseDetail)asdasdasda")
                    }
                } else {
                    print("error")
                }
        }
        //print("===========\(self.responseDetail)")
    }
    
    
    static func labeltext(responseData: Array<String>) {
        self.responseDetail = responseData
    }
    
    /*static func getStudentDetail(name: String) -> Array<String> {
        
        var returnArray: Array<String> = []
        
        Alamofire.request("http://192.168.0.117/mySQL_exe/getDetail.php", method: .post, parameters: ["name":name])
            .response { response in
                
                //print("wqeqweqwewqeqweqweqweqweqweqw\(response)wqewqeqweqwe")
                if response.data != nil {//解閉包，如果有東西則執行下列程式
                    if let utf8Text = String(data: response.data!, encoding: .utf8){
                        var utf8TextArr = utf8Text.components(separatedBy: " ")
                        utf8TextArr.removeLast()
                        self.responseDetail = utf8TextArr
                        print("-----\(self.responseDetail)")
                        returnArray = utf8TextArr
                        print("====dasd=====asdasda\(returnArray)")
                    }
                } else {
                    print("error")
                }
        }
        print("=========asdasda\(returnArray)")
        print("========///////////=asdasda\(self.responseDetail)")
        return returnArray
        
    }*/
    

    
    
}
