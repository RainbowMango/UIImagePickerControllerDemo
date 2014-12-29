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
    
    var image: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setImageView()
        setScrollView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setImageView() {
        //self.imageView.frame = self.view.frame
        //self.imageView.contentMode = UIViewContentMode.ScaleAspectFit
        self.imageView.image = self.image
        //self.scrollView.addSubview(self.imageView)
    }
    
    func setScrollView() {
        //self.scrollView.frame = self.view.frame
        //self.scrollView.contentSize = self.view.frame.size
        self.scrollView.delegate = self
        //self.scrollView.minimumZoomScale = 0.5
        //self.scrollView.maximumZoomScale = 5
        //self.view.addSubview(self.scrollView)
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
}
