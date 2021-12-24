//
//  GreatApp.swift
//  Great
//
//  Created by Lee Juwon on 2021/12/23.
//

import SwiftUI
import Firebase

@main
struct GreatApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            LoginView()
                .environmentObject(UserAuth())
        }
    }
}
