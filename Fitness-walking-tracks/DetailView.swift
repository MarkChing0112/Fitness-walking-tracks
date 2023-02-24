//
//  DetailView.swift
//  Fitness-walking-tracks
//
//  Created by Isaac Lee on 23/2/2023.
//

import SwiftUI

struct DetailView: View {
    
    var Fw: FacilityElement
    
    var body: some View {
        VStack() {
            Text("\(Fw.titleEn) \(Fw.districtEn)").bold()
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(Fw: FacilityElement.sfw)
    }
}
