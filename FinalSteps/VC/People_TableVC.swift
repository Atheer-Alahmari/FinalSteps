//
//  ViewController.swift
//  FinalSteps
//
//  Created by Atheer Alahmari on 19/05/1443 AH.
//

import UIKit

struct Person_Details {
    let name , gender , birthYear , mass : String
    let species : [String]
}
class People_TableVC: UITableViewController {
    
    // Hardcoded data for now
    var people :[Person_Details] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getPeopleApi()
    }
    
    
    func getPeopleApi(){
        ApiManager.getAllPeople(completionHandler:{ data, response, error in
            do {
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                    if let results = jsonResult["results"] {
                        
                        let resultsArray = results as! NSArray
                        
                        for object in resultsArray {
                            if let jsonObject = object as? NSDictionary{
                                let PersonDetails_obj = Person_Details.init(name: jsonObject["name"] as! String
                                                                            , gender: jsonObject["gender"] as! String
                                                                            , birthYear: jsonObject["birth_year"] as! String
                                                                            , mass: jsonObject["mass"] as! String, species: jsonObject["species"] as! [String]
                                )
                                self.people.append(PersonDetails_obj)
                            }
                        }
                    }
                    
                }
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            }catch {
                print(error)
            }
        })
    }
    
    
    
    
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return people.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: People_TableVC.self), for: indexPath)
        
        cell.textLabel?.text = people[indexPath.row].name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pDetails_VC = self.storyboard!.instantiateViewController(withIdentifier:"PersonDetails_VC") as! PersonDetails_VC
        let personDetails_obj = people[indexPath.row]
        
        pDetails_VC.name = personDetails_obj.name
        pDetails_VC.gender = personDetails_obj.gender
        pDetails_VC.birthYear = personDetails_obj.birthYear
        pDetails_VC.mass = personDetails_obj.mass
        
        self.navigationController?.pushViewController( pDetails_VC, animated: true)
    }
    
    
}
