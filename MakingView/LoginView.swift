//
//  LoginView.swift
//  MakingView
//
//  Created by Dyani on 3/3/24.
//

import SwiftUI

//로그인 정보가 여러개라 불편하니 하나로 통으로 만들어 관리
class LoginViewModel: ObservableObject {
    //값의 변경사항이 있을때(Published될때) 이를 인지하고 뷰는 다시 랜더링되고 업데이트됌
    @Published var email = ""
    @Published var password = ""
    @Published var isUserLoggedIn = false
    
    //로그인 이메일주소 유효성검사 코드 --->
    var isValidEmail: Bool {
        isValid(regex: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9-]+\\.[A-Za-z]{2,4}")
    }
    
    func login() {
        isUserLoggedIn = isValidEmail
    }
    
    private func isValid(regex: String) -> Bool {
        let test = NSPredicate(format: "SELF MATCHES %@", regex)
        return test.evaluate(with: email)
    }
    
    //----<
}

//StateObject -- @State와 비슷
struct LoginView1: View {
//로그인 정보가 여러개라 불편하니 하나로 통으로 만들어 관리
//    @State private var email = ""
//    @State private var password = ""
//    @State private var isUserLoggedIn = false
    
    
    @StateObject private var loginVM = LoginViewModel()
    
//swiftUI가 상태를 관리하지 않음 (View가 다시 랜더링되면 로그인데이터가 들고있던 내용이 초기화됌
//    @ObservedObject private var loginData = LoginData()

    
    var body: some View {
        VStack {
            Text("로그인이 필요해요").font(.largeTitle).bold()
            
            TextField("이메일을 입력해 주세요...", text: $loginVM.email)
                .roundedField()
               
            SecureField("비밀번호를 입력해 주세요...", text: $loginVM.password)
                .roundedField()
            
            Button("로그인") {
                loginVM.login()
            }
            //이메일주소 검사에 맞지않으면 로그인버튼 비활성화
            .disabled(!loginVM.isValidEmail)
        }
        .fullScreenCover(isPresented: $loginVM.isUserLoggedIn) {
            Text(loginVM.email)
        }
    }
}



//ObservedObject -- @Binding처럼 씀
struct LoginView2: View {
//로그인 정보가 여러개라 불편하니 하나로 통으로 만들어 관리
//    @State private var email = ""
//    @State private var password = ""
//    @State private var isUserLoggedIn = false
    
    
    @ObservedObject private var loginVM = LoginViewModel()
    
//swiftUI가 상태를 관리하지 않음 (View가 다시 랜더링되면 로그인데이터가 들고있던 내용이 초기화됌
//    @ObservedObject private var loginData = LoginData()

    
    var body: some View {
        VStack {
            Text("로그인이 필요해요").font(.largeTitle).bold()
            
            TextField("이메일을 입력해 주세요...", text: $loginVM.email)
                .roundedField()
               
            SecureField("비밀번호를 입력해 주세요...", text: $loginVM.password)
                .roundedField()
            
            Button("로그인") {
                loginVM.login()
            }
            //이메일주소 검사에 맞지않으면 로그인버튼 비활성화
            .disabled(!loginVM.isValidEmail)
        }
        .fullScreenCover(isPresented: $loginVM.isUserLoggedIn) {
            Text(loginVM.email)
        }
    }
}


struct ContainerView: View {
    @State private var toggle: Bool = false
    
    var body: some View {
        VStack {
            Toggle("토글 해봅시다", isOn: $toggle)
            
            LoginView1()
            LoginView2()
        }
    }
}


//반복되는 속성은 extension view로
extension View {
    func roundedField() -> some View {
        self.padding()
            .background {
                RoundedRectangle(cornerRadius: 20).stroke()
            }
            .padding([.horizontal, .bottom])
    }
}



#Preview {
    
    //ObservedObject를 사용할때 프리뷰
//    @StateObject var loginData = LoginData()
//    LoginView(loginData: loginData)
    
//    LoginView()
    
    ContainerView()
}


