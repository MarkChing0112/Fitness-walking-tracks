//
//  CircleImage.swift
//  Fitness-walking-tracks
//
//  Created by Holung Cheng on 19/2/2023.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("testimg")
            .resizable()
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
            .scaledToFit()
            .frame(width: 200.0, height: 200.0)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
