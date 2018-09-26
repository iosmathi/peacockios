//
//  Place_BeaconVC.swift
//  Peacock
//
//  Created by NRV Prasad on 24/09/18.
//  Copyright © 2018 Mathivathani Murugesan. All rights reserved.
//

import UIKit

class Place_BeaconVC: BaseViewController {

    @IBOutlet weak var btnLocation: UIButton!
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var btnFilter: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        //For Different Kind Of Devices Setup
        InitialSetup()
    }
    func InitialSetup() {
        setShadowToView(myView: btnLocation, CornerRadius: false)
        setShadowToView(myView: btnAdd, CornerRadius: false)
        btnAdd.backgroundColor = UIColor(red:0.24, green:0.42, blue:1.00, alpha:1.0)
        setShadowToView(myView: btnFilter, CornerRadius: false)
        // Buuton corner radius for ipad
        if DEVICE_TYPE == iPad{
            btnAdd.layer.cornerRadius = 37.5
            btnLocation.layer.cornerRadius = 30.0
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    //Add location
    @IBAction func didTapAddYourLocation(_ sender: Any) {
        performSegue(withIdentifier: "Add_your_Place", sender: nil)
    }
}
