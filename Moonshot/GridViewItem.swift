//
//  GridViewItem.swift
//  Moonshot
//
//  Created by Nilesh Rathod on 12/05/23.
//

import SwiftUI

struct GridViewItem: View {
    let mission  : Mission
    var body: some View {
        
        VStack {
            Image(mission.image)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            
            VStack {
                Text(mission.displayName)
                    .font(.headline)
                    .foregroundColor(.white)
                Text(mission.formateddate)
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.5))
            }
            .padding(.vertical)
            .frame(maxWidth: .infinity)
            .background(.lightBackground)
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(.lightBackground)
        }
        
        
    }
}

struct GridViewItem_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")

    static var previews: some View {
        GridViewItem(mission : missions[0])
    }
}
