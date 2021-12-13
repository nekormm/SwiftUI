 //
//  ContentView.swift
//  DesginCode
//
//  Created by Jaime Cadena on 9/12/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var show : Bool = false
    @State var viewState = CGSize.zero
    
    
    var body: some View {
        ZStack {
            
            TitleView()
                .blur(radius: show ? 20 : 0)
                .animation(.default)
            
            BackCardView()
                .background(Color.blue)
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x:0, y: show ? -400 : -40)
                .offset(x: self.viewState.width, y: self.viewState.height)
                .scaleEffect(0.9)
                .rotationEffect(.degrees(show ? 0 : 10))
                .rotation3DEffect(.degrees(10), axis: (x: 10.0, y: 0, z: 0))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.5))
            
            BackCardView()
                .background(Color.blue)
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x:0, y: show ? -200 : -20)
                .offset(x: self.viewState.width, y: self.viewState.height)
                .scaleEffect(0.95)
                .rotationEffect(.degrees(show ? 0 : 5))
                .rotation3DEffect(.degrees(5), axis: (x: 10.0, y: 0, z: 0))
                .blendMode(.darken)
                .animation(.easeInOut(duration: 0.3))

            
            CardView()
                .offset(x: self.viewState.width, y: self.viewState.height)
                .animation(.spring(response: 0.3 , dampingFraction: 0.45, blendDuration: 0.4))
                .onTapGesture {
                    self.show.toggle()
                }
                .gesture(
                    DragGesture()
                        .onChanged { value in
                        self.viewState = value.translation
                    }
                        .onEnded { value in
                            self.viewState = .zero
                        }
                )
            
            
            BottonView()
                .blur(radius: show ? 20: 0)
                .animation(.default)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardView: View {
    var body: some View {
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
            .padding(.horizontal, 20)
            .padding(.top, 20)
            Spacer()
            Image("Card5")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 110, alignment: .top)
        }
        .frame(width: 340.0, height: 220.0)
        .background(Color.cyan)
        .cornerRadius(20)
        .shadow(radius: 20)
        
    }
}

struct BackCardView: View {
    var body: some View {
        VStack{
            Spacer()
        }
        .frame(width: 340, height: 220)
        
        
    }
}

struct TitleView: View {
    var body: some View {
        VStack {
            HStack{
                Text("Certificates")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding()
            Image("Card4")
            Spacer()
        }
    }
}

struct BottonView: View {
    var body: some View {
        VStack(spacing : 20) {
            Rectangle()
                .frame(width: 40, height: 5)
                .cornerRadius(3)
                .opacity(0.1)
            
            Text("Este es un mensaje de prueba para el nuevo dialogo pueda presentar contenido dentro del modal.")
                .multilineTextAlignment(.leading)
                .font(.subheadline)
                .lineSpacing(4)
                
            Spacer()
        }
        .padding(.top, 8)
        .padding(.horizontal, 20)
        .background(Color.white)
        .cornerRadius(30)
        .shadow(radius: 20)
        .offset(x:0, y:500)
    }
}
