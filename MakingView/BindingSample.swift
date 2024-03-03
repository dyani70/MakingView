//
//  BindingSample.swift
//  MakingView
//
//  Created by Dyani on 3/2/24.
//

import SwiftUI

struct BindingSample: View {
    @State private var backgroundColor1: Color = .blue
    @State private var text: String = ""
    
    var body: some View {
        let _ = Self._printChanges()
        ZStack {
            backgroundColor1.ignoresSafeArea()
            
            
            VStack {
                TextField("텍스트필드도 바인딩을 쓰네요", text: $text)
                //ChangeColorButton불러오는데 2컬러에 1인 blue를 넘겨받음 (양방향으로 연결)
                ChangeColorButton(backgroundColor2: $backgroundColor1)
            }
        }
    }
}


struct ChangeColorButton: View {
    // 버튼을 눌러 백그라운드컬러1을 바꾸고싶은데 2가 변경됌 이럴때 Binding사용, 1과 2를 연결 (양방향 연결)
    @Binding var backgroundColor2: Color
    var body: some View {
        Button {
            //버튼을 클릭하면 컬러2가 오렌지로 변경됌
            backgroundColor2 = .orange
        } label: {
            Text("배경 바꾸기")
                .font(.largeTitle)
                .tint(.white)
                .padding()
                .background{
//                    Color.cyan
                    //버튼색도 배경과 통일하고 싶다면 위의 값이 아닌 아래값을 넣어준다
                    backgroundColor2
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
        }
    }
}


#Preview {
    BindingSample()
}
