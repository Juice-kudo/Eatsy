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
            static let latitude = 45.872
            static let longitude = -1.248
            static let zoom = 0.5
        }
    
    var body: some View{
        VStack{
            Text("lat: \(region.center.latitude), long: \(region.center.longitude). Zoom: \(region.span.latitudeDelta)")
                        .font(.caption)
                        .padding()
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
