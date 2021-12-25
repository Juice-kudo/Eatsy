//
//  ContentView.swift
//  Great
//
//  Created by Lee Juwon on 2021/12/23.
//
// 저장해야 할 정보 - 로그인정보, 해당 계정 별점 정보, 유저들 모두의 별점 정보 통계

import SwiftUI
import CryptoKit
import AuthenticationServices
import FirebaseAuth


struct ContentView: View {
    @EnvironmentObject var userAuth: UserAuth
    var body: some View {
        NavigationView{
            /*
             로그인 되어있지 않다면 LoginView
             로그인 되어있다면 MainView
             */
            if !userAuth.isLoggedin{
                LoginView()
            } else {
                MainView()
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
    }
}

