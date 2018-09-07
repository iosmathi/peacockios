//
//  GetPromoCodeViewController.swift
//  Peacock
//
//  Created by Mathivathani Murugesan on 06/09/18.
//  Copyright © 2018 Mathivathani Murugesan. All rights reserved.
//

import UIKit

class GetPromoCodeViewController: BaseViewController {

    @IBOutlet weak var txtPromo: UITextField!
    @IBOutlet weak var lblPromoCodeDetails: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    override func viewWillAppear(_ animated: Bool) {
        lblPromoCodeDetails.setLineSpacing(lineSpacing: 2.0, lineHeightMultiple: 2.0)
        lblPromoCodeDetails.textAlignment = .center
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
