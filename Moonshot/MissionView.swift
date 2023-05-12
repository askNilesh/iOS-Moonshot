//
//  MissionView.swift
//  Moonshot
//
//  Created by Nilesh Rathod on 11/05/23.
//

import SwiftUI

struct MissionView: View {
    struct CrewMember {
        let role: String
        let astronut : Astronaut
        
    }
    let mission : Mission
    let crewMembers : [CrewMember]
    
    var showGrid = true
    var body: some View {
        GeometryReader { geometry in
            
            ScrollView {
                VStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.6)
                        .padding(.top)
                    
                    Text(mission.formateddate)
                    
                    VStack(alignment: .leading){
                        Rectangle()
                             .frame(height: 1)
                             .background(.lightBackground)
                             .padding(.vertical)
                        Text("Missioin Highlights")
                            .font(.title.bold())
                            .padding(.bottom,5)
                        Text(mission.description)
                        Rectangle()
                             .frame(height: 1)
                             .background(.lightBackground)
                             .padding(.vertical)
                        Text("Crew")
                            .font(.title.bold())
                    }
                }.padding(.horizontal)
                
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack {
                        ForEach(crewMembers, id: \.role) { member in
                            NavigationLink {
                                AstronautView(astronaut: member.astronut)
                            } label: {
                                HStack {
                                    Image(member.astronut.id)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 96, height: 96)
                                        .clipShape(RoundedRectangle(cornerRadius: 100))
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 100)
                                                .strokeBorder(.white, lineWidth: 2)
                                        }
                                    
                                    VStack(alignment:.leading){
                                        Text(member.astronut.name)
                                            .foregroundColor(.white)
                                            .font(.headline)
                                        
                                        Text(member.role)
                                            .foregroundColor(.secondary)
                                           
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }
                    }
                }
            }
            .padding(.bottom)
            
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
        
    }
    
    init(mission: Mission, astronauts : [String : Astronaut]) {
        self.mission = mission
        self.crewMembers = mission.crew.map{ member in
            if let astronut = astronauts[member.name] {
                return CrewMember(role: member.role, astronut: astronut)
            } else {
                fatalError("Missing \(member.name)")
            }
            
        }
    }
}

struct MissionView_Previews: PreviewProvider {
    static let astronauts : [String : Astronaut] = Bundle.main.decode("astronauts.json")
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    
    
    static var previews: some View {
        MissionView(mission: missions[0], astronauts: astronauts)
            .preferredColorScheme(.dark)
        
    }
}
