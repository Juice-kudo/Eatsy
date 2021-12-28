//
//  MapView.swift
//  Great
//
//  Created by Lee Juwon on 2021/12/24.
//
import Foundation
import SwiftUI
import MapKit
import CoreLocation

struct MapView: View{
    @StateObject private var viewModel = MapViewModel()
    
    @State var text : String = ""
    
    
    
    var body: some View{
        VStack(spacing:0){
            
            MapTopView(text: self.$text)
                .frame(height: 70)
                .border(Color.purple, width: 1)
            
            Map(coordinateRegion: $viewModel.myPosition, showsUserLocation: true, userTrackingMode: .constant(.follow))
                .onAppear {
                    viewModel.checkIfLocationServicesIsEnabled()
                }
                .accentColor(Color(.systemPink))
            
            DetailView()
                .frame(height:150)
            
        }
             
    }
}

final class MapViewModel: NSObject,ObservableObject, CLLocationManagerDelegate {
    
    @Published var myPosition = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.497954, longitude: 127.027564), span: MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002))
    
    var locationManager: CLLocationManager?
    
    func checkIfLocationServicesIsEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager!.delegate = self
            locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        } else {
            print("Show an alert letting them know this is off and to go turn it on.")
        }
    }
    
    private func checkLocationAuthorization() {
        guard let locationManager = locationManager else {
            return
        }
        
        switch locationManager.authorizationStatus {
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Your location is restricted likely due to parental controls.")
        case .denied:
            print("You have denied this app location permission. Go into settings to change it.")
        case .authorizedAlways, .authorizedWhenInUse:
            myPosition = MKCoordinateRegion(center: locationManager.location!.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002))
            
        @unknown default:
            break
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
}

struct MapTopView: View{
    @Binding var text : String
    @State var editText : Bool = false
    var body: some View{
        HStack(spacing:0){
            WhereAmI()
            TextField("음식점 찾기", text : self.$text)
                .padding(10)
                .background(Color.white)
                .cornerRadius(15)
                .overlay(
                    HStack{
                        Spacer()
                        if self.editText == true{
                            Button(action : {
                                self.editText = false
                                self.text = ""
                                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                            }){
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(Color.purple)
                                    .padding()
                            }
                        }else{
                            Image(systemName: "magnifyingglass")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(Color(.purple))
                                .padding()
                        }
                    }
                ).onTapGesture {
                    self.editText = true
                }
            MyLocation()
            
            
            
        }
        .padding(.leading)
    }
}

struct MyLocation: View {
    
    var body: some View {
        Button(action: {
            
        }) {
        VStack{
            Image(systemName: "location.fill")
                .resizable()
                .foregroundColor(Color.purple)
                .scaledToFit()
                .frame(width: 30, height: 30)
            Text("내 위치")
                .fontWeight(.bold)
                .foregroundColor(Color.purple)
        }
        .frame(width: 60, height: 60)

        }
    }
}

struct DetailView: View {
    var body: some View{
        Text("해당 가게 상세 정보")
        
    }
        
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
            .preferredColorScheme(.light)
    }
}
