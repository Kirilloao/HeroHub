//
//  Hero.swift
//  Heroes
//
//  Created by Kirill Taraturin on 26.10.2023.
//

import Foundation

// MARK: - Hero
struct Hero: Decodable {
    var id: Int
    var name: String
    var slug: String
    var powerstats: Powerstats
    var appearance: Appearance
    var biography: Biography
    var work: Work
    var connections: Connections
    var images: Images
}

// MARK: - Powerstats
struct Powerstats: Decodable {
    var intelligence: Int
    var strength: Int
    var speed: Int
    var durability: Int
    var power: Int
    var combat: Int

}

extension Powerstats {
    var powerStatsArray: [(String, Int)] {
        return [
               ("Intelligence", intelligence),
               ("Strength", strength),
               ("Speed", speed),
               ("Durability", durability),
               ("Power", power),
               ("Combat", combat)
           ]
       
    }
}

// MARK: - Appearance
struct Appearance: Decodable {
    var gender: String
    var race: String?
    var height: [String]
    var weight: [String]
    var eyeColor: String
    var hairColor: String
    
    var description: String {
        """
        Gender: \(gender)
        Race: \(race ?? "unknown")
        Height: \(height)
        Weight: \(weight)
        EyeColor: \(eyeColor)
        HairColor: \(hairColor)
        """
    }
}

// MARK: - Biography
struct Biography: Decodable {
    var fullName: String
    var alterEgos: String
    var aliases: [String]
    var placeOfBirth: String
    var firstAppearance: String
    var publisher: String?
    var alignment: String
    
    var description: String {
        """
        FullName: \(fullName)
        AlterEgos: \(alterEgos)
        Aliases: \(aliases)
        PlaceOfBirth: \(placeOfBirth)
        FirstAppearance: \(firstAppearance)
        Publisher: \(publisher ?? "unknown")
        Alignment: \(alignment)
        """
    }
}

// MARK: - Work
struct Work: Decodable {
    var occupation: String
    var base: String
}

// MARK: - Connections
struct Connections: Decodable {
    var groupAffiliation: String
    var relatives: String
}

// MARK: - Images
struct Images: Decodable {
    var xs: String
    var sm: String
    var md: String
    var lg: String
}

