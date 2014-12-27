//
//  ViewController.swift
//  UIImagePickerControllerDemo
//
//  Created by ruby on 14-12-26.
//  Copyright (c) 2014年 ruby. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var imageView01: UIImageView!
    @IBOutlet weak var imageView02: UIImageView!
    @IBOutlet weak var imageView03: UIImageView!
    @IBOutlet weak var imageView04: UIImageView!
    
    var dic: Dictionary<String, String>!
    
    var myTapGesture = UITapGestureRecognizer()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myTapGesture.addTarget(self, action: "tappedView")
        self.imageView01.userInteractionEnabled = true
        self.imageView01.addGestureRecognizer(self.myTapGesture)
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
        imagePicker.sourceType = UIImagePickerControllerSourceType.SavedPhotosAlbum
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        var image: UIImage = info["UIImagePickerControllerOriginalImage"] as UIImage
        self.imageView01.image = image
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        println("用户取消")
    }
    
    func tappedView() {
        println("用户点击")
    }
}

