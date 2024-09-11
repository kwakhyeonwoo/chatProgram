//
//  MessageManager.swift
//  chatProgram
//
//  Created by 곽현우 on 9/10/24.
//

import Foundation
import FirebaseFirestore
import FirebaseSharedSwift
//import FirebaseFirestoreTarget

class MessageManager: ObservableObject {
    @Published private(set) var message: [Message] = []
    //Firebase에 접근하는 인스턴스
    let db = Firestore.firestore()
    
    init(){
        getMessage()
    }
    
    func getMessage(){
        db.collection("messages").addSnapshotListener { querySnapshot, error in
            guard let document = querySnapshot?.documents else {
                print("DB에서 가져오는데 에러가 났습니다 \(String(describing: error))")
                return
            }
            
            //getMessage()의 클로저 부분이기 때문에 self키워드를 통해서 값을 선언해줘야 한다
            self.message = document.compactMap { document -> Message? in
                do{
                    //문서에서 해당 문서의 데이터를 가져오고 메시지파일에서 모델로 변환시킴
                    return try document.data(as: Message.self)
                } catch{
                   print("Error decoding document into message : \(error)")
                    return nil
                }
            }
            
            //가장 최근에 보낸 메시지 부터 차례대로 정렬 - 우리가 아는 채팅 시간 순서
            self.message.sort { $0.timestamp < $1.timestamp }
        }
    }
}
