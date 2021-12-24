//
//  LoginView.swift
//  Great
//
//  Created by Lee Juwon on 2021/12/24.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var userAuth: UserAuth
    
    var body: some View {
        NavigationView {
            if !userAuth.isLoggedin{
                ContentView()
            } else {
                MainView()
            }
        }
    }
}

struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
