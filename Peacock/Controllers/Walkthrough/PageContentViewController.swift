//
//  PageContentViewController.swift
//  Purchase Requisition
//
//  Created by Mathivathani Murugesan on 30/05/17.
//  Copyright © 2017 Torus. All rights reserved.
//

import UIKit

class PageContentViewController: BaseViewController {

    @IBOutlet weak var imgCenter: UIImageView!
    @IBOutlet weak var lblContent: UILabel!
    @IBOutlet weak var imgBackground: UIImageView!
    //Constraint
    @IBOutlet weak var imgTop: NSLayoutConstraint!
    @IBOutlet weak var lblContentTop: NSLayoutConstraint!
    @IBOutlet weak var imgWidth: NSLayoutConstraint!
    @IBOutlet weak var imgHeight: NSLayoutConstraint!
    
    var pageIndex: Int = 0
    var strContent: String = String()
    var strImageCenter : String = String()
    var strImageBg: String = String()
    var strBtnName : String = String()
    var strColor : UIColor = UIColor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblContent.text = strContent
        lblContent.setLineSpacing(lineSpacing: 1.5, lineHeightMultiple: 1.5)
        lblContent.textAlignment = .center
        imgCenter.image = UIImage(named: strImageCenter)
        imgBackground.image = UIImage(named: strImageBg)
    
        //FOR Device
        if DEVICE_TYPE == iPhone5s {
            imgTop.constant = 80
            lblContentTop.constant = 40
            imgWidth.constant = 150
            imgHeight.constant = 150
        } else if DEVICE_TYPE == iPhoneX || DEVICE_TYPE == iPhone6Pluse {
            imgTop.constant = 150
            lblContentTop.constant = 100
            imgWidth.constant = 200
            imgHeight.constant = 200
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
