//
//  ContentView.swift
//  Moonshot
//
//  Created by Nilesh Rathod on 09/05/23.
//

import SwiftUI

struct ContentView: View {
    
    let astronauts : [String : Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    @State var showGrid = false
    var body: some View {
        
        NavigationView{
            
            ScrollView {
                
                if showGrid {
                    LazyVGrid(columns: columns){
                        
                        ForEach(missions) { mission in
                            
                            NavigationLink {
                                MissionView(mission: mission, astronauts: astronauts)
                            } label: {
                                GridViewItem(mission: mission)
                                
                            }
                        }
                    }
                    .padding([.horizontal,.bottom])
                } else
                {
                    ForEach(missions) { mission in
                        
                        NavigationLink {
                            MissionView(mission: mission, astronauts: astronauts)
                        } label: {
                            ListViewItem(mission: mission)
                            
                        }
                    }
                    .padding([.horizontal,.bottom])
                }
                
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                Button {
                    showGrid.toggle()
                } label: {
                    Text("Switch Layout")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
