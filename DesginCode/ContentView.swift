 //
//  ContentView.swift
//  DesginCode
//
//  Created by Jaime Cadena on 9/12/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            
            VStack{
                Spacer()
            }
            .frame(width: 300, height: 220)
            .background(Color.blue)
            .cornerRadius(20)
            .shadow(radius: 20)
            .offset(x:0, y:-20)
            
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Hello, world!")
                            .font(.title)
                        .fontWeight(.semibold)
                        Text("By Nekormm")
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                    }
                    Spacer()
                    Image("Logo1")
                }
                .padding(20)
                Spacer()
                Image("Card5").resizable()
                    .aspectRatio(contentMode: .fill).frame(width: 300, height: 110, alignment: .top)
            }
            .frame(width: 340.0, height: 220.0)
            .background(Color.cyan)
            .cornerRadius(20)
        .shadow(radius: 20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
