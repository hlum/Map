//
//  LocationViewModels.swift
//  SwiftUIMapApp
//
//  Created by Hlwan Aung Phyo on 2024/06/18.
//

import Foundation
import MapKit
import SwiftUI

class LocationViewModel : ObservableObject{
    
    //All loaded locations
    @Published var locations : [Location]
    
    
    //Current Region on map
    @Published var mapRegion : MKCoordinateRegion = MKCoordinateRegion()
    
    //Current Location on map
    @Published var mapLocation : Location{
        didSet{
            updateMapRegion(location: mapLocation)
        }
    }
    
    //show list of locations
    @Published var showLocationsList : Bool = false
    
    //show detail view
    @Published var sheetLocation: Location? = nil
    
    
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
    
    init(){
        let locations = LocationsDataService.locations
        
        self.locations = locations
        self.mapLocation = locations.first!
        
        self.updateMapRegion(location: locations.first!)
    }
    
    private func updateMapRegion(location: Location){
        withAnimation(.easeInOut){
            mapRegion = MKCoordinateRegion(center: location.coordinates, span: mapSpan)
        }
    }
    
    func toggleLocationList(){
        withAnimation(.easeInOut){
            showLocationsList = !showLocationsList
        }
    }
    
    func showNextLocation(location: Location){
        withAnimation(.easeInOut){
            mapLocation = location
            showLocationsList = false
        }
        
    }
    
    func NextButtonPressed(){
//        let currentIndex = locations.firstIndex { location in
//            return location == mapLocation
//            }
//        }
        //the other way
        guard let currentIndex = locations.firstIndex(where: {$0 == mapLocation}) else{
            print("Could not find current index in locations array!")
            return
        }
        
        //check currentIndex is valid
        
        let nextIndex = currentIndex+1
        guard locations.indices.contains(nextIndex) else{
            //Next Index is not valid
            //restart from 0
            guard let firstLocation = locations.first else{return}
            showNextLocation(location:firstLocation )
            return
        }
        
        let nextLocation = locations[nextIndex]
        showNextLocation(location: nextLocation)
    }
    
}
