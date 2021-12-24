//
//  Login.swift
//  Great
//
//  Created by Lee Juwon on 2021/12/24.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var userAuth:
        UserAuth
    
    var body: some View {
        NavigationView {
            if !userAuth.isLoggedin{
                LoginView()
            } else {
                DashboardView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
