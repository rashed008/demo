//
//  CategoriesVC.swift
//  BeoShop
//
//  Created by Akramul Haque on 8/5/19.
//  Copyright © 2019 AABPD. All rights reserved.
//

import UIKit

class CategoriesVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var  words = ["unperforated","electryon","freezer","kyle","satiety","phallic","loren","casaba","emulator","introduced","pomeroy","snowdonia","lithog","deconsecrating","rafferty","erich","soke","lodi","poop","marysville","runtier","outsallying","loller","octopi","unthwartable","unheeled","discriminately","assassination","Unfauceted","outcry","porbandar","heritable","immediately","intercarpal","yet","airhead","anthropometrist","granddad","shrank","unriveting","serow","unforged","yogic","slouchily","wolfsburg","baulky","nongraduate","phaye","irradiator","anticlassical","siree","twine","department","unlabouring","supernormality","demander","karyolysis","Tablespoonful","prefermentation","nonregulation","attainder","recane","sclerodermatous","nonevaluation","pedi","browbeaten","prism","naboth","naturelike","tardiest","castlelike","interaccused","finisher","servetus","suppress","hepatize","quadrilateral","sunderland","craftier","lock","galah","preexperienced","selfpropelling","lucrativeness","vigilantness","Busing","preentrance","overregulation","quodlibetic","inflation","inventive","windfall","feverroot","xyloid","critter","earthpea","embracement","amazed","nonagrarian","buttonholed","dipetalous"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.accessoryType = .disclosureIndicator
        cell?.textLabel?.text = self.words[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 35
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard?.instantiateViewController(withIdentifier: "SubCategoryVC") as! SubCategoryVC //SWRevealViewController
        vc.words = self.words[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
