//
//  UpdateList.swift
//  DesginCode
//
//  Created by Jaime Cadena on 21/12/21.
//

import SwiftUI

struct UpdateList: View {
   var body: some View {
      NavigationView {
         List(updateData) { update  in
            NavigationLink(destination: Text(update.text)) {
               HStack(alignment: .center) {
                  Image(update.image)
                     .resizable()
                     .aspectRatio( contentMode: .fit)
                     .frame(width: 80, height: 80)
                     .background(Color.black)
                     .cornerRadius(20)
                     .padding(.trailing,4)
                  VStack(alignment: .leading, spacing: 8) {
                        Text(update.title)
                           .font(.system(size:20,weight: .ultraLight))
                        Text(update.text)
                           .lineLimit(2)
                           .font(.subheadline)
                           .foregroundColor(Color(#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)))
                        
                        Text(update.date)
                           .font(.system(size: 14,weight: .light))
                           .foregroundColor(.cyan)
                     }

               }
               .padding(.vertical,8)
            }
         }
         .navigationTitle(Text("Updates"))
      }
      
   }
}

struct UpdateList_Previews: PreviewProvider {
    static var previews: some View {
        UpdateList()
    }
}

struct Update: Identifiable {
   var id = UUID()
   var image : String
   var title : String
   var text : String
   var date : String
}

let updateData = [
   Update(image: "Card1", title: "SwiftUI", text: "Text", date: "Jan 1"),
   Update(image: "Card2", title: "Webflow", text: "Design and animate a high converting landing page with advanced interactions, payments and CMS", date: "OCT 17"),
   Update(image: "Card3", title: "ProtoPie", text: "Quickly prototype advanced animations and interactions for mobile and Web.", date: "AUG 27")
]


