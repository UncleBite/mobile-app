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
    
    var temps: [String : String] = ["Durham": "0",
                                    "Chapel Hill": "0",
                                    "Carrboro": "0",
                                    "Morrisville":"0",
                                    "Raleigh":"0",
                                    "Cary":"0"]
    var pictures: [UIImage] = [UIImage(named: "durham")!,UIImage(named: "chapelHill")!,UIImage(named: "carrboro")!,UIImage(named: "morrisville")!,UIImage(named: "raleigh")!,UIImage(named: "cary")!]
    
    var cnt = 0
    func completion(cityTemp : String, cityName: String) {
        temps[cityName] = cityTemp
        cnt = cnt+1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
  
        DispatchQueue.global().async {
            let dispatchGroup = DispatchGroup()
            
            dispatchGroup.enter()
            print(self.test(lon: "-78.951003", lat: "36.012067",city: "Durham" ))
            dispatchGroup.leave()
            dispatchGroup.wait() //Add reasonable timeout

            dispatchGroup.enter()
            print(self.test(lon: "-79.044956", lat: "35.920534",city: "Chapel Hill"))
            dispatchGroup.leave()
            dispatchGroup.wait() //Add reasonable timeout

            dispatchGroup.enter()
        print(self.test(lon: "-79.080715", lat: "35.918594",city: "Carrboro"))
            dispatchGroup.leave()
            dispatchGroup.wait() //Add reasonable timeout

            dispatchGroup.enter()
            print(self.test(lon: "-78.840483", lat: "35.840368", city: "Morrisville"))
            dispatchGroup.leave()
            dispatchGroup.wait() //Add reasonable timeout

            dispatchGroup.enter()
        print(self.test(lon: "-78.647180", lat: "35.794639",city: "Raleigh"))
            dispatchGroup.leave()
            dispatchGroup.wait() //Add reasonable timeout

            dispatchGroup.enter()
            print(self.test(lon: "-78.795270", lat: "35.785580", city: "Cary"))
            dispatchGroup.leave()
            dispatchGroup.wait() //Add reasonable timeout

            dispatchGroup.notify(queue: .main) {
                //All tasks are completed
            }
        }
        






        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        
    }

    
    func test(lon: String,lat: String, city: String){
        let headers = [
            "x-rapidapi-host": "weatherbit-v1-mashape.p.rapidapi.com",
            "x-rapidapi-key": "8af0d82f43msh34e53305797a0cbp197d01jsnac77d9f76adc"
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://weatherbit-v1-mashape.p.rapidapi.com/current?lang=en&lon="+lon+"&lat="+lat)! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        var cityTemp : Double = 0.0
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                do {
                    let json: NSDictionary = try JSONSerialization.jsonObject(with: data!, options: []) as! NSDictionary
                    let weather = json["data"]
                    if let weatherArray = json["data"] as? [[String:Any]],
                        let weather = weatherArray.first {
                        cityTemp = weather["temp"] as! Double
                        self.completion(cityTemp: String(format:"%.02f", cityTemp), cityName: city)
                        DispatchQueue.main.async {
                            [weak self] in
                            self?.tableView.reloadData()
                        }
                    }
                } catch {
                    print("JSON error: \(error.localizedDescription)")
                }
            }
        })
        
        dataTask.resume()
        
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
        cell.secondLabel?.text = self.temps[cities[indexPath.row]]
        cell.myImage?.image = self.pictures[indexPath.row]
//        cell.textLabel?.text = self.animals[indexPath.row]+"\(indexPath.section) \(indexPath.row)"
       // cell.textLabel?.textColor = .white
        return cell
    }


    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Weather forcast"
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
          //  temps[cities[indexPath.row]] = nil
            //self.temps.remove(at: indexPath.row)
            self.pictures.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            self.tableView.reloadData()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    
    // Override to support rearranging the table view.
//    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
//        let movedObject = self.cities[fromIndexPath.row]
//        cities.remove(at: fromIndexPath.row)
//        cities.insert(movedObject, at: destinationIndexPath.row)
//        let movedObject2 = self.temps[cities[fromIndexPath.row]]
//        temps[cities[fromIndexPath.row]] = nil
//        //temps.remove(at: fromIndexPath.row)
//        temps.insert(movedObject2, at: destinationIndexPath.row)
//        let movedObject3 = self.pictures[fromIndexPath.row]
//        pictures.remove(at: fromIndexPath.row)
//        pictures.insert(movedObject3, at: destinationIndexPath.row)
//    }
 

    
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
        let currentCell = tableView!.cellForRow(at: myRow!) as! myTableViewCell
        let animalLabelName: String = currentCell.firstLabel!.text!
        destVC.animalName = animalLabelName //self.animals[sender]
    


    }
    
 

}
