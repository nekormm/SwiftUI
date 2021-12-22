//
//  HomeView.swift
//  DesginCode
//
//  Created by Jaime Cadena on 15/12/21.
//

import SwiftUI

struct HomeView: View {
   
   @Binding var showProfile : Bool
   @State var showUpdate : Bool =  false
   
   var body: some View {
      VStack {
         
         HStack {
            Text("Watching")
               .font(.system(size: 28 , weight: .bold))
               .foregroundColor(Color.black )
            
            Spacer()
            
            AvatarView(showProfile: $showProfile)
            
            Button(action: {self.showUpdate.toggle()}) {
               Image(systemName: "bell")
                  .renderingMode(.original)
                  .font(.system(size: 16, weight: .medium))
                  .frame(width: 36, height: 36)
                  .background(Color.white)
                  .clipShape(Circle())
                  .shadow(color: .black.opacity(0.1), radius:1, x:0, y:1)
                  .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 10)
                  
            }
            .sheet(isPresented: $showUpdate) {
               UpdateList()
            }
         }
         .padding(.horizontal)
         .padding(.leading, 14)
         .padding(.top , 30)
         
         
         ScrollView (.horizontal, showsIndicators: false) {
            HStack {
               ForEach(sectionData) { item in
                  
                  GeometryReader { geometry in
                     SectionView(section: item)
                        .rotation3DEffect(Angle( degrees:
                                                   Double(geometry.frame(in: .global).minX - 30 )/20
                                                 
                                               ), axis: (x: 0, y: -10, z: 0))
                  }
                  .frame(width: 300, height: 300)
                  
               }
            }
            .padding(30)
            .padding(.bottom, 30)
         }
         
         Spacer()
      }
   }
}

struct HomeView_Previews: PreviewProvider {
   static var previews: some View {
      HomeView(showProfile: .constant(false))
   }
}

struct SectionView: View {
   
   var section : Section
   
   var body: some View {
      VStack {
         HStack(alignment: .top) {
            Text(section.title)
               .font(.system(size: 24, weight: .semibold))
               .frame(width: 160, alignment: .leading)
            
            Spacer()
            
            Image(section.logo)
            
         }
         
         Text(section.text)
            .frame(maxWidth: .infinity, alignment: .leading)
         
         section.image
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 210)
      }
      .padding(.top, 20)
      .padding(.horizontal, 20)
      .frame(width: 275, height: 275)
      .background(section.color)
      .cornerRadius(30)
      .shadow(color: section.color.opacity(0.5), radius: 20, x: 0, y: 20)
   }
}


struct Section:Identifiable {
   
   var id = UUID()
   var title : String
   var text : String
   var logo : String
   var image : Image
   var color : Color
   
}

let sectionData = [
   Section(title: "Options available", text: "18 options", logo: "Logo1", image: Image("Card6"), color: Color("card1")),
   Section(title: "Options Not available", text: "3 options", logo: "Logo1", image: Image(uiImage: #imageLiteral(resourceName: "Card3")), color: Color(#colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)))
]

