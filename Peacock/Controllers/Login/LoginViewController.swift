//
//  LoginViewController.swift
//  Peacock
//
//  Created by Mathivathani Murugesan on 31/08/18.
//  Copyright © 2018 Mathivathani Murugesan. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var viewLoginFacebook: UIView!
    @IBOutlet weak var viewLoginWithEmail: UIView!
    @IBOutlet weak var viewLoginPhoneNum: UIView!
    
    @IBOutlet weak var btnLoginFacebook: UIButton!
    @IBOutlet weak var btnLoginPhoneNum: UIButton!
    @IBOutlet weak var btnLoginWithEmail: UIButton!
    
    @IBOutlet weak var lblTermsText: UILabel!
    @IBOutlet weak var pagingCollectionView: UICollectionView!
    @IBOutlet weak var pagingDots: UIPageControl!
    @IBOutlet weak var btnFacebookDetails: UIButton!
    
    //Alignment for all device constraints
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var stackViewTop: NSLayoutConstraint!
    @IBOutlet weak var viewPagingHeight: NSLayoutConstraint!
    @IBOutlet weak var viewBottomHeight: NSLayoutConstraint!
    @IBOutlet weak var viewBottomTop: NSLayoutConstraint!
    @IBOutlet weak var lblTermsTextTop: NSLayoutConstraint!
    
    @IBOutlet weak var dummyView: UIView!
    @IBOutlet weak var dummyViewTop: NSLayoutConstraint!
    @IBOutlet weak var lblFacebookDetails: UILabel!
    @IBOutlet weak var btnDownArrowWidth: NSLayoutConstraint!
    
    //Global Values
    let arrContent = ["Instantly match with people that you've seen in real-life", "Show interest in them in real-time or save them to your favorites" , "You can only message people that have showed interest back" , "Set out your beacon to see other singles near you. You can't connect until you've seen them in real-life"]
    let arrImageCenter = ["01","02","03","04"]
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPageControl()
        //Add for animation swipe up
        let swipeUP = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeUP.direction = UISwipeGestureRecognizerDirection.up
        self.view.addGestureRecognizer(swipeUP)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewSetup()
        setShadowToView(myView: viewLoginFacebook)
        setShadowToView(myView: viewLoginWithEmail)
        setShadowToView(myView: viewLoginPhoneNum)
        textRangechanges()
        
        //Set up the collectionview layout
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        layout.itemSize = CGSize(width: self.view.frame.size.width, height: pagingCollectionView.frame.size.height)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.sectionHeadersPinToVisibleBounds = true
        layout.scrollDirection = .horizontal
        pagingCollectionView.collectionViewLayout = layout
        pagingCollectionView.isPagingEnabled = true
    }
    
    //Response to gesture
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
            performSegue(withIdentifier: "details_view", sender: nil)
    }
    
    //View Setup
    func viewSetup() {
        if DEVICE_TYPE == iPhone6 {
            stackView.spacing = 10
            stackViewTop.constant = 5
        } else if DEVICE_TYPE == iPhone5s {
            stackView.spacing = 10
            stackViewTop.constant = 0
            dummyViewTop.constant = 0
            viewPagingHeight.constant = 250
            viewBottomHeight.constant = 50
            viewBottomTop.constant = 0
            dummyView.isHidden = true
            lblFacebookDetails.font = UIFont(name: MYFONTS.BOOK, size: 13)
        } else if DEVICE_TYPE == iPhoneX {
            viewBottomTop.constant = 40
            lblTermsTextTop.constant = 30
        } else if DEVICE_TYPE == iPad {
            viewPagingHeight.constant = 400
            viewBottomHeight.constant = 100
            viewBottomTop.constant = 30
           lblFacebookDetails.font = UIFont(name: MYFONTS.BOOK, size: 22)
        }
        
    }
