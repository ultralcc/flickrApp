//
//  ViewController.swift
//  FlickrAPP
//
//  Created by Ignacio Lee on 2020/5/28.
//  Copyright © 2020 UltraLCC. All rights reserved.
//

import UIKit

class FirstPageViewController: UIViewController {

    @IBOutlet var searchField: UITextField!
    @IBOutlet var limitField: UITextField!
    @IBOutlet var searchButton: UIButton!
    
    
    @IBAction func onsearchChange(_ sender: Any){
        buttonEnableControl()
    }
    
    @IBAction func onLimitChange(_ sender: Any){
        buttonEnableControl()
    }
    
    @IBAction func onSearchPressed(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Functions
    
    func buttonEnableControl(){
        if !(searchField.text == "" || limitField.text == "") {
            searchButton.isEnabled = true
            searchButton.backgroundColor = UIColor(red: 65, green: 130, blue: 251)
        } else {
            searchButton.isEnabled = false
            searchButton.backgroundColor = .gray
        }
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResultSegue" {
            let tabBarController = segue.destination as! UITabBarController
            let dv = tabBarController.viewControllers?.first as!
            ResultViewController
            dv.search = searchField.text
            dv.limit = limitField.text
        }
    }

}

