//
//  ViewController.swift
//  SwipeLogin
//
//  Created by Yilun Liu on 10/22/14.
//  Copyright (c) 2014 Yilun Liu. All rights reserved.
//

import UIKit

let pageNumber = 3
let btnPadding: CGFloat = 40
let btnWidth: CGFloat = 100
let btnHeight: CGFloat = 35
class ViewController: UIViewController,UIGestureRecognizerDelegate {

    
    
    var index = 0
    var background: UIImageView!
    var backgroundAnimation: UIImageView!
    var signUpBtn: UIButton!
    var loginInBtn: UIButton!
    var descriptionLabel: UILabel!
    var pageControl: UIPageControl!
    lazy var images: [UIImage] =
    {
        var images = [UIImage]()
        for var i=1 ; i<=pageNumber; i++
        {
            var image = UIImage(named: "\(i)")
            images.append(image)
        }
        return images
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        index = 0;
        
        self.background = UIImageView()
        background.backgroundColor = UIColor.blackColor()
        background.frame = self.view.frame
        background.image = images[index]
        background.userInteractionEnabled = true
        var rightRecognizer = UISwipeGestureRecognizer(target: self, action: "showGestureForSwipeRecognizer:")
        rightRecognizer.direction = UISwipeGestureRecognizerDirection.Right
        background.addGestureRecognizer(rightRecognizer)
        var leftRecognizer = UISwipeGestureRecognizer(target: self, action: "showGestureForSwipeRecognizer:")
        leftRecognizer.direction = UISwipeGestureRecognizerDirection.Left
        background.addGestureRecognizer(leftRecognizer)
        view.addSubview(background)
        
        self.backgroundAnimation = UIImageView()
        backgroundAnimation.backgroundColor = UIColor.clearColor()
        backgroundAnimation.frame = self.view.frame
        backgroundAnimation.image = images[index]
        backgroundAnimation.alpha = 0.0
        view.addSubview(backgroundAnimation)
        
        
        signUpBtn = UIButton()
        signUpBtn.frame = CGRectMake(btnPadding, self.view.frame.height*5/6, btnWidth, btnHeight)
        signUpBtn.backgroundColor = UIColor.grayColor()
        signUpBtn.setTitle("Sign Up", forState: UIControlState.Normal)
        view.addSubview(signUpBtn)
        
        loginInBtn = UIButton()
        loginInBtn.frame = CGRectMake(self.view.frame.width - btnPadding - btnWidth, self.view.frame.height*5/6, btnWidth, btnHeight)
        loginInBtn.backgroundColor = UIColor.grayColor()
        loginInBtn.setTitle("Login", forState: UIControlState.Normal)
        view.addSubview(loginInBtn)
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    //gesture swipe regconize
    func showGestureForSwipeRecognizer(recognizer:UISwipeGestureRecognizer)
    {
        if recognizer.direction == UISwipeGestureRecognizerDirection.Right
        {
            if index > 0
            {
                index--
            }
        }
        
        if recognizer.direction == UISwipeGestureRecognizerDirection.Left
        {
            if index < pageNumber-1
            {
                index++
            }
        }
        
        backgroundAnimation.image = self.images[self.index]
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.background.alpha = 0.1
            self.backgroundAnimation.alpha = 0.9
            
            }) { (complete:Bool) -> Void in
            self.background.alpha = 1
            self.background.image = self.images[self.index]
            self.backgroundAnimation.alpha = 0.0
        }
        
    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}