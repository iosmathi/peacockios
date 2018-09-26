//
//  FinishBeaconVC.swift
//  Peacock
//
//  Created by NRV Prasad on 25/09/18.
//  Copyright © 2018 Mathivathani Murugesan. All rights reserved.
//

import UIKit

class FinishBeaconVC: BaseViewController {

    @IBOutlet weak var vwTxt: UIView!
    @IBOutlet weak var btnYes: UIButton!
    @IBOutlet weak var btnNo: UIButton!
    @IBOutlet weak var txtView: UITextView!
    @IBOutlet weak var btnFinish: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        // Bottom View Gradient
        btnFinish.layer.insertSublayer(applyGradientDynamic(frame: CGRect(x: 0, y: 0, width: btnFinish.frame.size.width, height: btnFinish.frame.size.height), color1: UIColor(red:0.23, green:0.35, blue:0.6, alpha:1).cgColor, color2: UIColor(red:0.18, green:0.48, blue:1, alpha:1).cgColor, start_point: CGPoint(x: 0.01, y: 0), end_point: CGPoint(x: 1, y: 0), cornerRadius: 8, name: "btnFinish"), at: 0)
        btnFinish.setTitleColor(.white, for: .normal)
        InitialSetup()
    }
    func InitialSetup() {
        setShadowToView(myView: btnYes, CornerRadius: true)
        setShadowToView(myView: btnNo, CornerRadius: true)
        setShadowToView(myView: vwTxt, CornerRadius: false)
        btnYes.backgroundColor = UIColor(red:0.24, green:0.42, blue:1.00, alpha:1.0)
        btnNo.backgroundColor = UIColor(red:0.24, green:0.42, blue:1.00, alpha:1.0)
        if DEVICE_TYPE == iPhone6 {
            
        } else if DEVICE_TYPE == iPhone5s {
            
        } else if DEVICE_TYPE == iPhoneX {
            
        } else if DEVICE_TYPE == iPad {
            
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
