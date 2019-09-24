//
//  cellViewController.swift
//  app4
//
//  Created by yuqiao liang on 9/17/19.
//  Copyright © 2019 yuqiao liang. All rights reserved.
//

import UIKit

class cellViewController: UIViewController {

    @IBOutlet weak var cellDetailLabel: UILabel!
    var animalName: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cellDetailLabel.text = animalName
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
