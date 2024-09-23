//
//  FirstPage.swift
//  chatProgram
//
//  Created by 곽현우 on 9/20/24.
//

import SwiftUI

struct FirstPage: View {
    var body: some View {
        NavigationStack{
            VStack{
                TabView{
                    NavigationLink(destination: ContentView()){
                        Image(systemName: "message.fill")
                    }
                }
            }
        }
    }
}

#Preview {
    FirstPage()
}
