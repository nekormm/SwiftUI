//
//  CourseList.swift
//  DesginCode
//
//  Created by Jaime Cadena on 7/1/22.
//

import SwiftUI

struct CourseList: View {
   
   
   
   var body: some View {
      VStack {
         CourseView()
      }
   }
}

struct CourseList_Previews: PreviewProvider {
   static var previews: some View {
      CourseList()
   }
}

struct CourseView: View {
   @State var show : Bool = false
   
   var body: some View {
      VStack {
         HStack (alignment: .top){
            VStack (alignment: .leading, spacing: 8) {
               Text("SwiftUI Advanced!")
                  .font(.system(size: 24, weight: .bold))
               Text("20 Sections ")
            }.foregroundColor(.white)
            Spacer()
            Image(uiImage: #imageLiteral(resourceName: "fingerprint-2"))
         }
         Spacer()
         Image(uiImage: #imageLiteral(resourceName: "Background1"))
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: .infinity)
            .frame(height: 140, alignment: .top)
      }
      .padding(show ? 30 : 20)
      .padding(.top, show ? 30 : 0)
      .frame(maxWidth: show ? .infinity  : screen.width - 60, maxHeight: show ? .infinity : 280)
      .background(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
      .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
      .shadow(color: Color.white.opacity(0.3), radius: 20, x: 0, y: 20)
      .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
      .onTapGesture {
         self.show.toggle()
      }
      .edgesIgnoringSafeArea(.all)
   }
}
