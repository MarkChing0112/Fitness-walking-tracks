//
//  DetailView.swift
//  Fitness-walking-tracks
//
//  Created by Isaac Lee on 23/2/2023.
//

import SwiftUI
import MapKit

struct DetailView: View {
    
    var Fw: FacilityElement
    
    @State private var region = MKCoordinateRegion()
    
    
    var body: some View {

        VStack() {
            
            Map(coordinateRegion: $region, annotationItems: [Fw]){
                Fws in MapMarker(coordinate: CLLocationCoordinate2D(latitude: Fws.latitude, longitude: Fws.longitude))
            }

            
            AsyncImage(url: URL(string: "\(Fw.mapURLEn)")){
                Image in Image
                    .resizable()
                    .clipShape(Circle())
                    .overlay{
                        Circle().stroke(.white, lineWidth: 4)
                    }.offset(y: -160)
                    .padding(.bottom, -130)
                    .shadow(radius: 7)
                    .scaledToFit()
            }placeholder: {
            }.frame(width: 200.0, height: 200.0)
            
            VStack(alignment: .center){
                Text("\(Fw.titleEn) \(Fw.districtEn)")
                    .bold()
                Text("\(Fw.routeEn)")

            }.padding()
            Spacer()
        }.onAppear{self.setRegion(CLLocationCoordinate2D(latitude: Fw.latitude, longitude: Fw.longitude))}
        
    }
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
            region = MKCoordinateRegion(
                center: coordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.4, longitudeDelta: 0.4)
            )
        }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(Fw: FacilityElement.sfw)
    }
}
