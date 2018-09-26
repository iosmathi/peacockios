//
//  LoginPhoneNumberViewController.swift
//  Peacock
//
//  Created by Mathivathani Murugesan on 06/09/18.
//  Copyright © 2018 Mathivathani Murugesan. All rights reserved.
//

import UIKit

class LoginPhoneNumberViewController: BaseViewController {

    @IBOutlet weak var lblDetails: UILabel!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var viewNext: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addNavButtonWithText(leftButtonText: "Back", title: "Login to Peacock")
     
    }
    override func viewWillAppear(_ animated: Bool) {
        //Apply gradient and uiview shadow
        setShadowToView(myView: viewNext)
        btnNext.layer.insertSublayer(applyGradientBlueNPurple(frame: CGRect(x: btnNext.frame.origin.x, y: btnNext.frame.origin.y, width: viewNext.frame.size.width, height: viewNext.frame.size.height)), at: 0)
        
        lblDetails.setLineSpacing(lineSpacing: 1.0, lineHeightMultiple: 1.0)
        lblDetails.textAlignment = .center
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
