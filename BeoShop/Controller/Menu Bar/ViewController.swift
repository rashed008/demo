//
//  ViewController.swift
//  BeoShop
//
//  Created by Akramul Haque on 7/5/19.
//  Copyright © 2019 AABPD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tapBar: UITabBar!
    @IBOutlet var containerView: UIView!
    @IBOutlet weak var Open: UIBarButtonItem!
    
    open var subViewController:UIViewController?
    internal var previousVc:UIViewController!
    open var isTabBarHidden = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //MARK: For Tabbar
        tapBar.delegate = self as? UITabBarDelegate
        
        Open.target = self.revealViewController()
        Open.action = #selector(SWRevealViewController.revealToggle(_:))
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.revealViewController().rearViewRevealWidth = self.view.frame.width - 64
        
        //handle tab bar
        //   handleTabBar()
        
        //place sub view controller if any
        // placeSubViewControllerIfNeeded()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //        if revealViewController() != nil {
        //
        //            let rightRevealButtonItem: UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "Menu")!, style: .done, target: self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)))
        //            self.navigationItem.leftBarButtonItem = rightRevealButtonItem
        //            self.navigationItem.leftBarButtonItem?.tintColor = UIColor.white
        //            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        //            view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        //        }
    }
    
    
    
    //MARK: Subview Controller
    func showSubViewContrller(subViewController:UIViewController) {
        
        self.addChild(subViewController)
        subViewController.view.frame = containerView.frame
        self.containerView.addSubview(subViewController.view)
        subViewController.didMove(toParent: self)
        previousVc = subViewController
    }
    
    
    func getStoryBoardByIndentifier(identifier:String)->UIStoryboard {
        return  UIStoryboard.init(name: identifier, bundle: nil)
    }
    
    
    
    
    @IBAction func OnTapHomebtn(_ sender: Any) {
        print("hey i am printing")
        
        //        let storyBoard = getStoryBoardByIndentifier(identifier: "Main")
        //        let vc = storyBoard.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
        //        showSubViewContrller(subViewController: vc, containerView: containerView)
        
        
        let storyBoard = getStoryBoardByIndentifier(identifier: "Main")
        let vc = storyBoard.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
        showSubViewContrller(subViewController: vc)
        
        
    }
}


