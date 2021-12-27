//
//  MyInfoView.swift
//  Great
//
//  Created by Lee Juwon on 2021/12/24.
//

import Foundation

import SwiftUI

struct MyInfoView: View{
    @State var text : String = ""
    var body: some View{
        ZStack{
            VStack{
                Text("Juice")
                    .foregroundColor(Color.purple)
                    .font(.custom("AmericanTypewriter", size:30))
                MyInformation()
                Spacer()
                StatisticView()
                Spacer()
                ReviewView()
                Spacer()
                BottomView()
                    .frame(height: 70)
                    .border(Color.purple, width: 1)
            }
        }
    }
}

struct MyInformation: View {
    var body: some View {
        HStack{
            Image("Kudo")
                .resizable()
                .mask(
                    Circle()
                        .frame(width: 200, height: 200)
                )
                .frame(width: 200, height: 200)
                .padding(10)
            // 영역을 나눈다는게 잘못 짠듯, 다시 하나의 프레임으로 합쳐야함
            // 변수 저장해서 갖고와야하는디 아직 모름.
            VStack(spacing:12){
                Text("아이디")
                    .fontWeight(.bold)
                    .foregroundColor(Color.purple)
                
                Text("평가")
                    .fontWeight(.bold)
                    .foregroundColor(Color.purple)
                Text("팔로우")
                    .fontWeight(.bold)
                    .foregroundColor(Color.purple)
                Text("팔로워")
                    .fontWeight(.bold)
                    .foregroundColor(Color.purple)
                
            }
            
            
            .frame(width: 50, height: 220)
            VStack(spacing:12){
                Text("hani6908")
                    .fontWeight(.bold)
                    .foregroundColor(Color.purple)
                
                Text("24")
                    .fontWeight(.bold)
                    .foregroundColor(Color.purple)
                Text("0")
                    .fontWeight(.bold)
                    .foregroundColor(Color.purple)
                Text("0")
                    .fontWeight(.bold)
                    .foregroundColor(Color.purple)
                
            }
            .frame(width: 90, height: 220)
        }
    }
}

struct StatisticView: View {
    var body: some View{
        Text("음식점 종류 등에 따른 통계 그래프와 수치")
    }
}

struct ReviewView: View {
    var body: some View{
        Text("해당 음식점에 대한 포스팅이나 리뷰 모음 박스")
    }
}

struct MyInfoView_Previews: PreviewProvider {
    static var previews: some View {
        MyInfoView()
            .preferredColorScheme(.light)
    }
}

