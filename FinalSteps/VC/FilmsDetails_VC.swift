//
//  FilmsDetails_VC.swift
//  FinalSteps
//
//  Created by Atheer Alahmari on 20/05/1443 AH.
//

import UIKit

class FilmsDetails_VC: UIViewController {
    
    @IBOutlet weak var title_Label: UILabel!
    @IBOutlet weak var openingCrawl_Label: UILabel!
    @IBOutlet weak var director_Label: UILabel!
    @IBOutlet weak var releaseDate_Label: UILabel!
    
    var title1:String?
    var openingCrawl:String?
    var director:String?
    var releaseDate:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let title1 = title1 , let openingCrawl = openingCrawl , let director = director , let releaseDate = releaseDate {
            title_Label.text = "Titel: \(title1)"
            openingCrawl_Label.text = "Opening Crawl: \n \(openingCrawl)"
            director_Label.text = "Director: \(director)"
            releaseDate_Label.text = "Release Date: \(releaseDate)"
        }
    }
    
    
    
}
