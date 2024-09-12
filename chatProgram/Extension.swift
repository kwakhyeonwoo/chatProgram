//
//  Extension.swift
//  chatProgram
//
//  Created by 곽현우 on 9/10/24.
//

import Foundation
import SwiftUI

extension View {
    //cornerRadius에 변경을 추가할 수 있음, 또한 모서리 변경을 선택할 수 있음 
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners) )
    }
    
    
}

struct RoundedCorner: Shape{
    var radius : CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
    
}

////외부 공간 클릭시 키보드 내려감 UIKit부분
//struct KeyBoardDismissViewMainUserView : UIViewRepresentable{
//    func makeUIView(context: Context) -> UIView {
//        let view = UIView()
//        let tapGesture = UITapGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.dismissKeyboard))
//        view.addGestureRecognizer(tapGesture)
//        return view
//    }
//    
//    func updateUIView(_ uiView: UIView, context: Context) {}
//    
//    func makeCoordinator() -> Coordinator {
//        return Coordinator()
//    }
//    
//    class Coordinator{
//        @objc func dismissKeyboard(){
//            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
//        }
//    }
//}
