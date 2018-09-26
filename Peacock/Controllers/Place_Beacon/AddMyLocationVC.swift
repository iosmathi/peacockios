//
//  AddMyLocationVC.swift
//  Peacock
//
//  Created by NRV Prasad on 24/09/18.
//  Copyright © 2018 Mathivathani Murugesan. All rights reserved.
//

import UIKit

class AddMyLocationVC: BaseViewController {

    @IBOutlet weak var btnNo: UIButton!
    @IBOutlet weak var btnYes: UIButton!
    @IBOutlet weak var vwTimer: UIView!
    @IBOutlet weak var vwLocation: UIView!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var lblWhere: UILabel!
    @IBOutlet weak var lblTimings: UILabel!
    
    
    // Height Constance
    @IBOutlet weak var vwNavigationHight: NSLayoutConstraint!
    
    @IBOutlet weak var lblMaxTime: UILabel!
    @IBOutlet weak var vwTimingsHeight: NSLayoutConstraint!
    @IBOutlet weak var btnYesTop: NSLayoutConstraint!
    @IBOutlet weak var vwQuestionTop: NSLayoutConstraint!
    @IBOutlet weak var vwTimingsTop: NSLayoutConstraint!
    @IBOutlet weak var vwWhereTop: NSLayoutConstraint!
    @IBOutlet weak var lblYesorNoQuestion: UILabel!
    @IBOutlet weak var lblQuestionTop: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblYesorNoQuestion.setLineSpacing(lineSpacing: 1.5, lineHeightMultiple: 1.5)
    }
    override func viewWillAppear(_ animated: Bool) {
        
    }
    override func viewDidAppear(_ animated: Bool) {
        InitialSetup()
    }
    func InitialSetup() {
        
        setShadowToView(myView: vwTimer, CornerRadius: true)
        setShadowToView(myView: vwLocation, CornerRadius: true)
        setShadowToView(myView: btnYes, CornerRadius: true)
        setShadowToView(myView: btnNo, CornerRadius: true)
        if DEVICE_TYPE == iPhone6 {
            vwWhereTop.constant = 15
            print("6s")
        } else if DEVICE_TYPE == iPhone5s {
            vwWhereTop.constant = 0
            vwTimingsTop.constant = 0
            vwQuestionTop.constant = 5
            btnYesTop.constant = 10
            lblQuestionTop.constant = 0
            vwTimingsHeight.constant = 120
            lblYesorNoQuestion.font = UIFont(name: MYFONTS.BOOK, size: 16)
            lblWhere.font = UIFont(name: MYFONTS.BOLD, size: 16)
            lblLocation.font = UIFont(name: MYFONTS.BOOK, size: 16)
            lblMaxTime.font = UIFont(name: MYFONTS.BOOK, size: 16)
            lblTimings.font = UIFont(name: MYFONTS.BOOK, size: 16)
        } else if DEVICE_TYPE == iPhoneX {
            
        } else if DEVICE_TYPE == iPad {
            
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func didTapBackAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func didTapNextAction(_ sender: Any) {
        self.performSegue(withIdentifier: "Security_Information", sender: nil)
    }
    
}
