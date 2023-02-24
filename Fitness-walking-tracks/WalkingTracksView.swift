//
//  WalkingTracksView.swift
//  Fitness-walking-tracks
//
//  Created by Holung Cheng on 19/2/2023.
//

import SwiftUI

struct WalkingTracksView: View {
    var body: some View {
        VStack {
                   MapView()
                       .ignoresSafeArea(edges: .top)
                       .frame(height: 400)

                   CircleImage()
                       .offset(y: -130)
                       .padding(.bottom, -130)

                   VStack(alignment: .leading) {
                       Text("Turtle Rock")
                           .font(.title)

                       HStack {
                           Text("Joshua Tree National Park")
                           Spacer()
                           Text("California")
                       }
                       .font(.subheadline)
                       .foregroundColor(.secondary)

                       Divider()

                       Text("About Turtle Rock")
                           .font(.title2)
                       Text("Descriptive text goes here.")
                   }
                   .padding()

                   Spacer()
               }
           }
       }


struct WalkingTracksView_Previews: PreviewProvider {
    static var previews: some View {
        WalkingTracksView()
    }
}
