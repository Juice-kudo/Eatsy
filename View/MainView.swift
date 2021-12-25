//
//  MainView.swift
//  Great
//
//  Created by Lee Juwon on 2021/12/24.
//

import Foundation
import SwiftUI

struct MainView: View{
    @State var text : String = ""
    var body: some View{
        VStack{
            TopView(text: self.$text)
            Spacer()
            
        }
    }
}

//최상단 메뉴와 검색 부분
struct TopView: View{
    @Binding var text : String
    @State var editText : Bool = false
    var body: some View{
        HStack{
            NavigationLink(destination: LikeView()){
                ToStarView()
                    .padding(.leading)
            }
            TextField("음식점 찾기", text : self.$text)
                .padding(10)
                .background(Color.white)
                .cornerRadius(15)
                .overlay(
                    HStack{
                        Spacer()
                        if self.editText == true{
                            Button(action : {
                                self.editText = false
                                self.text = ""
                                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                            }){
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(Color.purple)
                                    .padding()
                            }
                        }else{
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(Color(.purple))
                                .padding()
                        }
                    }
                ).onTapGesture {
                    self.editText = true
                }
            NavigationLink(destination: MapView()){
                ToMap()
            }
            NavigationLink(destination: MyInfoView()){
                ToMyInfo()
                    .padding(.trailing)
            }
        }
        .border(Color.purple, width: 1)
    }
}

//별점 가기 버튼
struct ToStarView: View {
    var body: some View{
        Image(systemName: "heart")
            .resizable()
            .foregroundColor(Color.purple)
            .scaledToFit()
            .padding(.top, 15)
            
            .padding(.bottom, 15)
            .frame(width: 40, height: 60, alignment: .center)
    }
}

//현재위치 설정 버튼
struct ToMap: View {
    var body: some View{
        Image(systemName: "map")
            .resizable()
            .foregroundColor(Color.purple)
            .scaledToFit()
            .padding(.top, 15)
    
            .padding(.bottom, 12)
            .frame(width: 40, height: 60, alignment: .center)
    }
}

//내정보 열기 버튼
struct ToMyInfo: View{
    var body: some View{
        Image(systemName: "person")
            .resizable()
            .foregroundColor(Color.purple)
            .scaledToFit()
            .padding(.top, 15)
            .padding(.bottom, 10)
            .frame(width:40, height:60, alignment: .center)
            }
}

//PreView
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .preferredColorScheme(.light)
    }
}
