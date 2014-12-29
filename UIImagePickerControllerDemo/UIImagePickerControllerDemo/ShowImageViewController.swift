//
//  ShowImageViewController.swift
//  UIImagePickerControllerDemo
//
//  Created by ruby on 14-12-29.
//  Copyright (c) 2014年 ruby. All rights reserved.
//

import UIKit

class ShowImageViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var topToolbar_: UIToolbar!
    @IBOutlet weak var bottomToolbar_: UIToolbar!
    
    var image: UIImage!
    var myTapGesture_ = UITapGestureRecognizer()
    var isToolbarHidden_ = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBarHidden = true
        myTapGesture_.addTarget(self, action: "tappedView")
        setImageView()
        setScrollView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setImageView() {
        self.imageView.contentMode = UIViewContentMode.ScaleAspectFit
        self.imageView.image = self.image
        self.imageView.userInteractionEnabled = true
        imageView.addGestureRecognizer(myTapGesture_)
    }
    
    func setScrollView() {
        self.scrollView.delegate = self
        self.scrollView.minimumZoomScale = 0.5
        self.scrollView.maximumZoomScale = 5
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        for subview: AnyObject in scrollView.subviews {
            if subview.isKindOfClass(UIImageView) {
                println(subview.size)
                return subview as? UIView
            }
        }
        
        return nil
    }
    
    func tappedView() {
        if isToolbarHidden_ {
            self.view.bringSubviewToFront(topToolbar_)
            self.view.bringSubviewToFront(bottomToolbar_)
            isToolbarHidden_ = false
        }
        else {
            self.view.sendSubviewToBack(topToolbar_)
            self.view.sendSubviewToBack(bottomToolbar_)
            isToolbarHidden_ = true
        }
    }
}
