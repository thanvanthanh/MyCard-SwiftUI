//
//  DiceeView.swift
//  MyCard-SwiftUI
//
//  Created by Thanh - iOS on 29/06/2022.
//

import SwiftUI

struct DiceeViews: View {
    @State var leftDiceNumber = 1
    @State var rightDiceNumber = 1
    @State var bottomDiceNumber = 1
    
    
    @State var timer: Timer?
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("diceeLogo")
                Spacer()
                HStack {
                    DiceeView(n: leftDiceNumber)
                    DiceeView(n: rightDiceNumber)
                }
                .padding(.horizontal)
                HStack {
                    
                    DiceeView(n: bottomDiceNumber)
                        .frame(width: 200, height: 200, alignment: .center)
                }
                .padding(.horizontal)
                Spacer()
                VStack {
                    Button {
                        timer = Timer.scheduledTimer(withTimeInterval: 0.33, repeats: true) { (timer) in
                            leftDiceNumber = Int.random(in: 1...6)
                            rightDiceNumber = Int.random(in: 1...6)
                            bottomDiceNumber = Int.random(in: 1...6)
                            
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3), execute: {
                            timer?.invalidate()
                        })
                        
                    } label: {
                        Text("Roll")
                            .font(.system(size: 50))
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                            .padding(.horizontal)
                    }
                .background(.red)
                    Button {
                        dismiss()
                    } label: {
                        Text("Back")
                    }
                }
            }
        }
    }
}

struct DiceeView_Previews: PreviewProvider {
    static var previews: some View {
        DiceeViews()
    }
}

struct DiceeView: View {
    let n: Int
    var body: some View {
        Image("dice\(n)")
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .padding()
    }
}
