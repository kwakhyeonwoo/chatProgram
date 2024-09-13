//
//  MessageField.swift
//  chatProgram
//
//  Created by 곽현우 on 9/10/24.
//

import SwiftUI

struct MessageField: View {
    @EnvironmentObject var messagesManager: MessagesManager
    //message의 값을 초기화 시키고 값이 변함에 따라 Binding된 text가 State의 message로 들어오게 됨
    @State private var messages : String = ""
    var body: some View {
        HStack{
            CustomTextField(placeHolder: Text("메시지를 입력하세요!"), text: $messages)
            
            Button{
                messagesManager.sendMessage(text: messages)
                messages = ""
            } label: {
                Image(systemName: "paperplane.fill")
                    .foregroundColor(.white)
                    .padding(10)
                    .background(Color("Peach"))
                    .cornerRadius(50)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .background(Color("gray"))
        .cornerRadius(50)
        .padding()
    }
}

#Preview {
    MessageField()
        .environmentObject(MessagesManager())
}

struct CustomTextField: View {
    var placeHolder: Text
    @Binding var text: String
    var editingChanged: (Bool) -> () = {_ in}
    var commit : () -> () = {}
    
    var body: some View{
        ZStack(alignment: .leading){
            if text.isEmpty {
                placeHolder
                    .opacity(0.5)
            }
            
            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
        }
    }
}
