//
//  PersonDetails_VC.swift
//  FinalSteps
//
//  Created by Atheer Alahmari on 19/05/1443 AH.
//

import UIKit

class PersonDetails_VC: UIViewController {

    @IBOutlet weak var name_Label: UILabel!
    @IBOutlet weak var gender_Label: UILabel!
    @IBOutlet weak var birthYear_label: UILabel!
    @IBOutlet weak var mass_Label: UILabel!
    
    var name:String?
    var gender:String?
    var birthYear:String?
    var mass:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let name = name , let gender = gender , let birthYear = birthYear , let mass = mass
        {
            name_Label.text = "Name: \(name)"
            gender_Label.text = "Gender: \(gender)"
            birthYear_label.text = "Birth Year: \(birthYear)"
            mass_Label.text = "Mass: \(mass)"
        }
    }
    
}
