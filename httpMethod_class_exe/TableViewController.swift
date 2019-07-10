//
//  TableViewController.swift
//  httpMethod_class_exe
//
//  Created by Hsia JiaHung on 2019/7/8.
//  Copyright © 2019年 MEMS. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var didSelectName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(httpRequest.responseData)
    }
    
    @IBAction func back_btn(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return httpRequest.responseData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = httpRequest.responseData[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(httpRequest.responseData[indexPath.row])
        didSelectName = httpRequest.responseData[indexPath.row]
        self.performSegue(withIdentifier: "showDetail_segue", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! detailViewController
        controller.passSelectName = didSelectName
    }
    
}
