//
//  ContentView.swift
//  MyCard-SwiftUI
//
//  Created by Thanh - iOS on 29/06/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var diceeView = false
    
    var body: some View {
        ZStack {
            Color(red: 0.09, green: 0.63, blue: 0.50)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("user")
                    .resizable()
                    .aspectRatio( contentMode: .fit)
                    .frame(width: 150.0, height: 150.0, alignment: .center)
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Color.white, lineWidth: 5)
                    )
                
                Text("Than Van Thanh")
                    .font(Font.custom("Satisfy-Regular", size: 40))
                    .bold()
                .foregroundColor(.white)
                Text("iOS Developer")
                    .foregroundColor(.white)
                    .font(.system(size: 25))
                Divider()
                InfoView(text: "+84 366 360 222", imageName: "phone.fill")
                InfoView(text: "thanvanthanh1909@gmail.com", imageName: "envelope.fill")
                Button(action: {
                    diceeView.toggle()
                    print("aaa")
                }, label: {
                    Text("Dicee")
                        .frame(width: 200, height: 50, alignment: .center)
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(.white, lineWidth: 2)
                        )
                }).sheet(isPresented: $diceeView) {
                    DiceeViews()
                }

            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

