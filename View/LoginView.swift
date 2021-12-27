//
//  LoginView.swift
//  Great
//
//  Created by Lee Juwon on 2021/12/24.
//
import SwiftUI

struct LoginView: View {
    
    var body: some View {
        NavigationView{
            ZStack{
                Color(red: 0.876, green: 0.845, blue: 1).ignoresSafeArea()
                VStack{
                    Spacer()
                    //텍스트가 너무 안예쁘다 어떻게 더 코드를 예쁘게 만들가 ?
                    Text("Easy 하게 먹자")
                        .font(.custom("AmericanTypewriter", size:22))
                        .foregroundColor(Color.orange)
                        .fontWeight(.semibold)
                    HStack{
                        Text("E")
                            .font(.custom("AmericanTypewriter", size:40))
                            .foregroundColor(Color.purple)
                            .multilineTextAlignment(.center)
                        Text("a")
                            .font(.custom("AmericanTypewriter", size:40))
                            .foregroundColor(Color.purple)
                            .multilineTextAlignment(.center)
                        Text("t")
                            .font(.custom("PT Sans", size:40))
                            .foregroundColor(Color.black)
                            .multilineTextAlignment(.center)
                        Text("s")
                            .font(.custom("AmericanTypewriter", size:40))
                            .foregroundColor(Color.purple)
                            .multilineTextAlignment(.center)
                        Text("y")
                            .font(.custom("AmericanTypewriter", size:40))
                            .foregroundColor(Color.purple)
                            .multilineTextAlignment(.center)
                    }
                    .offset(y:30)
                    Spacer()
                    NavigationLink(destination: MainView()){
                        Text("비회원 시작")
                            .font(.custom("AmericanTypewriter", size:30))
                            .foregroundColor(Color.purple)
                            .fontWeight(.bold)
                    }
                
                }
                
            
            }
            .hiddenNavigationBarStyle()
            
        }
        
    }
}

struct LoginView_Preview: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

