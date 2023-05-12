//
//  ListVIewItem.swift
//  Moonshot
//
//  Created by Nilesh Rathod on 12/05/23.
//

import SwiftUI

struct ListViewItem: View {
    let mission  : Mission
    var body: some View {
        
        VStack(alignment: .leading) {
            VStack(alignment: .leading){
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 100)
                    .padding(.vertical)
            }.frame(maxWidth: .infinity )
            
            Text(mission.displayName)
                .font(.headline)
                .foregroundColor(.white)
                .padding(.horizontal)
                .padding(.vertical,  5)
            Text(mission.formateddate)
                .font(.caption)
                .foregroundColor(.white.opacity(0.5))
                .padding(.horizontal)
                .padding(.bottom,  5)
          
        }
        .background(.lightBackground)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(.lightBackground)
        }
        .frame(maxWidth: .infinity )
        
        
    }
}

struct ListVIewItem_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")

    static var previews: some View {
        ListViewItem(mission: missions[0])
    }
}
