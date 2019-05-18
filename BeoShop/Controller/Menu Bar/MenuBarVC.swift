//
//  MenuBarVC.swift
//  BeoShop
//
//  Created by Akramul Haque on 8/5/19.
//  Copyright © 2019 AABPD. All rights reserved.
//

import UIKit

class MenuBarVC: UIViewController {
    
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        UINavigationBar.appearance().barTintColor = .white
        UINavigationBar.appearance().tintColor = .red
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "CaviarDreams", size: 10) as Any]
        UINavigationBar.appearance().isTranslucent = true
        UINavigationBar.appearance().clipsToBounds = true
    }
    
    @IBAction func switchViewAction(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            secondView.alpha = 1
            firstView.alpha = 0
        } else {
            firstView.alpha = 1
            secondView.alpha = 0
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}
