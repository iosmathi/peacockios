//
//  ExtensionViewController.swift
//  Purchase Requisition
//
//  Created by Mathivathani Murugesan on 04/04/17.
//  Copyright © 2017 Torus. All rights reserved.
//
extension String
{
    func height(constraintedWidth width: CGFloat, font: UIFont) -> CGFloat
    {
        let label =  UILabel(frame: CGRect(x: 0, y: 0, width: width, height: .greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.text = self
        label.sizeToFit()
        
        return label.frame.height
    }
}
import UIKit

class ExtensionViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

extension UILabel {
    
    func setLineSpacing(lineSpacing: CGFloat = 0.0, lineHeightMultiple: CGFloat = 0.0) {
        
        guard let labelText = self.text else { return }
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.lineHeightMultiple = lineHeightMultiple
        
        let attributedString:NSMutableAttributedString
        if let labelattributedText = self.attributedText {
            attributedString = NSMutableAttributedString(attributedString: labelattributedText)
        } else {
            attributedString = NSMutableAttributedString(string: labelText)
        }
        
        // (Swift 4.1 and 4.0) Line spacing attribute
        attributedString.addAttribute(NSAttributedStringKey.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
        
        self.attributedText = attributedString
    }
}
//Text color change
extension NSMutableAttributedString {
    
    func setColorForText(textForAttribute: String, withColor color: UIColor) {
        let range: NSRange = self.mutableString.range(of: textForAttribute, options: .caseInsensitive)
        
        // Swift 4.2 and above
        //        self.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
        
        // Swift 4.1 and below
        self.addAttribute(NSAttributedStringKey.foregroundColor, value: color, range: range)
    }
}
//MARK: Hexa Color
extension UIColor
{
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}




//MARK: Activity Controller view
//extension UIView {
let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
let blurEffectView = UIVisualEffectView(effect: blurEffect)
var loadingIndicator = UIActivityIndicatorView()

// Validate the string empty spaces
func EmptySpaceValidation(givenString: String)-> Bool
{
    let strTrimmed = givenString.replacingOccurrences(of: " ", with: "")
    if strTrimmed.count != 0
    {
        return true
    }
    return false
}

func EmptySpaceValidationForAnyObject(givenString: Any)-> Bool
{
    let strTrimmed = (givenString as AnyObject).replacingOccurrences(of: " ", with: "")
    if strTrimmed.count != 0
    {
        return true
    }
    return false
}

//Extension for textfield text insert space
public extension UITextField {
    @IBInspectable public var leftSpacer:CGFloat {
        get {
            if let l = leftView {
                return l.frame.size.width
            } else {
                return 0
            }
        } set {
            leftViewMode = .always
            leftView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: frame.size.height))
        }
    }
}

extension String {
    
    var containsValidCharacter: Bool {
        let characterSet = CharacterSet(charactersIn: "-/:;'()!@#$%^&*<>?,.[]{}+`~abcdefghijklmnopqrstuvwxzyABCDEFGHJIKLMNOPQRSTUVWXYZ")
        let range = (self as NSString).rangeOfCharacter(from: characterSet)
        return range.location != NSNotFound
    }
}


//
//                        let fontFamilyNames = UIFont.familyNames
//                        for familyName in fontFamilyNames {
//                            print("------------------------------")
//                            print("Font Family Name = [\(familyName)]")
//                            let names = UIFont.fontNames(forFamilyName: familyName)
//                            print("Font Names = [\(names)]")
//                        }

//}
