//
//  MyProfileVisibleVC.swift
//  Peacock
//
//  Created by NRV Prasad on 24/09/18.
//  Copyright © 2018 Mathivathani Murugesan. All rights reserved.
//

import UIKit

class MyProfileVisibleVC: BaseViewController {

    @IBOutlet weak var vwNavigationHeight: NSLayoutConstraint!
    @IBOutlet weak var lblVisibleStatus: UILabel!
    @IBOutlet weak var btnPublic: UIButton!
    @IBOutlet weak var lblVisible: UILabel!
    @IBOutlet weak var lblMore: UILabel!
    @IBOutlet weak var img3: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var lblPrecaution: UILabel!
    @IBOutlet weak var btnVisible: UIButton!
    @IBOutlet weak var vwProtection: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        lblPrecaution.text = "Just want to notify a few special peopls? \nChoose visible nonly to and select the people you want to shiw your Beacon to."
        lblVisibleStatus.text = "Want anybody in your perimeter to fine you? \nKeep your Beacon as pubilc."
        
        lblPrecaution.setLineSpacing(lineSpacing: 1.5, lineHeightMultiple: 1.5)
        lblVisibleStatus.setLineSpacing(lineSpacing: 1.5, lineHeightMultiple: 1.5)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func viewDidAppear(_ animated: Bool) {
        InitialSetup()
    }
    func InitialSetup() {
        setShadowToView(myView: vwProtection, CornerRadius: true)
        setShadowToView(myView: btnVisible, CornerRadius: true)
        btnVisible.backgroundColor = UIColor(red:0.24, green:0.42, blue:1.00, alpha:1.0)
        if DEVICE_TYPE == iPhone6 {
            vwNavigationHeight.constant = 50
        } else if DEVICE_TYPE == iPhone5s {
            lblPrecaution.font = UIFont(name: MYFONTS.BOOK, size: 16)
            lblVisibleStatus.font = UIFont(name: MYFONTS.BOOK, size: 16)
            vwNavigationHeight.constant = 40
        } else if DEVICE_TYPE == iPhoneX {
           
        } else if DEVICE_TYPE == iPad {
           
        }
    }
    @IBAction func didTapVisibleAction(_ sender: Any){
    }
    @IBAction func didTapNextAction(_ sender: Any) {
        performSegue(withIdentifier: "Beacon_Visible", sender: nil)
 
    }
    @IBAction func didTapPublicAction(_ sender: Any) {
    }
    @IBAction func didTapBackAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
