//
//  MapView.swift
//  Great
//
//  Created by Lee Juwon on 2021/12/24.
//

import Foundation

import SwiftUI

struct MapView: View{
    @State var text : String = ""
    var body: some View{
        VStack{
            Text("Map View")
            Spacer()
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
            .preferredColorScheme(.light)
    }
}
