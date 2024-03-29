//
//  QRcodeViewController.swift
//  httpMethod_class_exe
//
//  Created by Hsia JiaHung on 2019/7/16.
//  Copyright © 2019年 MEMS. All rights reserved.
//

import UIKit
import AVFoundation

class QRcodeViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    //**
    

    @IBOutlet weak var view_iv: UIImageView!
    
    var captureSession: AVCaptureSession!
    //var previewLayer: AVCaptureVideoPreviewLayer!
    
    var QRCodeResponse = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        //**********
        captureSession = AVCaptureSession()
        
        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else { return }
        let videoInput: AVCaptureDeviceInput
        
        do {
            videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
        } catch {
            return
        }
        
        if (captureSession.canAddInput(videoInput)) {
            captureSession.addInput(videoInput)
        } else {
            failed()
            return
        }
        
        let metadataOutput = AVCaptureMetadataOutput()
        
        if (captureSession.canAddOutput(metadataOutput)) {
            captureSession.addOutput(metadataOutput)
            
            metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            metadataOutput.metadataObjectTypes = [.qr]
        } else {
            failed()
            return
        }
        
        let previewLayer = AVCaptureVideoPreviewLayer()
        previewLayer.frame = view_iv.bounds
        previewLayer.session = captureSession
        previewLayer.videoGravity = .resizeAspectFill
        view_iv.layer.addSublayer(previewLayer)
        
        /*previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.frame = view_iv.bounds
        previewLayer.videoGravity = .resizeAspectFill
        view.layer.addSublayer(previewLayer)*/
        
        captureSession.startRunning()

        // Do any additional setup after loading the view.
        
        
    }
   
   
    @IBAction func test(_ sender: UIButton) {
        
        let delayQueue = DispatchQueue(label: "delayQueue")
        print("Before: \(Date())")
        delayQueue.asyncAfter(deadline: DispatchTime.now() + 2) {
            print("After: \(Date())")
        }
        /*let alert = UIAlertController(title: "QRCode掃描錯誤", message: "請重新掃描", preferredStyle: .alert)
        let action = UIAlertAction(title: "ok", style: .default) { (UIAlertAction) in
            print("ok")
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)*/
    }
    
    
    func failed() {
        let ac = UIAlertController(title: "Scanning not supported", message: "Your device does not support scanning a code from an item. Please use a device with a camera.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
        captureSession = nil
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if (captureSession?.isRunning == true) {
            captureSession.stopRunning()
        }
    }
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        captureSession.stopRunning()
        
        if let metadataObject = metadataObjects.first {
            guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else { return }
            guard let stringValue = readableObject.stringValue else { return }
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
            found(code: stringValue)
        }
        
        //dismiss(animated: true)
    }
    
    func found(code: String) {
        print(code)
        QRCodeResponse = code
        if code == "ABCD65421844" {
            if let controller = storyboard?.instantiateViewController(withIdentifier: "view2") {
                present(controller, animated: true, completion: nil)
            }
        }
        else {
            
            
            
            let alert = UIAlertController(title: "QRCode掃描錯誤", message: "請重新掃描", preferredStyle: .alert)
            /*let action = UIAlertAction(title: "ok", style: .default) { (UIAlertAction) in
                print("ok")
            }*/
            //alert.addAction(action)
            present(alert, animated: true, completion: nil)
            
            let delayQueue = DispatchQueue(label: "delayQueue")//函式延遲呼叫
            print("Before: \(Date())")
            delayQueue.asyncAfter(deadline: DispatchTime.now() + 3) {
                print("After: \(Date())")
                self.captureSession.startRunning()
                alert.dismiss(animated: true, completion: nil)
            }
        }
        
    }
    
    /*override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }*/

}
