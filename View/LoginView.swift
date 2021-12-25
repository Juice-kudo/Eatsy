//
//  LoginView.swift
//  Great
//
//  Created by Lee Juwon on 2021/12/24.
//
import SwiftUI
import CryptoKit
import AuthenticationServices
import FirebaseAuth

struct LoginView: View {
    
    @EnvironmentObject var userAuth: UserAuth
    
    var body: some View {
        NavigationView{
            VStack{
                Spacer()
               Text("Easy 하게 먹자")
                   .font(.custom("AmericanTypewriter", size:20))
                   .foregroundColor(Color.orange)
                   
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
                
               ToLoginView()
                
            }
        }
    }
}

struct ToLoginView: View {
    
    @EnvironmentObject var userAuth: UserAuth
    @State var currentNonce: String?
    
    private func randomNonceString(length: Int = 32) -> String {
      precondition(length > 0)
      let charset: Array<Character> =
          Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
      var result = ""
      var remainingLength = length

      while remainingLength > 0 {
        let randoms: [UInt8] = (0 ..< 16).map { _ in
          var random: UInt8 = 0
          let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
          if errorCode != errSecSuccess {
            fatalError("Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)")
          }
          return random
        }

        randoms.forEach { random in
          if remainingLength == 0 {
            return
          }

          if random < charset.count {
            result.append(charset[Int(random)])
            remainingLength -= 1
          }
        }
      }

      return result
    }
    
    private func sha256(_ input: String) -> String {
      let inputData = Data(input.utf8)
      let hashedData = SHA256.hash(data: inputData)
      let hashString = hashedData.compactMap {
        return String(format: "%02x", $0)
      }.joined()

      return hashString
    }
    
    var body: some View {
        
        NavigationLink(destination: MainView()){
            Text("비회원 시작")
                .font(.custom("AmericanTypewriter", size:25))
                .foregroundColor(Color.purple)
                
                
            }
        
        SignInWithAppleButton(
            onRequest: { request in
                let nonce = randomNonceString()
                currentNonce = nonce
                request.requestedScopes = [.fullName, .email]
                request.nonce = sha256(nonce)
            },
            onCompletion: { result in
                switch result {
                   case .success(let authResults):
                        switch authResults.credential {
                        case let appleIDCredential as ASAuthorizationAppleIDCredential:
                                           
                               guard let nonce = currentNonce else {
                                    fatalError("Invalid state: A login callback was received, but no login request was sent.")
                                           }
                               guard let appleIDToken = appleIDCredential.identityToken else {
                                               fatalError("Invalid state: A login callback was received, but no login request was sent.")
                                           }
                               guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
                                               print("Unable to serialize token string from data: \(appleIDToken.debugDescription)")
                                               return
                                           }
                                           
                               let credential = OAuthProvider.credential(withProviderID: "apple.com",idToken: idTokenString,rawNonce: nonce)
                                           Auth.auth().signIn(with: credential) { (authResult, error) in
                                  if (error != nil) {
                                                   // Error. If error.code == .MissingOrInvalidNonce, make sure
                                                   // you're sending the SHA256-hashed nonce as a hex string with
                                                   // your request to Apple.
                                                   print(error?.localizedDescription as Any)
                                                   return
                                               }
                                               print("signed in")
                                               self.userAuth.login()
                                           }
                                           
                                           print("\(String(describing: Auth.auth().currentUser?.uid))")
                               default:
                                  break
                                           
                      }
                          default:
                             break
                 }
            }
        )
            .frame(width: 200, height: 45, alignment: .center)
            .padding(.init(top: 200, leading: 50, bottom: 20, trailing: 50))
        
    }
}

    
    
    
   


struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

