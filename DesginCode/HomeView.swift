//
//  HomeView.swift
//  DesginCode
//
//  Created by Jaime Cadena on 15/12/21.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var showProfile : Bool
    
    var body: some View {
        VStack {
            
            HStack {
                Text("Watching")
                    .font(.system(size: 28 , weight: .bold))
                    .foregroundColor(Color.black )
                
                Spacer()
                
                AvatarView(showProfile: $showProfile)
            }
            .padding(.horizontal)
            .padding(.leading, 14)
            .padding(.top , 30)
            
            
            ScrollView (.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(sectionData) { item in
                        SectionView(section: item)
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

