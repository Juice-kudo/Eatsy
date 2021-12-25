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
            PrepsView()
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
}

struct PrepsView: View{
    var prepData = preps
    var body: some View{
        ScrollView(.vertical, showsIndicators: false){
            VStack{
                ForEach(prepData){
                    prep in PrepView(prep: prep)
                    
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
                        Text("\(prep.name)  \(prep.category)")
                        
                        Text("메뉴 : \(prep.mainmenu)")
                        
                        Text("대충 이런 느낌 스크롤바")
                    }
                    .font(.system(size:15))
                    .frame(width: 200, height: 100, alignment: .leading)
                    
                    Spacer()
                    
                }
            }
            .frame(width:300, height:100)
            
        }
    }
}

struct Prep : Identifiable {
    let id = UUID()
    let name : String
    let category : String
    let mainmenu : String
}

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

//PreView
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .preferredColorScheme(.light)
    }
}
