//
//  ViewController.swift
//  app4
//
//  Created by yuqiao liang on 9/10/19.
//  Copyright © 2019 yuqiao liang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redLabel: UILabel!

    @IBAction func nameButton(_ sender: Any) {
         redLabel.text = "Frank"
    }
    @IBAction func redAction(_ sender: Any) {
        print("Button Pressed")
        redLabel.text = "Button"
        redLabel.textColor = .green
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("red")
        redLabel.text = "newer"
        redLabel.backgroundColor = .yellow
        redLabel.textColor = .lightGray
        //MARK: todo
        self.tabBarController?.tabBarItem.title = "PURPLE"

        // Do any additional setup after loading the view.
    }


}

