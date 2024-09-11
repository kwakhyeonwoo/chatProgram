//
//  MessageBubble.swift
//  chatProgram
//
//  Created by 곽현우 on 9/10/24.
//

import SwiftUI

struct MessageBubble: View {
    var message : Message
    @State private var showTime : Bool = false
    
    var body: some View {
        VStack(alignment: message.received ? .leading : .trailing){
            HStack{
                Text(message.text)
                    .padding()
                    .background(message.received ? Color("gray"): Color("Peach"))
                    .cornerRadius(30)
            }
            //메시지의 특정 너비 초과하지 않게 설정
            .frame(maxWidth: 300, alignment: message.received ? .leading : .trailing)
            //HStack의 말풍선을 클릭하게 되면
            .onTapGesture {
                showTime.toggle()
            }
            if showTime {
                //formatted 함수를 통해 현재 시간에 접근 가능
                Text("\(message.timestamp.formatted(.dateTime.hour().minute()))")
                    .font(.caption2)
                    .foregroundColor(.gray)
                    .padding(message.received ? .leading : .trailing, 25)
            }
        }
        //누가 보내냐에 따라 왼쪽, 오른쪽 설정
        .frame(maxWidth: .infinity, alignment: message.received ? .leading : .trailing)
        .padding(message.received ? .leading : .trailing)
        //오른쪽의 공간 10만큼의 여백
        .padding(.horizontal, 10)
    }
}

#Preview {
    MessageBubble(message: Message(id: "12345", text: "Ich werde nach Deustchland fliegen", received: true, timestamp: Date()))
}
