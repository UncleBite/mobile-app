//
//  TableViewController.swift
//  app4
//
//  Created by yuqiao liang on 9/17/19.
//  Copyright © 2019 yuqiao liang. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var cities: [String] = ["Durham","Chapel Hill", "Carrboro","Morrisville","Raleigh","Cary"]
    
    var temps: [String] = ["78","78","77","80","82","81"]
    var pictures: [UIImage] = [UIImage(named: "cloudy")!,UIImage(named: "sunny")!,UIImage(named: "sunny")!,UIImage(named: "cloudy")!,UIImage(named: "rainy")!,UIImage(named: "rainy")!]
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.cities.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! myTableViewCell
        cell.firstLabel?.text = self.cities[indexPath.row]
        cell.secondLabel?.text = self.temps[indexPath.row]
        cell.myImage?.image = self.pictures[indexPath.row]
//        cell.textLabel?.text = self.animals[indexPath.row]+"\(indexPath.section) \(indexPath.row)"
       // cell.textLabel?.textColor = .white
        return cell
    }


    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Animals \(section)"
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            self.cities.remove(at: indexPath.row)
            self.temps.remove(at: indexPath.row)
            self.pictures.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            self.tableView.reloadData()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedObject = self.cities[fromIndexPath.row]
        cities.remove(at: fromIndexPath.row)
        cities.insert(movedObject, at: destinationIndexPath.row)
        let movedObject2 = self.temps[fromIndexPath.row]
        temps.remove(at: fromIndexPath.row)
        temps.insert(movedObject2, at: destinationIndexPath.row)
        let movedObject3 = self.pictures[fromIndexPath.row]
        pictures.remove(at: fromIndexPath.row)
        pictures.insert(movedObject3, at: destinationIndexPath.row)
    }
 

    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
 

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let destVC = segue.destination as! cellViewController
        let myRow = tableView!.indexPathForSelectedRow
        let currentCell = tableView!.cellForRow(at: myRow!)
        let animalLabelName: String = currentCell!.textLabel!.text!;
        destVC.animalName = animalLabelName //self.animals[sender]
    


    }
    
 

}
