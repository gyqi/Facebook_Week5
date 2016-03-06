//
//  PhotoTransition.swift
//  Facebook
//
//  Created by Grace Qi on 3/5/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class PhotoTransition: BaseTransition {
    
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        let newsfeedViewController = fromViewController as! NewsFeedViewController
        let photoViewController = toViewController as! PhotoViewController
        
        //Clone the selected image
        let transitionImageView = UIImageView()
        transitionImageView.frame = newsfeedViewController.scrollView.convertRect(newsfeedViewController.selectedImageView.frame, toView: newsfeedViewController.view)
        transitionImageView.image = newsfeedViewController.selectedImageView.image
        transitionImageView.clipsToBounds = newsfeedViewController.selectedImageView.clipsToBounds
        transitionImageView.contentMode = newsfeedViewController.selectedImageView.contentMode
        containerView.addSubview(transitionImageView)
        
        photoViewController.imageView.alpha = 0
        newsfeedViewController.selectedImageView.alpha = 0
        photoViewController.view.alpha = 0

        UIView.animateWithDuration(duration, animations: {
            photoViewController.view.alpha = 1
            transitionImageView.frame = photoViewController.imageView.frame
            transitionImageView.contentMode = photoViewController.imageView.contentMode
            
            }) { (finished: Bool) -> Void in
                photoViewController.imageView.alpha = 1
                transitionImageView.removeFromSuperview()
                self.finish()
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        let newsfeedViewController = toViewController as! NewsFeedViewController
        let photoViewController = fromViewController as! PhotoViewController
        
        let transitionImageView = UIImageView()
        transitionImageView.frame = photoViewController.imageView.frame
        transitionImageView.image = photoViewController.imageView.image
        transitionImageView.clipsToBounds = photoViewController.imageView.clipsToBounds
        transitionImageView.contentMode = photoViewController.imageView.contentMode
        containerView.addSubview(transitionImageView)

        photoViewController.imageView.alpha = 0
        photoViewController.view.alpha = 1
        newsfeedViewController.selectedImageView.alpha = 0
        
        UIView.animateWithDuration(duration, animations: {
            fromViewController.view.alpha = 0
            transitionImageView.frame = newsfeedViewController.scrollView.convertRect(newsfeedViewController.selectedImageView.frame, toView: newsfeedViewController.view)
            
            }) { (finished: Bool) -> Void in
                newsfeedViewController.selectedImageView.alpha = 1
                transitionImageView.removeFromSuperview()
                print("done")

                self.finish()
        }
    }
}