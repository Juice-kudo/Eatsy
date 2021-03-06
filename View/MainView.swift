//
//  MainView.swift
//  Great
//
//  Created by Lee Juwon on 2021/12/24.
//
// 하단 뷰가 모두 존재하니까, 하단 뷰 없는 화면 빼고는 다 네비게이션 뷰를 하단뷰 위쪽까지만 해서 해볼가요?

import Foundation
import SwiftUI

struct MainView: View{
    @State var text : String = ""
    var body: some View{
        ZStack{
            
            VStack(spacing:0){
                TopView(text: self.$text)
                    .frame(height: 70)
                    .border(Color.purple, width: 1)
                    PrepsView()
                BottomView()
                    .frame(height: 70)
                    .border(Color.purple, width: 1)
                Spacer()
            }
        }
        .hiddenNavigationBarStyle()
    }
}

//최상단 메뉴와 검색 부분
struct TopView: View{
    @Binding var text : String
    @State var editText : Bool = false
    var body: some View{
        HStack(spacing:0){
            WhereAmI()
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
                ToMapView()
            }
            
        }
        .padding(.leading)
    }
}
struct WhereAmI: View {
    var body: some View {
        VStack{
            Text("현재 위치")
                .font(.custom("AmericanTypewriter", size:25))
                .fontWeight(.bold)
                .foregroundColor(Color.purple)
            Text("서울시 강남구")
                .font(.custom("AmericanTypewriter", size:20))
                .fontWeight(.bold)
                .foregroundColor(Color.purple)
        }
        
    }
}
//현재위치 설정 버튼
struct ToMapView: View {
    var body: some View {
        VStack{
            Image(systemName: "map")
                .resizable()
                .foregroundColor(Color.purple)
                .scaledToFit()
                .frame(width: 30, height: 30)
            Text("지도")
                .fontWeight(.bold)
                .foregroundColor(Color.purple)
        }
        .frame(width: 60, height: 60)
    }
}

//내정보 열기 버튼
struct ToMyInfoView: View{
    var body: some View{
        VStack{
            Image(systemName: "person")
                .resizable()
                .foregroundColor(Color.purple)
                .scaledToFit()
                .frame(width:30, height:30)
            Text("내정보")
            .fontWeight(.bold)
            .foregroundColor(Color.purple)
        }
        
        .frame(width: 60, height: 60)
    }
}

//추천 알고리즘 후 나온 데이터를 토대로 추천 목록
struct PrepsView: View{
    var prepData = preps
    var body: some View{
        ScrollView(.vertical, showsIndicators: false){
            VStack(spacing:0){
                ForEach(prepData){
                    prep in PrepView(prep: prep)
                }
            }
        }
    }
}
    
struct PrepView: View{
        let prep : Prep
        var body : some View{
            VStack{
                HStack{
                    Image(systemName: "heart")
                        .frame(width: 100, height: 100)
                    VStack(alignment:.leading, spacing: 5.0){
                        HStack{
                            Text(prep.name)
                            Spacer()
                            Text(prep.category)
                        }
                        Text("대표메뉴 \(prep.mainmenu)")
                        Text("대충 이런 느낌 틀")
                    }
                    .foregroundColor(Color.gray)
                    .font(.system(size:20))
                    .frame(width: 200, height: 100, alignment: .leading)
                    Spacer()
                }
            }
            .frame(height:100)
        }
    }

struct Prep : Identifiable {
    let id = UUID()
    let name : String
    let category : String
    let mainmenu : String
}

// 예시. 원래 지도 음식점 목록이랑 같이 받아와야
let preps = [
    
    Prep(name: "신전떡볶이", category: "분식", mainmenu: "매운떡볶이"),
    Prep(name: "유가네", category: "한식", mainmenu: "해물칼국수"),
    Prep(name: "맥도날드", category: "패스트푸드", mainmenu: "빅맥"),
    Prep(name: "롯데리아", category: "패스트푸드", mainmenu: "불고기버거"),
    Prep(name: "버거킹", category: "패스트푸드", mainmenu: "와퍼"),
    Prep(name: "엽기떡볶이", category: "분식", mainmenu: "매운떡볶이"),
    Prep(name: "서가앤쿡", category: "양식", mainmenu: "스테이크파스타"),
    Prep(name: "도미노피자", category: "양식", mainmenu: "콤비네이션"),
    Prep(name: "피자샵", category: "양식", mainmenu: "콤비네이션"),
    Prep(name: "이삭토스트", category: "분식", mainmenu: "햄치즈토스트"),
    Prep(name: "명랑핫도그", category: "분식", mainmenu: "먹물핫도그"),
    Prep(name: "황금족발", category: "야식", mainmenu: "족발보쌈세트"),
    Prep(name: "홍창반점", category: "중식", mainmenu: "짜장면")
    
]

// 별점 가기 버튼
struct ToStarView: View {
    var body: some View{
        VStack{
            Image(systemName: "star")
                .resizable()
                .foregroundColor(Color.purple)
                .scaledToFit()
                .frame(width:30, height:30)
                
            Text("별점")
            .fontWeight(.bold)
            .foregroundColor(Color.purple)
        }
        
        .frame(width: 60, height: 60)
    }
}

struct ToMainView: View {
    var body: some View{
        VStack{
            Image(systemName: "house")
                .resizable()
                .foregroundColor(Color.purple)
                .scaledToFit()
                .frame(width:30, height:30)
                
            Text("메인")
            .fontWeight(.bold)
            .foregroundColor(Color.purple)
        }
        .frame(width: 60, height: 60)
    }
}

struct ToFeedView: View {
    var body: some View{
        VStack{
            Image(systemName: "person.2")
                .resizable()
                .foregroundColor(Color.purple)
                .scaledToFit()
                .frame(width:30, height:30)
                
            Text("피드")
            .fontWeight(.bold)
            .foregroundColor(Color.purple)
        }
        .frame(width: 60, height: 60)
    }
}

struct ToSearchView: View {
    var body: some View{
        VStack{
            Image(systemName: "magnifyingglass")
                .resizable()
                .foregroundColor(Color.purple)
                .scaledToFit()
                .frame(width:30, height:30)
                
            Text("탐색")
            .fontWeight(.bold)
            .foregroundColor(Color.purple)
        }
        .frame(width: 60, height: 60)
    }
}

// 하단 메뉴, 버튼

struct BottomView: View{
    var body: some View{
        VStack(spacing:0){
            HStack(spacing:10){
                Spacer()
                NavigationLink(destination: MainView()){
                    ToMainView()
                        
                }
                NavigationLink(destination: LikeView()){
                    ToStarView()
                        
                }
                NavigationLink(destination: FeedView()){
                    ToFeedView()
                        
                }
                NavigationLink(destination: SearchView()){
                    ToSearchView()
                }
                NavigationLink(destination: MyInfoView()){
                    ToMyInfoView()
                }
                Spacer()
            }
        }
        .frame(height:60)
    }
}

//PreView
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .preferredColorScheme(.light)
    }
}
