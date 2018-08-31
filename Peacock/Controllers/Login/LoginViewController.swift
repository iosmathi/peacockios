//
//  LoginViewController.swift
//  Peacock
//
//  Created by Mathivathani Murugesan on 31/08/18.
//  Copyright © 2018 Mathivathani Murugesan. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {
    
    @IBOutlet weak var viewLoginFacebook: UIView!
    @IBOutlet weak var viewLoginWithEmail: UIView!
    @IBOutlet weak var viewLoginPhoneNum: UIView!
    
    @IBOutlet weak var btnLoginFacebook: UIButton!
    @IBOutlet weak var btnLoginPhoneNum: UIButton!
    @IBOutlet weak var btnLoginWithEmail: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setShadowToView(myView: viewLoginFacebook)
        setShadowToView(myView: viewLoginWithEmail)
        setShadowToView(myView: viewLoginPhoneNum)
        buttonSetup(sender_tag: 1)
    }
    
    func buttonSetup(sender_tag: Int) {
        if sender_tag == 1 {
            //Button login with facebook action
             btnLoginFacebook.layer.insertSublayer(applyGradientDynamic(frame: CGRect(x: 0, y: 0, width: viewLoginFacebook.frame.size.width, height: viewLoginFacebook.frame.size.height), color1: UIColor(red:0.23, green:0.35, blue:0.6, alpha:1).cgColor, color2: UIColor(red:0.18, green:0.48, blue:1, alpha:1).cgColor, start_point: CGPoint(x: 0.01, y: 0), end_point: CGPoint(x: 1, y: 0), cornerRadius: 7), at: 0)
            btnLoginFacebook.setTitleColor(.white, for: .normal)
            btnLoginPhoneNum.setTitleColor(UIColor(red:0.50, green:0.50, blue:0.50, alpha:1.0), for: .normal)
             btnLoginWithEmail.setTitleColor(UIColor(red:0.50, green:0.50, blue:0.50, alpha:1.0), for: .normal)
        } else if sender_tag == 2 {
            //Btn Login with phone number
              btnLoginPhoneNum.layer.insertSublayer(applyGradientDynamic(frame: CGRect(x: 0, y: 0, width: viewLoginFacebook.frame.size.width, height: viewLoginFacebook.frame.size.height), color1: UIColor(red:0.23, green:0.35, blue:0.6, alpha:1).cgColor, color2: UIColor(red:0.18, green:0.48, blue:1, alpha:1).cgColor, start_point: CGPoint(x: 0.01, y: 0), end_point: CGPoint(x: 1, y: 0), cornerRadius: 7), at: 0)
            
            btnLoginPhoneNum.setTitleColor(.white, for: .normal)
            btnLoginFacebook.setTitleColor(UIColor(red:0.50, green:0.50, blue:0.50, alpha:1.0), for: .normal)
            btnLoginWithEmail.setTitleColor(UIColor(red:0.50, green:0.50, blue:0.50, alpha:1.0), for: .normal)
            
        } else if sender_tag == 3 {
            //Login with Email
            btnLoginWithEmail.layer.insertSublayer(applyGradientDynamic(frame: CGRect(x: 0, y: 0, width: viewLoginFacebook.frame.size.width, height: viewLoginFacebook.frame.size.height), color1: UIColor(red:0.23, green:0.35, blue:0.6, alpha:1).cgColor, color2: UIColor(red:0.18, green:0.48, blue:1, alpha:1).cgColor, start_point: CGPoint(x: 0.01, y: 0), end_point: CGPoint(x: 1, y: 0), cornerRadius: 7), at: 0)
            btnLoginWithEmail.setTitleColor(.white, for: .normal)
            btnLoginPhoneNum.setTitleColor(UIColor(red:0.50, green:0.50, blue:0.50, alpha:1.0), for: .normal)
            btnLoginFacebook.setTitleColor(UIColor(red:0.50, green:0.50, blue:0.50, alpha:1.0), for: .normal)
        }
    }
    
    //MARK: Button action
    @IBAction func didTapBtnLoginFacebookAction(_ sender: UIButton) {
        buttonSetup(sender_tag: sender.tag)
    }
    @IBAction func didTapBtnLoginPhoneNumAction(_ sender: UIButton) {
         buttonSetup(sender_tag: sender.tag)
    }
    @IBAction func didTapBtnLoginWithEmailAction(_ sender: UIButton) {
         buttonSetup(sender_tag: sender.tag)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
