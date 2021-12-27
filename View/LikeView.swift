//
//  LikeView.swift
//  Great
//
//  Created by Lee Juwon on 2021/12/24.
//

import Foundation
import SwiftUI

struct LikeView: View{
    @State var text : String = ""
    var body: some View{
        ZStack{
            VStack(spacing:0){
                TopView(text: self.$text)
                    .frame(height: 70)
                    .border(Color.purple, width: 1)
                PrepsView()
                //선택시 디테일 뷰 (오버레이해서 네비게이션 부르기?)
                BottomView()
                    .frame(height: 70)
                    .border(Color.purple, width: 1)
                Spacer()
            }
        }
        .hiddenNavigationBarStyle()
    }
}
struct LikeView_Previews: PreviewProvider {
    static var previews: some View {
        LikeView()
            .preferredColorScheme(.light)
    }
}
