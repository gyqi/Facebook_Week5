//
//  PhotoViewController.swift
//  Facebook
//
//  Created by Grace Qi on 3/3/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var photoActionsImageView: UIImageView!

    var image: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = image
        scrollView.contentSize = CGSize(width: 320, height: 700)
        scrollView.delegate = self
        scrollView.backgroundColor = UIColor.blackColor()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pressDoneButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView!) {
        let scrollOffset = scrollView.contentOffset.y
        print("scroll offset: \(scrollOffset)")
        
        if scrollOffset >= 0 {
            let alpha = convertValue(scrollOffset, r1Min: 0, r1Max: 300, r2Min: 1, r2Max: 0)
            scrollView.backgroundColor = UIColor(white: 0, alpha: alpha)
        } else {
            let alpha = convertValue(scrollOffset, r1Min: 0, r1Max: -300, r2Min: 1, r2Max: 0)
            scrollView.backgroundColor = UIColor(white: 0, alpha: alpha)
        }


        // This method is called as the user scrolls
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView!) {
        let scrollOffset = scrollView.contentOffset.y
        doneButton.hidden = true
        photoActionsImageView.hidden = true
        
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView!,
        willDecelerate decelerate: Bool) {
            if scrollView.contentOffset.y >= 100 || scrollView.contentOffset.y <= -100 {
                dismissViewControllerAnimated(true, completion: nil)
            } else {
                doneButton.hidden = false
                photoActionsImageView.hidden = false
            }
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView!) -> UIView! {
        return imageView
    }
    
    func scrollViewDidZoom(scrollView: UIScrollView) {
        doneButton.hidden = true
        photoActionsImageView.hidden = true
    }
    
    func scrollViewDidEndZooming(scrollView: UIScrollView, withView view: UIView?, atScale scale: CGFloat) {
        if scale == 1 {
            doneButton.hidden = false
            photoActionsImageView.hidden = false
        }

    }


}
