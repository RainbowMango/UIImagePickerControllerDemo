//
//  ViewController.swift
//  UIImagePickerControllerDemo
//
//  Created by ruby on 14-12-26.
//  Copyright (c) 2014年 ruby. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    var dic: Dictionary<String, String>!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func getPicture(sender: AnyObject) {
        var imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        println(info)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        println("用户取消")
    }
}

