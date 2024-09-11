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
