//
//  Location.swift
//  SwiftUIMapApp
//
//  Created by Hlwan Aung Phyo on 2024/06/18.
//

import Foundation
import MapKit

struct Location: Identifiable,Equatable{
    
    
//    let id : UUID
    let name : String
    let cityName : String
    let coordinates : CLLocationCoordinate2D
    let description: String
    let imageNames : [String]
    let link : String
    
    var id : String{
        name+cityName
    }
    
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}
