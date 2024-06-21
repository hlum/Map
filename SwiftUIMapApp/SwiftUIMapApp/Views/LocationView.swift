//
//  LocationView.swift
//  SwiftUIMapApp
//
//  Created by Hlwan Aung Phyo on 2024/06/18.
//


import SwiftUI
import MapKit

struct LocationView: View {
    let MaxWidthforIpad:CGFloat = 700
    
    @State var showLocationDetailView:Bool = false
    @EnvironmentObject private var vm: LocationViewModel
    var body: some View {
        ZStack{
            mapLayer
                .ignoresSafeArea()
            
            VStack(spacing:0){
                
                header
                    .frame(maxWidth: MaxWidthforIpad)
                    .padding()
                
                Spacer()
                
                locationsPreviewStack
                
            }
            
        }
        .sheet(item: $vm.sheetLocation,onDismiss: nil) { location in
            LocationDetailView(location: location)
        }
    }
}

extension LocationView{
    private var header:some View{
        VStack {
            
            Button {
                vm.toggleLocationList()
            } label: {
                Text(vm.mapLocation.name+", "+vm.mapLocation.cityName)
                    .font(.title)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                    .frame(height:55)
                    .frame(maxWidth: .infinity)
                    .animation(.none,value:vm.mapLocation)
                    .overlay(alignment:.leading){
                        Image(systemName:"arrow.down")
                            .font(.headline)
                            .foregroundColor(.primary)
                            .padding(10)
                            .rotationEffect(Angle(degrees: vm.showLocationsList ? 180 : 0))
                    }
                
            }
            
            
            if vm.showLocationsList{
                LocationListView()
            }
            
        }
        .background(.ultraThinMaterial)
        .cornerRadius(10)
        .shadow(color:Color.black.opacity(0.3),radius: 20,x:0,y:15)
        
    }
    
    private var mapLayer: some View{
        Map(coordinateRegion: $vm.mapRegion,
            annotationItems: vm.locations,
            annotationContent: { location in
            MapAnnotation(coordinate: location.coordinates) {
                LocationmapAnnotation()
                    .scaleEffect(vm.mapLocation == location ? 1 : 0.7)
                    .shadow(radius: 10)
                    .onTapGesture {
                        vm.showNextLocation(location: location)
                    }
            }
        }
            
        )
    }
    
    private var locationsPreviewStack: some View {
        ZStack{
            ForEach(vm.locations) { location in
                if vm.mapLocation == location {
                    LocationPreviewView(location: location)
                        .shadow(color: Color.black.opacity(0.6), radius: 20)
                        .padding()
                        .frame(maxWidth: MaxWidthforIpad)
                        .frame(maxWidth: .infinity)
                        .transition(.asymmetric(
                            insertion: .move(edge: .trailing),
                            removal: .move(edge: .leading)))
                }
            }
        }
        
        
    }
}

#Preview {
    LocationView()
        .environmentObject(LocationViewModel())
}
