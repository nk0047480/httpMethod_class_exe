//
//  QRViewController.swift
//  httpMethod_class_exe
//
//  Created by Hsia JiaHung on 2019/7/17.
//  Copyright © 2019年 MEMS. All rights reserved.
//

import UIKit
import AVFoundation


class QRViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    

    
    @IBOutlet weak var videoPreview: UIImageView!
    
    enum error: Error {
        case noCamera
        case videoInputInitFail
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        do {
            
        } catch {
            print("failed to scan QRCode")
        }
        
    }
    
    
    
  
    

}
