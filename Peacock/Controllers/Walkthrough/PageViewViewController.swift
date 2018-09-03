//
//  PageViewViewController.swift
//  Purchase Requisition
//
//  Created by Mathivathani Murugesan on 30/05/17.
//  Copyright © 2017 Torus. All rights reserved.
//

import UIKit

class PageViewViewController: UIPageViewController, UIPageViewControllerDataSource {

    var arrContent: NSArray = NSArray()
    var arrImageCenter: NSArray = NSArray()
    var arrImageBg: NSArray = NSArray()
    var arrbtnTitle: NSArray = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let fontFamilyNames = UIFont.familyNames
        for familyName in fontFamilyNames {
            print("------------------------------")
            print("Font Family Name = [\(familyName)]")
            let names = UIFont.fontNames(forFamilyName: familyName)
            print("Font Names = [\(names)]")
        }
        
        arrContent = ["Instantly match with people that you've seen in real-life", "Show interest in them in real-time or save them to your favorites" , "You can only message people that have showed interest back" , "Set out your beacon to see other singles near you. You can't connect until you've seen them in real-life"]
        arrImageCenter = ["01","02","03","04"]
        arrbtnTitle = ["SKIP","SKIP","SKIP","LOGIN"]
        arrImageBg = ["w1","w2","w3","w4"]

        self.dataSource = self
        
        self.setViewControllers([getViewControllerAtIndex(0)] as [UIViewController], direction: UIPageViewControllerNavigationDirection.forward, animated: false, completion: nil)
        self.view.backgroundColor = .white
        setupPageControl()
    }
    
    // MARK:- UIPageViewControllerDataSource Methods
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?
    {
        let pageContent: PageContentViewController = viewController as! PageContentViewController
        
        var index = pageContent.pageIndex
        
        if ((index == 0) || (index == NSNotFound))
        {
            return nil
        }
        
        index -= 1;
        return getViewControllerAtIndex(index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?
    {
        let pageContent: PageContentViewController = viewController as! PageContentViewController
        
        var index = pageContent.pageIndex
        
        if (index == NSNotFound)
        {
            return nil;
        }
        
        index += 1;
        if (index == arrContent.count)
        {
            return nil;
        }
        return getViewControllerAtIndex(index)
    }
    
    // MARK:- Other Methods
    func getViewControllerAtIndex(_ index: NSInteger) -> PageContentViewController
    {
        // Create a new view controller and pass suitable data.
        let pageContentViewController = self.storyboard?.instantiateViewController(withIdentifier: "PageContentViewController") as! PageContentViewController
        
        pageContentViewController.strContent = "\(arrContent[index])"
//       pageContentViewController.strBtnName = "\(arrbtnTitle[index])"
        pageContentViewController.strImageCenter = "\(arrImageCenter[index])"
        pageContentViewController.strImageBg = "\(arrImageBg[index])"
        
//        pageContentViewController.strColor = arrayColor[index]
        pageContentViewController.pageIndex = index
        
        return pageContentViewController
    }
    
    //Paging content
    func setupPageControl() {
        let appearance = UIPageControl.appearance()
        appearance.backgroundColor = UIColor.white
        appearance.pageIndicatorTintColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        appearance.currentPageIndicatorTintColor = MYCOLOR.BASE_RED
        appearance.backgroundColor = UIColor.white
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        setupPageControl()
        return arrContent.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
