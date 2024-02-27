//
//  ContentView.swift
//  MakingView
//
//  Created by Dyani on 2/27/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        helloText
        HelloText()
    }
    
 
}

//뷰 정리하기

///1. 확장기능 사용 -- 해당하는 뷰 화면에서만 사용할때
extension ContentView {
    ///깔끔하게 뷰 보여주기
    private var helloText: some View { //변수 선언
        Text("안녕하세요")
            .foregroundColor(.white)
            .font(.largeTitle)
            .frame(maxWidth: .infinity)
            .padding()
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding([.vertical, .horizontal])
    }
    
}

///2. 새로운 뷰로 빼주기 -- 어디서나 재사용하기위해
struct HelloText: View {
    var body: some View {
        Text("안녕하세요")
            .foregroundColor(.white)
            .font(.largeTitle)
            .frame(maxWidth: .infinity)
            .padding()
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding([.vertical, .horizontal])
    }
}



#Preview {
    ContentView()
}
