//
//  UserAuth.swift
//  Great
//
//  Created by Lee Juwon on 2021/12/24.
//

import Combine

import Foundation


class UserAuth: ObservableObject {
    
    @Published var isLoggedin:Bool = false
    
    func login() {
        self.isLoggedin = true
    }
}
