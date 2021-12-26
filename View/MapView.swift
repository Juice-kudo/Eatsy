//
//  MapView.swift
//  Great
//
//  Created by Lee Juwon on 2021/12/24.
//

import Foundation
import SwiftUI
import MapKit

struct MapView: View{
    @State private var region: MKCoordinateRegion = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: MapDefaults.latitude, longitude: MapDefaults.longitude),
            span: MKCoordinateSpan(latitudeDelta: MapDefaults.zoom, longitudeDelta: MapDefaults.zoom))
            
    private enum MapDefaults {
        static let latitude = 37.564
        static let longitude = 127.0
        static let zoom = 0.1
        }
    
    var body: some View{
        VStack{
            Map(coordinateRegion: $region,
                interactionModes: .all,
                showsUserLocation: true)
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
            .preferredColorScheme(.light)
    }
}
