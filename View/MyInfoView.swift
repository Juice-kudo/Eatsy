//
//  MyInfoView.swift
//  Great
//
//  Created by Lee Juwon on 2021/12/24.
//

import Foundation

import SwiftUI

struct MyInfoView: View{
    @State var text : String = ""
    var body: some View{
        VStack{
            Text("My Information")
            Spacer()
        }
    }
}

struct MyInfoView_Previews: PreviewProvider {
    static var previews: some View {
        MyInfoView()
            .preferredColorScheme(.light)
    }
}

