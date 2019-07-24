//
//  NVActivityIndicatorViewViewController.swift
//  httpMethod_class_exe
//
//  Created by Hsia JiaHung on 2019/7/23.
//  Copyright © 2019年 MEMS. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class NVActivityIndicatorViewViewController: UIViewController, NVActivityIndicatorViewable {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func type1(_ sender: UIButton) {
        let size = CGSize(width: 30.0, height: 30.0)
        startAnimating(size, message: "loading", type: NVActivityIndicatorType.ballPulse, color: UIColor.red, textColor: UIColor.white, fadeInAnimation: nil)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            NVActivityIndicatorPresenter.sharedInstance.stopAnimating(nil)
        }
    }
    
    @IBAction func type2(_ sender: UIButton) {
        let size = CGSize(width: 30.0, height: 30.0)
        startAnimating(size, message: "loading", type: NVActivityIndicatorType.ballBeat, color: UIColor.red, textColor: UIColor.white, fadeInAnimation: nil)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            NVActivityIndicatorPresenter.sharedInstance.stopAnimating(nil)
        }
    }
    
    @IBAction func type3(_ sender: Any) {
        let size = CGSize(width: 30.0, height: 30.0)
        startAnimating(size, message: "loading", type: NVActivityIndicatorType.lineScale, color: UIColor.red, textColor: UIColor.white, fadeInAnimation: nil)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            NVActivityIndicatorPresenter.sharedInstance.stopAnimating(nil)
        }
    }
    
    
    @IBAction func type4(_ sender: Any) {
        let size = CGSize(width: 30.0, height: 30.0)
        startAnimating(size, message: "loading", type: NVActivityIndicatorType.circleStrokeSpin, color: UIColor.red, textColor: UIColor.white, fadeInAnimation: nil)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            NVActivityIndicatorPresenter.sharedInstance.stopAnimating(nil)
        }
    }
    
    

    @IBAction func type5(_ sender: Any) {
        let size = CGSize(width: 30.0, height: 30.0)
        startAnimating(size, message: "loading", type: NVActivityIndicatorType.ballRotateChase, color: UIColor.red, textColor: UIColor.white, fadeInAnimation: nil)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            NVActivityIndicatorPresenter.sharedInstance.stopAnimating(nil)
        }
    }
}
