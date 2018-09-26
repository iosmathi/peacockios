//
//  InviteContactsVC.swift
//  Peacock
//
//  Created by NRV Prasad on 25/09/18.
//  Copyright © 2018 Mathivathani Murugesan. All rights reserved.
//

import UIKit

class InviteContactsVC: BaseViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var btnFinish: UIButton!
    @IBOutlet weak var txtView: UITextView!
    @IBOutlet weak var btnNo: UIButton!
    @IBOutlet weak var btnYes: UIButton!
    @IBOutlet weak var btnDone: UIButton!
    @IBOutlet weak var tblContactsList: UITableView!
    var marContactList = NSMutableArray()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //UITableView structure
    func numberOfSections(in tableView: UITableView) -> Int {
        var numOfSections = 1
        //        if marContactList.count > 0 {
        //            tableView.separatorStyle = .singleLine
        //            numOfSections            = 1
        //            tableView.backgroundView = nil
        //            tableView.frame.origin.x = 0
        //            tableView.frame.size.width = self.view.frame.size.width
        //        }
        //        else
        //        {
        //            let noDataLabel: UILabel     = UILabel(frame: CGRect(x: 10, y: 0, width: tableView.frame.size.width - 20, height: tableView.bounds.size.height))
        //            noDataLabel.text          = "No data available! Check again later."
        //            noDataLabel.font = UIFont(name: MYFONTS.BOLD, size: 16)
        //            noDataLabel.numberOfLines = 0
        //            noDataLabel.textColor     = UIColor.gray
        //            noDataLabel.textAlignment = .center
        //            tableView.backgroundView  = noDataLabel
        //            tableView.frame.origin.x = 20
        //            tableView.frame.size.width = self.view.frame.size.width - 40
        //            tableView.separatorStyle  = .none
        //        }
        return numOfSections
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tblCell = tableView.dequeueReusableCell(withIdentifier: "Invitees") as! BeaconTableViewCell
        if marContactList.count > 0{
            
        }else{
            
        }
        tblCell.btnCheck.tag = indexPath.row
        tblCell.lblName.text = "Dear Sahffi!Greetings from Automation Anywhere - Imagine Bengaluru 2018!Your Verification code is: 6545 For any queries, send us a mail at:  imagine-team@automationanywhere.com"
        return tblCell
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    @IBAction func didTapBackAction(_ sender: Any) {
    }
    @IBAction func didTapDoneAction(_ sender: Any) {
        performSegue(withIdentifier: "Finish_Contacts", sender: nil)
    }
    @IBAction func didTapSelectContact(_ sender: UIButton){
        
    }
    
}
