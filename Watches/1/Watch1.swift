//
//  Watch1.swift
//  Watches
//
//  Created by Erdem Senol on 9.09.2021.
//

import SwiftUI

struct Watch1: View {
    @State var start = false
    var body: some View {
        VStack {
            ZStack {
                ZStack {
                    Circle()
                        .stroke(Color("3"), lineWidth: 20)
                        .frame(width: 250, height: 250)
                    ForEach(0..<60){
                        Rectangle()
                            .fill(Color.black)
                            .frame(width: 1, height: 8)
                            .offset(y: -125)
                            .rotationEffect(.degrees(Double($0) * 6))
                    }
                    ForEach(0..<12){
                        Rectangle()
                            .fill(Color.black)
                            .frame(width: 3, height: 16)
                            .offset(y: -125)
                            .rotationEffect(.degrees(Double($0) * 30))
                    }
                }
                    
                Circle()
                    .fill(Color.red.opacity(0.05))
                    .frame(width: 200, height: 200)
                    
                Circle()
                    .trim(from: 0, to: start ? 1 : 0)
                    .stroke(
                        LinearGradient(gradient: Gradient(colors: [Color.red.opacity(0.5), Color.red]), startPoint: .leading, endPoint: .trailing),
                        lineWidth: 100)
                    
                    .frame(width: 100, height: 100)
                    .rotationEffect(Angle(degrees: 270))
                ZStack{
                    RoundedRectangle(cornerRadius: 2)
                        .fill(Color.red)
                        .frame(width: 8, height: 120)
                        .rotationEffect(Angle(degrees: start ? 360 : 0), anchor: UnitPoint.bottom)
                        .offset(y: -60)
                        .shadow(color: .red, radius: 10, x: 0.0, y: 0.0)
                    Circle()
                        .fill(Color.white.opacity(0.5))
                        .frame(width: 50, height: 50)
                        .shadow(color: .red, radius: 10, x: 0.0, y: 0.0)
                    Circle()
                        .fill(Color.white)
                        .frame(width: 32, height: 32)
                }
            }
            
            Button(action: {
                    withAnimation(.linear(duration: 60)){
                        start.toggle()
                    }
                
            }, label: {
                Text("GO!")
                    .foregroundColor(.white)
                    .bold()
                    .frame(width: 340, height: 50)
                    .background(Color("1"))
                    .clipShape(Capsule())
            }).padding(.top, 100)
        }

            
    }
}

struct Watch1_Previews: PreviewProvider {
    static var previews: some View {
        Watch1()
    }
}
