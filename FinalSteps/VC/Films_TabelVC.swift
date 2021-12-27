//
//  Films_TabelVC.swift
//  FinalSteps
//
//  Created by Atheer Alahmari on 19/05/1443 AH.
//

import UIKit

struct films_Details {
    let title_f, openingCrawl, director,  releaseDate: String
}

class Films_TabelVC: UITableViewController {

    // Hardcoded data for now
    var films :[films_Details] = []
    
    override func viewDidLoad()  {
        super.viewDidLoad()
       getFilmsApi()
    }
    

    func getFilmsApi(){
        ApiManager.getAllFilms(completionHandler:{ data, response, error in
        do {
            if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                if let results = jsonResult["results"] {
                    
                    let resultsArray = results as! NSArray
                    
                    for object in resultsArray {
                        if let jsonObject = object as? NSDictionary{
                            let films_Details_obj = films_Details.init(title_f: jsonObject["title"] as! String , openingCrawl: jsonObject["opening_crawl"] as! String , director: jsonObject["director"] as! String , releaseDate: jsonObject["release_date"] as! String)
                            self.films.append(films_Details_obj)
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
        return films.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: Films_TabelVC.self), for: indexPath)
        
        cell.textLabel?.text = films[indexPath.row].title_f
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let filmsDetails_VC = self.storyboard!.instantiateViewController(withIdentifier:"FilmsDetails_VC") as! FilmsDetails_VC
        let filmsDetails_obj = films[indexPath.row]
        
        filmsDetails_VC.title1 = filmsDetails_obj.title_f
        filmsDetails_VC.openingCrawl = filmsDetails_obj.openingCrawl
        filmsDetails_VC.director = filmsDetails_obj.director
        filmsDetails_VC.releaseDate = filmsDetails_obj.releaseDate
        
        self.navigationController?.pushViewController( filmsDetails_VC, animated: true)
    }
    
}