//Setup the paging view dots
    func setupPageControl() {
        pagingDots.numberOfPages = arrContent.count
        let appearance = UIPageControl.appearance()
        appearance.backgroundColor = UIColor.white
        appearance.pageIndicatorTintColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        appearance.currentPageIndicatorTintColor = MYCOLOR.BASE_RED
        appearance.backgroundColor = UIColor.clear
    }
    
    //Set up the login view gradient
    func buttonSetup(sender_tag: Int) {
        if sender_tag == 1 {
            //Button login with facebook action
            btnLoginFacebook.layer.insertSublayer(applyGradientBlueNBlack(frame: CGRect(x: 0, y: 0, width: btnLoginFacebook.frame.size.width, height: btnLoginFacebook.frame.size.height)), at: 0)
            
            btnLoginFacebook.setTitleColor(.white, for: .normal)
            btnLoginPhoneNum.setTitleColor(UIColor(red:0.50, green:0.50, blue:0.50, alpha:1.0), for: .normal)
            btnLoginWithEmail.setTitleColor(UIColor(red:0.50, green:0.50, blue:0.50, alpha:1.0), for: .normal)
        } else if sender_tag == 2 {
            //Btn Login with phone number
            btnLoginPhoneNum.layer.insertSublayer(applyGradientBlueNBlack(frame: CGRect(x: 0, y: 0, width: btnLoginPhoneNum.frame.size.width, height: btnLoginPhoneNum.frame.size.height)), at: 0)
            
            btnLoginPhoneNum.setTitleColor(.white, for: .normal)
            btnLoginFacebook.setTitleColor(UIColor(red:0.50, green:0.50, blue:0.50, alpha:1.0), for: .normal)
            btnLoginWithEmail.setTitleColor(UIColor(red:0.50, green:0.50, blue:0.50, alpha:1.0), for: .normal)
            
        } else if sender_tag == 3 {
            //Login with Email
            btnLoginWithEmail.layer.insertSublayer(applyGradientBlueNBlack(frame: CGRect(x: 0, y: 0, width: btnLoginWithEmail.frame.size.width, height: btnLoginWithEmail.frame.size.height)), at: 0)
            
            btnLoginWithEmail.setTitleColor(.white, for: .normal)
            btnLoginPhoneNum.setTitleColor(UIColor(red:0.50, green:0.50, blue:0.50, alpha:1.0), for: .normal)
            btnLoginFacebook.setTitleColor(UIColor(red:0.50, green:0.50, blue:0.50, alpha:1.0), for: .normal)
        }
    }
    
    func textRangechanges() {
        let stringValue = "By 'Login', you agree to our Terms and Services & Privacy Policy"
        
        let attributedString: NSMutableAttributedString = NSMutableAttributedString(string: stringValue)
        attributedString.setColorForText(textForAttribute: "By 'Login', you agree to our", withColor: UIColor.gray)
        attributedString.setColorForText(textForAttribute: " Terms and Services & Privacy Policy", withColor: UIColor(red:0.29, green:0.29, blue:0.29, alpha:1.0))
        lblTermsText.attributedText = attributedString
        if DEVICE_TYPE == iPhone5s {
            lblTermsText.font = UIFont(name: MYFONTS.BOOK, size: 14)
        }
        lblTermsText.setLineSpacing(lineSpacing: 1.5, lineHeightMultiple: 2.0)
        lblTermsText.textAlignment = .center
    }
    
    //MARK: Button action
    @IBAction func didTapBtnLoginFacebookAction(_ sender: UIButton) {
        buttonSetup(sender_tag: sender.tag)
    }
    @IBAction func didTapBtnLoginPhoneNumAction(_ sender: UIButton) {
         buttonSetup(sender_tag: sender.tag)
    }
    @IBAction func didTapBtnLoginWithEmailAction(_ sender: UIButton) {
         buttonSetup(sender_tag: sender.tag)
    }
    @IBAction func didTapFacebookDetailsAction(_ sender: Any) {
        performSegue(withIdentifier: "details_view", sender: nil)
    }
    //MARK: Collectionview Delegate
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrContent.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collCell = collectionView.dequeueReusableCell(withReuseIdentifier: "paging_cell", for: indexPath) as! PagingCollectionViewCell
        collCell.img.image = UIImage(named: arrImageCenter[indexPath.row])
        collCell.lblContent.text = arrContent[indexPath.row]
        collCell.lblContent.setLineSpacing(lineSpacing: 1.5, lineHeightMultiple: 1.5)
        collCell.lblContent.textAlignment = .center
        if DEVICE_TYPE == iPhone5s {
            collCell.imgHeight.constant = 110
            collCell.imgWidth.constant = 110
            collCell.imgTop.constant = 65
            collCell.lblContent.font = UIFont(name: MYFONTS.BOOK, size: 17)
        } else if DEVICE_TYPE == iPad {
            collCell.imgHeight.constant = 200
            collCell.imgWidth.constant = 200
            collCell.imgTop.constant = 50
            collCell.lblContent.font = UIFont(name: MYFONTS.BOOK, size: 25)
        }
        return collCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: pagingCollectionView.frame.size.width, height: pagingCollectionView.frame.size.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        pagingDots?.currentPage = Int(scrollView.contentOffset.x) / Int(self.view.frame.width)
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        
        pagingDots?.currentPage = Int(scrollView.contentOffset.x) / Int(self.view.frame.width)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

