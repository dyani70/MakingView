//
//  CustomCount.swift
//  MakingView
//
//  Created by Dyani on 3/2/24.
//

import SwiftUI

struct CustomCount: View {
    @State var count: Int = 0
   
    var body: some View {
        //변경사항을 추적할 수 있는 print문
        let _ = Self._printChanges()
        
        VStack(spacing: 30) {
            Text(count.formatted())
                .font(.largeTitle)
            HStack(spacing: 20) {
                Button("카운트 감소") { count -= 1 }
                    .tint(.pink)
                
                Button("카운트 증가") { count += 1 }
                
            }
        }
    }
}

#Preview {
    CustomCount()
}
