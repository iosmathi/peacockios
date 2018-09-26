//
//  BeaconContactsVC.swift
//  Peacock
//
//  Created by NRV Prasad on 25/09/18.
//  Copyright © 2018 Mathivathani Murugesan. All rights reserved.
//

import UIKit

class BeaconContactsVC: BaseViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var vwInvitee: UIView!
    @IBOutlet weak var tblContacts: UITableView!
    var marContactsList = NSMutableArray()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func viewDidAppear(_ animated: Bool) {
        // Bottom View Gradient
        vwInvitee.layer.insertSublayer(applyGradientDynamic(frame: CGRect(x: 0, y: 0, width: vwInvitee.frame.size.width, height: vwInvitee.frame.size.height), color1: UIColor(red:0.23, green:0.35, blue:0.6, alpha:1).cgColor, color2: UIColor(red:0.18, green:0.48, blue:1, alpha:1).cgColor, start_point: CGPoint(x: 0.01, y: 0), end_point: CGPoint(x: 1, y: 0), cornerRadius: 0, name: "vwInvitee"), at: 0)
    }
    //UITableView structure
    func numberOfSections(in tableView: UITableView) -> Int {
        var numOfSections = 1
//        if marContactsList.count > 0 {
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
        if marContactsList.count > 0{
            
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
    @IBAction func didTapSelectedRecordAction(_ sender: UIButton) {
        if marContactsList.count > 0{
            let dict = marContactsList.object(at: sender.tag) as! NSDictionary
            print(dict)
        }
    }
    @IBAction func didTapBackAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func didTapSelectedAction(_ sender: Any) {
    }
    @IBAction func didTapInviteesAction(_ sender: Any) {
        performSegue(withIdentifier: "Invite+_From_Local_Contacts", sender: nil)
    }
}
