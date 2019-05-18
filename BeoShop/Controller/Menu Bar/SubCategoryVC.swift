//
//  SubCategoryVC.swift
//  BeoShop
//
//  Created by Akramul Haque on 8/5/19.
//  Copyright © 2019 AABPD. All rights reserved.
//

import UIKit

class SubCategoryVC: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var CategoryNameLbl: UILabel!
    
    var demoArray = ["Md","Rashed","Pervez"]
    
    var words = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        CategoryNameLbl.text = "\(words)"
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return demoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.accessoryType = .disclosureIndicator
        cell?.textLabel?.text = self.demoArray[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 35
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let revealController: SWRevealViewController = self.revealViewController()
        //        let mainStrBoard = UIStoryboard.init(name: "Main", bundle: nil)
        //        let rootVC = mainStrBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        //        let objHome = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
        //        let navigationController: UINavigationController = UINavigationController(rootViewController: objHome)
        //        rootVC.subViewController = Optional(navigationController)
        //       // self.navigationController?.isNavigationBarHidden = false
        //        revealController.pushFrontViewController(rootVC, animated: true)
        
        let mainStrBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let rootVC = mainStrBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        let subVC = storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
        rootVC.subViewController = Optional(subVC)
      //  self.navigationController?.pushViewController(rootVC, animated: true)
        revealController.pushFrontViewController(rootVC, animated:true)
        
    }
}


//extension UIView {
//    func snapshot() -> UIImage {
//        UIGraphicsBeginImageContextWithOptions(bounds.size, false, UIScreen.main.scale)
//        drawHierarchy(in: bounds, afterScreenUpdates: true)
//        let result = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//        return result!
//    }
//}
//
//extension UIWindow {
//    func replaceRootViewControllerWith(_ replacementController: UIViewController, animated: Bool, completion: (() -> Void)?) {
//        let snapshotImageView = UIImageView(image: self.snapshot())
//        self.addSubview(snapshotImageView)
//
//        let dismissCompletion = { () -> Void in // dismiss all modal view controllers
//            self.rootViewController = replacementController
//            self.bringSubviewToFront(snapshotImageView)
//            if animated {
//                UIView.animate(withDuration: 0.4, animations: { () -> Void in
//                    snapshotImageView.alpha = 0
//                }, completion: { (success) -> Void in
//                    snapshotImageView.removeFromSuperview()
//                    completion?()
//                })
//            }
//            else {
//                snapshotImageView.removeFromSuperview()
//                completion?()
//            }
//        }
//        if self.rootViewController!.presentedViewController != nil {
//            self.rootViewController!.dismiss(animated: false, completion: dismissCompletion)
//        }
//        else {
//            dismissCompletion()
//        }
//    }
//}
