//
//  BindingSample.swift
//  MakingView
//
//  Created by Dyani on 3/2/24.
//

import SwiftUI

struct BindingSample: View {
    @State private var backgroundColor1: Color = .brown
    @State private var text: String = ""
    
    var body: some View {
        let _ = Self._printChanges()
        ZStack {
            backgroundColor1.ignoresSafeArea()
            
            
            VStack {
                TextField("텍스트필드도 바인딩을 쓰네요", text: $text)
                ChangeColorButton(backgroundColor2: $backgroundColor1)
            }
        }
    }
}


struct ChangeColorButton: View {
    // 바꾸고 싶은게 백그라운드컬러1인데 2만 변경됌 이럴때 Binding사용, 1과 2를 연결
    @Binding var backgroundColor2: Color
    var body: some View {
        Button {
            backgroundColor2 = .orange
        } label: {
            Text("배경 바꾸기")
                .font(.largeTitle)
                .tint(.white)
                .padding()
                .background{
                    backgroundColor2
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
        }
    }
}


#Preview {
    BindingSample()
}
