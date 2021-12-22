 //
//  UpdateDetail.swift
//  DesginCode
//
//  Created by Jaime Cadena on 21/12/21.
//

import SwiftUI

struct UpdateDetail: View {
   
   var update : Update = updateData[0]
   
    var body: some View {
       ScrollView {
          VStack {
             
             Image(update.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
             Text(update.text)
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.leading, 12)
          }
          .navigationTitle(update.title)
          
       }
    }
}

struct UpdateDetail_Previews: PreviewProvider {
    static var previews: some View {
        UpdateDetail()
    }
}
