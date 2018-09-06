//
//  ExpandLoginViewController.swift
//  Peacock
//
//  Created by Mathivathani Murugesan on 03/09/18.
//  Copyright © 2018 Mathivathani Murugesan. All rights reserved.
//

import UIKit

class ExpandLoginViewController: BaseViewController {

    @IBOutlet weak var viewLoginWithEmail: UIView!
    @IBOutlet weak var viewLoginPhoneNum: UIView!
    @IBOutlet weak var viewLoginFacebook: UIView!
    
    @IBOutlet weak var btnLoginFacebook: UIButton!
    @IBOutlet weak var btnLoginPhoneNum: UIButton!
    @IBOutlet weak var btnLoginWithEmail: UIButton!
    
    @IBOutlet weak var lblTermsText: UILabel!
    @IBOutlet weak var lblPrivacyDetails: UILabel!
    
    @IBOutlet weak var dummyView: UIView!
    @IBOutlet weak var stackView: UIStackView!
    //For device change
    @IBOutlet weak var viewBottomHeight: NSLayoutConstraint!
    @IBOutlet weak var lblTermsTextTop: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Add for animation swipe up
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeDown.direction = UISwipeGestureRecognizerDirection.down
        self.view.addGestureRecognizer(swipeDown)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewSetup()
        setShadowToView(myView: viewLoginFacebook)
        setShadowToView(myView: viewLoginWithEmail)
        setShadowToView(myView: viewLoginPhoneNum)
        textRangechanges()
    }

    //Response to gesture
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
    
    //Set up the login view gradient
    func buttonSetup(sender_tag: Int) {
        if sender_tag == 1 {
            //Button login with facebook action
            btnLoginFacebook.layer.insertSublayer(applyGradientDynamic(frame: CGRect(x: 0, y: 0, width: btnLoginFacebook.frame.size.width, height: btnLoginFacebook.frame.size.height), color1: UIColor(red:0.23, green:0.35, blue:0.6, alpha:1).cgColor, color2: UIColor(red:0.18, green:0.48, blue:1, alpha:1).cgColor, start_point: CGPoint(x: 0.01, y: 0), end_point: CGPoint(x: 1, y: 0), cornerRadius: 7, name: (btnLoginFacebook.titleLabel?.text)!), at: 0)
            btnLoginFacebook.setTitleColor(.white, for: .normal)
            btnLoginPhoneNum.setTitleColor(UIColor(red:0.50, green:0.50, blue:0.50, alpha:1.0), for: .normal)
            btnLoginWithEmail.setTitleColor(UIColor(red:0.50, green:0.50, blue:0.50, alpha:1.0), for: .normal)
        } else if sender_tag == 2 {
            //Btn Login with phone number
            btnLoginPhoneNum.layer.insertSublayer(applyGradientDynamic(frame: CGRect(x: 0, y: 0, width: btnLoginPhoneNum.frame.size.width, height: btnLoginPhoneNum.frame.size.height), color1: UIColor(red:0.23, green:0.35, blue:0.6, alpha:1).cgColor, color2: UIColor(red:0.18, green:0.48, blue:1, alpha:1).cgColor, start_point: CGPoint(x: 0.01, y: 0), end_point: CGPoint(x: 1, y: 0), cornerRadius: 7, name: (btnLoginPhoneNum.titleLabel?.text)!), at: 0)
            btnLoginPhoneNum.setTitleColor(.white, for: .normal)
            btnLoginFacebook.setTitleColor(UIColor(red:0.50, green:0.50, blue:0.50, alpha:1.0), for: .normal)
            btnLoginWithEmail.setTitleColor(UIColor(red:0.50, green:0.50, blue:0.50, alpha:1.0), for: .normal)
            
        } else if sender_tag == 3 {
            //Login with Email
            btnLoginWithEmail.layer.insertSublayer(applyGradientDynamic(frame: CGRect(x: 0, y: 0, width: btnLoginWithEmail.frame.size.width, height: btnLoginWithEmail.frame.size.height), color1: UIColor(red:0.23, green:0.35, blue:0.6, alpha:1).cgColor, color2: UIColor(red:0.18, green:0.48, blue:1, alpha:1).cgColor, start_point: CGPoint(x: 0.01, y: 0), end_point: CGPoint(x: 1, y: 0), cornerRadius: 7, name: (btnLoginWithEmail.titleLabel?.text)!), at: 0)
            btnLoginWithEmail.setTitleColor(.white, for: .normal)
            btnLoginPhoneNum.setTitleColor(UIColor(red:0.50, green:0.50, blue:0.50, alpha:1.0), for: .normal)
            btnLoginFacebook.setTitleColor(UIColor(red:0.50, green:0.50, blue:0.50, alpha:1.0), for: .normal)
        }
    }
    //View Setup
    func viewSetup() {
      if DEVICE_TYPE == iPhone5s {
            stackView.spacing = 10
            viewBottomHeight.constant = 210
            lblTermsTextTop.constant = 5
        dummyView.isHidden = true
        } else if DEVICE_TYPE == iPhoneX {
            lblTermsTextTop.constant = 60
            viewBottomHeight.constant = 330
        }
    }
    
    func textRangechanges() {
        let stringValue = "By 'Login', you agree to our Terms and Services & Privacy Policy"
        
        let attributedString: NSMutableAttributedString = NSMutableAttributedString(string: stringValue)
        attributedString.setColorForText(textForAttribute: "By 'Login', you agree to our", withColor: UIColor.gray)
        attributedString.setColorForText(textForAttribute: " Terms and Services & Privacy Policy", withColor: UIColor(red:0.29, green:0.29, blue:0.29, alpha:1.0))
        lblTermsText.attributedText = attributedString
        lblTermsText.setLineSpacing(lineSpacing: 1.5, lineHeightMultiple: 2.0)
        lblTermsText.textAlignment = .center
        
        //Privacy details alingment
        lblPrivacyDetails.setLineSpacing(lineSpacing: 1.5, lineHeightMultiple: 2.0)
        lblPrivacyDetails.textAlignment = .center
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
    @IBAction func didTapUpArrowAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
