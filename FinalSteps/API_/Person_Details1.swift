//
//  Person_Details.swift
//  FinalSteps
//
//  Created by Atheer Alahmari on 21/05/1443 AH.
//

import Foundation

// MARK: - Welcome
struct Person_Details1: Codable {
    let results: [Result]
}

// MARK: - Result
struct Result: Codable {
    let name, mass,  birthYear: String
    let gender: String
    

    enum CodingKeys: String, CodingKey {
        case name, mass
        case birthYear = "birth_year"
        case gender  }
}
