//
//  redViewController.swift
//  app4
//
//  Created by yuqiao liang on 9/10/19.
//  Copyright © 2019 yuqiao liang. All rights reserved.
//

import UIKit

class redViewController: UIViewController {


    @IBOutlet weak var purpleLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("purple")
        purpleLabel.text = "new"
        self.navigationItem.title = "PURPLE"
        self.tabBarController?.tabBar.tintColor = .purple

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
