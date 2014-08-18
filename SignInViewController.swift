//
//  SignInViewController.swift
//  Carousel
//
//  Created by Sam Jau on 8/18/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, UIAlertViewDelegate{

    @IBOutlet weak var loginTextImageView: UIImageView!
    @IBOutlet weak var loginGroupView: UIView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var loginFormImageView: UIImageView!
    @IBOutlet weak var signInButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        println("asdf")
        UIView.animateWithDuration(0.5, animations: {
            self.loginGroupView.center.y = 141
            self.loginTextImageView.center.y = -4
            self.signInButton.center.y = 250
        }, completion: nil)
    }
    
    @IBAction func onSignInButton(sender: AnyObject) {
        if emailTextField.text.isEmpty || passwordTextField.text.isEmpty {
            var emptyFieldAlertView = UIAlertView(title: "Oops", message: "Please enter your Email & Password", delegate: nil, cancelButtonTitle: "OK")
            emptyFieldAlertView.show()
        }
        else{
            var signingInAlertView = UIAlertView(title: "Signing In", message: nil, delegate: self, cancelButtonTitle: nil)
            signingInAlertView.show()
            delay(2){
                if self.emailTextField.text == "email" && self.passwordTextField.text == "pw" {
                    self.performSegueWithIdentifier("signedInSegue", sender: self)
                    signingInAlertView.dismissWithClickedButtonIndex(0, animated: true)
                }
                else {
                    signingInAlertView.dismissWithClickedButtonIndex(0, animated: true)
                    var incorrectAlertView = UIAlertView(title: "Oops", message: "Wrong email and password combination", delegate: nil, cancelButtonTitle: "OK")
                    incorrectAlertView.show()
                }
            }
        }

    }

    @IBAction func tapView(sender: AnyObject) {
        view.endEditing(true)
    }
    func keyboardWillHide(notification: NSNotification!) {
        var userInfo = notification.userInfo
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
        var animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions.fromRaw(UInt(animationCurve << 16))!, animations: {
                self.loginGroupView.center.y = 237
                self.loginTextImageView.center.y = 116
                self.signInButton.center.y = 504
            // Set view properties in here that you want to match with the animation of the keyboard
            // If you need it, you can use the kbSize property above to get the keyboard width and height.
            }, completion: nil)
    }

    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    
}
