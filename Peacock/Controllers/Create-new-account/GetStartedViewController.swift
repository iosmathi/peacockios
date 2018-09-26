//
//  GetStartedViewController.swift
//  Peacock
//
//  Created by Mathivathani Murugesan on 25/09/18.
//  Copyright © 2018 Mathivathani Murugesan. All rights reserved.
//

import UIKit

class GetStartedViewController: BaseViewController {

    
    @IBOutlet weak var viewGetStarted: UIView!
    @IBOutlet weak var viewLoginFB: UIView!
    @IBOutlet weak var btnGetStarted: UIButton!
    @IBOutlet weak var btnLoginFB: UIButton!
    @IBOutlet weak var lblLetsCreate: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
    }
    override func viewDidAppear(_ animated: Bool) {
        initialSetup()
    }
    
    func initialSetup() {
        setShadowToView(myView: viewLoginFB)
        setShadowToView(myView: viewGetStarted)
        if DEVICE_TYPE == iPhone5s {
            lblLetsCreate.font = UIFont(name: MYFONTS.BOOK, size: 35)
        }
        lblLetsCreate.setLineSpacing(lineSpacing: 1.5, lineHeightMultiple: 1.5)
        lblLetsCreate.textAlignment = .left
        lblLetsCreate.text = "Let create your new account"
       
        //Apply the gradient to button
         btnLoginFB.layer.insertSublayer(applyGradientBlueNBlack(frame: CGRect(x: 0, y: 0, width: viewLoginFB.frame.size.width, height: viewLoginFB.frame.size.height)), at: 0)
        
          btnGetStarted.layer.insertSublayer(applyGradientBlueNPurple(frame: CGRect(x: btnGetStarted.frame.origin.x, y: btnGetStarted.frame.origin.y, width: viewGetStarted.frame.size.width, height: viewGetStarted.frame.size.height)), at: 0)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
