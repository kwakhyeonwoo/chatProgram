//
//  ContentView.swift
//  chatProgram
//
//  Created by 곽현우 on 9/10/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var messageManager = MessageManager()
    
    var body: some View {
        VStack {
            VStack{
                TitleRow()
                
                ScrollView{
                    //이미 값이 할당 되어 있는 배열에서 불러올 때는 id: \.self자기 자신을 클로저를 통해 반복을 시킨다 
                    ForEach(messageManager.message, id: \.id) {message in
                        MessageBubble(message: message)
                    }
                }
                .padding(.top, 10)
                .background(.white)
                //Extension부분에서 생성한 함수가 cornerRadius기 때문에 색이 다름, ScrollView부분 하단부가 아닌 상단부 부분에만 cornerRadius를 넣기 위해 Extension 사용
                .cornerRadius(30, corners: [.topLeft, .topRight])
            }
            .background(Color("Peach"))
            
            MessageField()
        }
    }
}

#Preview {
    ContentView().environmentObject(MessageManager())
}
