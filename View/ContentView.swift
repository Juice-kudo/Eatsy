//
//  LoginView.swift
//  Great
//
//  Created by Lee Juwon on 2021/12/24.
//
import SwiftUI
struct ContentView: View {
    
    let userInfo=UserDefaults.standard
    var body: some View{
        
        LoginView()
    }
}
struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

