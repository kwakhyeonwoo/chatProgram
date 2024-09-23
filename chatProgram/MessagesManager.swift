//
//  MessageManager.swift
//  chatProgram
//
//  Created by 곽현우 on 9/10/24.
//

import Foundation
import FirebaseFirestore
//import FirebaseSharedSwift
import Firebase
//import FirebaseFirestoreTarget

class MessagesManager: ObservableObject {
    @Published private(set) var messages: [Message] = []
    @Published private(set) var lastMessageId = ""
    //Firebase에 접근하는 인스턴스
    let db = Firestore.firestore()
    
    init(){
        getMessages()
    }
    
    func getMessages(){
        db.collection("messages").addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print("DB에서 가져오는데 에러가 났습니다 \(String(describing: error))")
                return
            }
            
            //getMessage()의 클로저 부분이기 때문에 self키워드를 통해서 값을 선언해줘야 한다
            self.messages = documents.compactMap { document -> Message? in
                do{
                    //문서에서 해당 문서의 데이터를 가져오고 메시지파일에서 모델로 변환시킴
                    return try document.data(as: Message.self)
                } catch{
                   print("Error decoding document into message : \(error)")
                    return nil
                }
            }
            
            //가장 최근에 보낸 메시지 부터 차례대로 정렬 - 우리가 아는 채팅 시간 순서
            self.messages.sort { $0.timestamp < $1.timestamp }
            
            if let id = self.messages.last?.id{
                self.lastMessageId = id
            }
        }
    }
    
    //실시간 메시지 통신
    func sendMessage(text: String){
        do{
            //Swift에서 설정한 임의 id값을 두기 위해 UUID로 설정하고 보내는 사람은 항상 나이기 때문에 received를 false로 설정
            let newMessage = Message(id: "\(UUID())", text: text, received: true, timestamp: Date())
            try db.collection("messages").document().setData(from: newMessage)
            
        } catch{
            print("Firestore에서 에러가 났습니다: \(error)")
        }
    }
}
