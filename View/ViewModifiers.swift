//
//  ViewModifiers.swift
//  Great
//
//  Created by Lee Juwon on 2021/12/26.
//

import Foundation
import SwiftUI

struct HiddenNavigationBar : ViewModifier {
    func body(content: Content) -> some View {
        content
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
    }
}
extension View {
    func hiddenNavigationBarStyle() -> some View {
        modifier (HiddenNavigationBar())
    }
}
