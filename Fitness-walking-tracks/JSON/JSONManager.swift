//
//  JSONManager.swift
//  Fitness-walking-tracks
//
//  Created by Man Ho Ching on 17/2/2023.
//

import Foundation
import SwiftUI
// MARK: - FacilityElement
struct FacilityElement:Hashable , Codable {
    let titleEn, titleTc, titleSc, districtEn: String
    let districtTc, districtSc, routeEn, routeTc: String
    let routeSc, howToAccessEn, howToAccessTc, howToAccessSc: String
    let mapURLEn, mapURLTc, mapURLSc: String
    let latitude: Double
    let longitude: Double
    
    static let fWalking: [FacilityElement] = Bundle.main.decode(file: "facility-fw.json")
    static let sfw: FacilityElement = fWalking[0]
    
    enum CodingKeys: String, CodingKey {
        case titleEn = "Title_en"
        case titleTc = "Title_tc"
        case titleSc = "Title_sc"
        case districtEn = "District_en"
        case districtTc = "District_tc"
        case districtSc = "District_sc"
        case routeEn = "Route_en"
        case routeTc = "Route_tc"
        case routeSc = "Route_sc"
        case howToAccessEn = "HowToAccess_en"
        case howToAccessTc = "HowToAccess_tc"
        case howToAccessSc = "HowToAccess_sc"
        case mapURLEn = "MapURL_en"
        case mapURLTc = "MapURL_tc"
        case mapURLSc = "MapURL_sc"
        case latitude = "Latitude"
        case longitude = "Longitude"
    }
}

enum Latitude: Codable {
    case double(Double)
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Double.self) {
            self = .double(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(Latitude.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Latitude"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .double(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
}

extension Bundle {
    func decode<T: Decodable>(file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Could not find \(file) in the project!")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Could not load \(file) in the project!")
        }
        
        let decoder = JSONDecoder()
        
        guard let loadedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Could not decode \(file) in the project!")
        }
        
        return loadedData
    }
}

typealias Facility = [FacilityElement]
