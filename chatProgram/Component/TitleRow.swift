//
//  TitleRow.swift
//  chatProgram
//
//  Created by 곽현우 on 9/10/24.
//

import SwiftUI

struct TitleRow: View {
    var imageUrl = URL(string:
        "https://images.unsplash.com/photo-1567532939604-b6b5b0db2604?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWd]fHx8fGVufDB8fHx8")
    var name = "Kim YeIn"
    @State private var imageTap: Bool = false
    
    var body: some View {
        HStack(spacing: 20){
//            AsyncImage(url: imageUrl){ image in
//                image.resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(width: 50, height: 50)
//                    .cornerRadius(50)
//            } placeholder: {
//                ProgressView()
//            }
            Image("photo2")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .cornerRadius(50)
                .onTapGesture {
                    imageTap.toggle()
                }
            
            VStack(alignment: .leading){
                Text(name)
                    .font(.title)
                    .bold()
                
                Text("온라인")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Image(systemName: "phone.fill")
                .foregroundColor(.gray)
                .padding(10)
                .background(.white)
                .cornerRadius(50)
        }
        .padding()
        .fullScreenCover(isPresented: $imageTap){
            FullScreen(imageName: "photo2", imageTap: $imageTap)
        }
    }
}

struct FullScreen : View {
    
    var imageName : String
    @Binding var imageTap: Bool
    
    var body: some View{
        ZStack(alignment: .topTrailing){
            Color.black.ignoresSafeArea()
            Image(imageName)
                .resizable()
                .scaledToFill()
                .onTapGesture {
                    imageTap.toggle()
                }
            
            Button(action: {
                imageTap.toggle()
            }){
                Image(systemName: "xmark")
                    .foregroundColor(.black)
                    .padding()
                    .background(Color.black.opacity(0.7))
                    .clipShape(Circle())
                    .padding()
            }
        }
    }
}

#Preview {
    TitleRow()
        .background(Color("Peach"))
}
