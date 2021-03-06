//
//  ContentView.swift
//  DesginCode
//
//  Created by Jaime Cadena on 9/12/21.
//

import SwiftUI

struct ContentView: View {
   
   @State var show : Bool = false
   @State var viewState : CGSize = CGSize.zero
   @State var showCard : Bool = false
   @State var bottomState : CGSize = CGSize.zero
   @State var showFullBottomCard : Bool = false
   
   
   var body: some View {
      ZStack {
         
         TitleView()
            .blur(radius: show ? 20 : 0)
            .opacity(showCard ? 0.4 : 1)
            .offset(y: showCard ? -200 : 0)
            .animation(
               Animation
                  .default
                  .delay(0.1)
            )
         
         BackCardView()
            .frame(width: 340, height: 220)
            .background(Color.blue)
            .cornerRadius(20)
            .shadow(radius: 20)
            .offset(x:0, y: show ? -400 : -40)
            .offset(x: self.viewState.width, y: self.viewState.height)
            .offset(y: showCard ? -180 : 0)
            .scaleEffect(showCard ? 1 : 0.9)
            .rotationEffect(.degrees(show ? 0 : 10))
            .rotationEffect(.degrees(showCard ? -10 : 0))
            .rotation3DEffect(.degrees(10), axis: (x: 10.0, y: 0, z: 0))
            .blendMode(.hardLight)
            .animation(.easeInOut(duration: 0.5))
         
         BackCardView()
            .frame(width: 340, height: 220)
            .background(Color.blue)
            .cornerRadius(20)
            .shadow(radius: 20)
            .offset(x:0, y: show ? -200 : -20)
            .offset(x: self.viewState.width, y: self.viewState.height)
            .offset(y: showCard ? -140 : 0)
            .scaleEffect(showCard ? 1 : 0.95)
            .rotationEffect(.degrees(show ? 0 : 5))
            .rotationEffect(.degrees(showCard ? -5 : 0))
            .rotation3DEffect(.degrees(5), axis: (x: 10.0, y: 0, z: 0))
            .blendMode(.darken)
            .animation(.easeInOut(duration: 0.3))
         
         
         CardView()
            .frame(width: showCard ? .infinity : 340.0, height: 220.0)
            .background(Color.cyan)
            .clipShape(RoundedRectangle(cornerRadius: showCard ? 30 : 20, style: .continuous))
            .shadow(radius: 20)
            .offset(x: self.viewState.width, y: self.viewState.height)
            .offset(y: showCard ? -100 : 0)
            .animation(.spring(response: 0.3 , dampingFraction: 0.45, blendDuration: 0.4))
            .onTapGesture {
               self.showCard.toggle()
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
         
         Text("\(bottomState.height)").offset(y: -300)
         
         BottonView(show: $showCard)
            .offset(x:0, y: showCard ? 360 : 1000)
            .offset(y: bottomState.height)
            .blur(radius: show ? 20: 0)
         
            .gesture(
               DragGesture()
                  .onChanged { value in
                     self.bottomState = value.translation
                     
                     if self.showFullBottomCard {
                        self.bottomState.height += -300
                     }
                     
                     if self.bottomState.height < -300{
                        self.bottomState.height = -300
                     }
                  }
                  .onEnded { value in
                     
                     if self.bottomState.height > 100 {
                        self.showCard = false
                     }
                     
                     if (self.bottomState.height < -100  && !self.showFullBottomCard) || (self.bottomState.height < -250 && self.showFullBottomCard) {
                        self.bottomState.height = -300
                        self.showFullBottomCard  = true
                     } else {
                        self.bottomState = .zero
                        self.showFullBottomCard = false
                     }
                     
                  }
            )
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
      
   }
}

struct BackCardView: View {
   var body: some View {
      VStack{
         Spacer()
      }
      
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
   
   @Binding var show : Bool
   
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
         
         HStack(spacing: 20.0) {
            RingView(color1: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), color2: #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), width: 88, height: 88, percent: 78, show: $show)
               .animation(Animation.easeInOut.delay(0.3))
            
            VStack(alignment: .leading, spacing: 8.0) {
               Text("SwiftUI").fontWeight(.bold)
               Text("12 of 12 sections completed\n10 hours spent so far")
                  .font(.footnote)
                  .foregroundColor(.gray)
                  .lineSpacing(4)
            }
            .padding(20)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 10)
         }
         
         
         Spacer()
      }
      .padding(.top, 8)
      .padding(.horizontal, 20)
      .frame(maxWidth: .infinity)
      .background(Color.white)
      .cornerRadius(30)
      .shadow(radius: 20)
      
   }
}
