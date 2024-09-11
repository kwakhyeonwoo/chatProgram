//
//  chatProgramApp.swift
//  chatProgram
//
//  Created by 곽현우 on 9/10/24.
//

import SwiftUI
import Firebase

@main
struct chatProgramApp: App {
    
    //firebase 초기화 과정 
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
