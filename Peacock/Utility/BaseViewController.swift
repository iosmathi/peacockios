//
//  BaseViewController.swift
//  Imagine
//
//  Created by Mathivathani Murugesan on 27/11/17.
//  Copyright © 2017 Mathivathani Murugesan. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    //MARK: View lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        getDeviceType()

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK: Setup the NavigationBar for all viewcontroller clear color
    func setupNavBar() {
        self.navigationController?.navigationBar.barTintColor = .clear
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        self.edgesForExtendedLayout = UIRectEdge.top
        getDeviceType()
    }
    
    func callRootViewcontroller() {
//        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
//        UIApplication.shared.keyWindow?.rootViewController = viewController
    }
    
    func applyGradient(frame: CGRect) ->  CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = frame //CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.lblRemoveAdsHeight.constant)
        let color1 = UIColor.clear.cgColor as CGColor
        let color2 = UIColor.clear.cgColor as CGColor
        let color4 = UIColor(red:0.00, green:0.00, blue:0.00, alpha:0.90).cgColor as CGColor
        let color3 = UIColor(red:0.00, green:0.00, blue:0.00, alpha:0.90).cgColor as CGColor
        gradientLayer.colors = [color1,color2, color3, color4]
        gradientLayer.startPoint = CGPoint(x: 1.00, y: 0.00)
        gradientLayer.endPoint = CGPoint(x: 1.00, y: 1.00)
        gradientLayer.locations = [0.0, 0.25, 0.75, 1.0]
        return gradientLayer
    }
    
    func applyGradientDynamic(frame: CGRect, color1 : CGColor, color2 :CGColor, start_point: CGPoint, end_point: CGPoint, cornerRadius: CGFloat, name: String) ->  CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = frame
        gradientLayer.colors = [color1,color2]//, color3, color4]
        gradientLayer.name = name
        gradientLayer.startPoint = start_point//CGPoint(x: 1.00, y: 0.00)
        gradientLayer.endPoint = end_point //CGPoint(x: 1.00, y: 1.00)
        gradientLayer.locations = [0.0,0.90,0.95,1.0]// [0.0, 0.25, 0.75, 1.0]
        gradientLayer.cornerRadius = cornerRadius
        return gradientLayer
    }
    //MARK: Shadow to view
    func setShadowToView(myView: UIView, CornerRadius : Bool) {
        var shadowPath: UIBezierPath = UIBezierPath()
        shadowPath = UIBezierPath(roundedRect: myView.layer.bounds, cornerRadius: myView.layer.cornerRadius)
        //UIBezierPath(rect: CGRect(x: -shadowSize / 2,y: 0,width:viewBothWidth.constant ,height: myView.frame.size.height + shadowSize ))
        myView.layer.masksToBounds = false
        myView.layer.borderColor =  UIColor(red:0.67, green:0.67, blue:0.67, alpha:0.40).cgColor
        myView.layer.borderWidth = 1
        if CornerRadius == true{
            myView.layer.cornerRadius = 7
        }
        myView.layer.shadowColor = UIColor(red:0, green:0, blue:0, alpha:0.12).cgColor
        myView.layer.shadowOffset =  CGSize(width: 0, height: 3)
        myView.layer.shadowOpacity = 0.90
        myView.layer.shadowPath = shadowPath.cgPath
        if CornerRadius == true{
            myView.layer.shadowRadius = 10
        }
        myView.backgroundColor = .white
    }
    //MARK: Navigation Button add
    //Back Button Style Navigation
    func addNavButtonWithImage(leftButtonImage: UIImage, titleName: String, rightButtonName1: UIImage,rightButtonName2: UIImage){
        if leftButtonImage != UIImage() {
            //Left Button image
            let leftButtonItem: UIButton = UIButton()
            leftButtonItem.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
            leftButtonItem.setImage(leftButtonImage, for: .normal)
            leftButtonItem.imageView?.contentMode = .scaleAspectFit
            leftButtonItem.addTarget(self, action: #selector(didSelectLeftButton), for: .touchUpInside)
            // Assign the Custom Button to Navigation Left UIBarButton
            let leftButton = UIBarButtonItem(customView: leftButtonItem)
            navigationItem.setLeftBarButton(leftButton, animated: true)
        }
        //Set the Right custom button
        let rightButton1: UIButton = UIButton()
        rightButton1.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        rightButton1.setImage(rightButtonName1, for: .normal)
        rightButton1.imageView?.contentMode = .scaleAspectFit
        rightButton1.addTarget(self, action: #selector(didSelectFirstButton), for: .touchUpInside)
        // Assign the Custom Button to Navigation Right UIBarButton
        let rightNavButton1 = UIBarButtonItem(customView: rightButton1)
        //Set the Right custom button
        let rightButton2: UIButton = UIButton()
        rightButton2.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        rightButton2.setImage(rightButtonName2, for: .normal)
        rightButton2.imageView?.contentMode = .scaleAspectFit
        rightButton2.addTarget(self, action: #selector(didSelectSecondButton), for: .touchUpInside)
        // Assign the Custom Button to Navigation Right UIBarButton
        let rightNavButton2 = UIBarButtonItem(customView: rightButton2)
        if rightButtonName1 == UIImage() && rightButtonName2 != UIImage() {
            navigationItem.setRightBarButton(rightNavButton2, animated: true)
        }
        else if rightButtonName1 != UIImage() && rightButtonName2 == UIImage() {
            navigationItem.setRightBarButton(rightNavButton1, animated: true)
        }
        else if rightButtonName1 != UIImage()  && rightButtonName2 != UIImage() {
            navigationItem.setRightBarButtonItems([rightNavButton1, rightNavButton2], animated: true)
        }
        navigationItem.title = titleName
        navigationItem.titleView?.tintColor = .white
    }
    
    //BackButton with text
    func addNavButtonWithText(leftButtonText: String, title: String){
        if leftButtonText != "" {
            //Left Button image
            let leftButtonItem: UIButton = UIButton()
            leftButtonItem.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
            leftButtonItem.setTitle(leftButtonText, for: .normal)
            leftButtonItem.titleLabel?.font = UIFont(name: MYFONTS.BOOK, size: 17)
            leftButtonItem.setTitleColor(UIColor(red:0.24, green:0.49, blue:1, alpha:1), for: .normal)
            leftButtonItem.addTarget(self, action: #selector(didSelectLeftButton), for: .touchUpInside)
            // Assign the Custom Button to Navigation Left UIBarButton
            let leftButton = UIBarButtonItem(customView: leftButtonItem)
            navigationItem.setLeftBarButton(leftButton, animated: true)
            navigationItem.title = title
            if DEVICE_TYPE == iPhone5s {
                navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.darkGray, NSAttributedStringKey.font: UIFont(name: MYFONTS.BOOK, size: 19) as Any]
            } else {
                navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.darkGray, NSAttributedStringKey.font: UIFont(name: MYFONTS.BOOK, size: 22) as Any]
            }
        }
    }
    //Code for Image with text for label
    func ImageWithLablTextLast(labelText : String , lblImage : UIImage)-> NSAttributedString {
        let attachment = NSTextAttachment()
        attachment.image = lblImage
        let attachmentString = NSAttributedString(attachment: attachment)
        let myString = NSMutableAttributedString(string: "\(labelText)  ")
        myString.append(attachmentString)
        return myString
    }

    //Overide function
    @objc func didSelectLeftButton(sender: UIButton) {
        
    }
    @objc func didSelectFirstButton(sender: UIButton) {
        
    }
    @objc func didSelectSecondButton(sender: UIButton) {
        
    }
    
    //Getting the device type
    func getDeviceType() {
        //tblview iphone 5s adjustment
        switch UIDevice.current.userInterfaceIdiom {
        case .phone:
            if UIDevice().userInterfaceIdiom == .phone{
                switch UIScreen.main.nativeBounds.height{
                case 1136:
                    DEVICE_TYPE = iPhone5s
                    break
                case 1334:
                    //print("iPhone 6/6S/7/8")
                    DEVICE_TYPE = iPhone6
                case 2208:
                    //print("iPhone 6+/6S+/7+/8+")
                    DEVICE_TYPE = iPhone6Pluse
                case 2436:
                    DEVICE_TYPE = iPhoneX
                 break
                default: break
                }
            }
        case .pad:
            DEVICE_TYPE = iPad
            break
        default: break
        }
    }
//Label Height
    func requiredHeight(labelText:String, witdh:CGFloat) -> CGFloat {
        let font = UIFont(name: MYFONTS.BOOK, size: 17.0)
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: witdh , height: .greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = font
        label.text = labelText
        label.sizeToFit()
        return label.frame.height
    }
    // Share your Content
    func ShareTheContent(title : String,  alertmessage : String) {
        let objectsToShare = [alertmessage]
        let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        activityVC.setValue(title, forKey: "Subject")
        self.present(activityVC, animated: true, completion: nil)
    }
    //MARK: Convert image GrayScale
    func convertImageToGray(image:UIImage) -> UIImage {
        let filter = CIFilter(name: "CIPhotoEffectMono")
        // convert UIImage to CIImage and set as input
        let ciInput = CIImage(image: image)
        filter?.setValue(ciInput, forKey: "inputImage")
        // get output CIImage, render as CGImage first to retain proper UIImage scale
        let ciOutput = filter?.outputImage
        let ciContext = CIContext()
        let cgImage = ciContext.createCGImage(ciOutput!, from: (ciOutput?.extent)!)
        return UIImage(cgImage: cgImage!)
    }
    
    func switchToViewController(identifier: String) {
        let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: identifier) as UIViewController
            self.present(viewController, animated: false, completion: nil)
    }
    
    func PeacockSWitchViewControllerWithAnotherStoryBoard(indentifier : String, StoryBoardName : String){
        let viewController:UIViewController = UIStoryboard(name: StoryBoardName, bundle: nil).instantiateViewController(withIdentifier: indentifier) as UIViewController
        self.present(viewController, animated: false, completion: nil)
    }
    
    
    func SearchYourdataUsingPredicate(predicte :NSPredicate,inputArray : NSArray) -> NSArray{
        var arrFiltered = NSArray()
        arrFiltered = inputArray.filtered(using: predicte) as NSArray
        return arrFiltered
    }
    
    func convertDateFormatter(date: String) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"//this your string date format
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        dateFormatter.locale = Locale(identifier: "your_loc_id")
        let convertedDate = dateFormatter.date(from: date)
        
        guard dateFormatter.date(from: date) != nil else {
            assert(false, "no date from string")
            return ""
        }
        
        dateFormatter.dateFormat = "yyyy MMM HH:mm EEEE"///this is what you want to convert format
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        let timeStamp = dateFormatter.string(from: convertedDate!)
        
        return timeStamp
    }
    
}
//Image with lable text first
func ImageWithLablTextFirst(labelText : String , lblImage : UIImage)-> NSAttributedString {
    //Create Attachment
    let imageAttachment =  NSTextAttachment()
    imageAttachment.image = lblImage
    //Set bound to reposition
    //        let imageOffsetY:CGFloat = -5.0;
    //        imageAttachment.bounds = CGRect(x: 0, y: imageOffsetY, width: imageAttachment.image!.size.width, height: imageAttachment.image!.size.height)
    //Create string with attachment
    let attachmentString = NSAttributedString(attachment: imageAttachment)
    //Initialize mutable string
    let completeText = NSMutableAttributedString(string: "")
    //Add image to mutable string
    completeText.append(attachmentString)
    //Add your text to mutable string
    let  textAfterIcon = NSMutableAttributedString(string: " \(labelText)")
    completeText.append(textAfterIcon)
    return completeText
}

