//
//  DetailView.swift
//  Fitness-walking-tracks
//
//  Created by Isaac Lee on 23/2/2023.
//

import SwiftUI
import MapKit

struct DetailViewTc: View {
  
    var Fw: FacilityElement
    let routeTc = Locale(identifier: "routeTc")
    let routeSc = Locale(identifier: "routesSc")
    
    
    @State private var region = MKCoordinateRegion()
    
    
    var body: some View {

        VStack() {
            Map(coordinateRegion: $region, annotationItems: [Fw]){
                Fws in MapMarker(coordinate: CLLocationCoordinate2D(latitude: Fws.latitude, longitude: Fws.longitude))
            }.ignoresSafeArea(edges: .top)
            .frame(height: 250)

            AsyncImage(url: URL(string: "\(Fw.mapURLTc)")){
                Image in Image
                    .resizable()
                    .clipShape(Circle())
                    .overlay{
                        Circle().stroke(.white, lineWidth: 4)
                    }
                    .offset(y: -130)
                    .padding(.bottom, -140)
                    .shadow(radius: 7)
                    .scaledToFit()
            }
            placeholder: {
            }
//            .frame(width: 200.0, height: 200.0)
            
            VStack(){
                Text("\(Fw.titleTc)")
                    .font(.title)
                    .frame(maxWidth: .infinity, alignment: .center)
                HStack {
                    Spacer()
                    Text("\(Fw.districtTc)")
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                Divider()

           
                Text("資訊")
                    .font(.title2)
                Text("\(Fw.routeTc)")
                    .fixedSize(horizontal: false, vertical: true)
                    .font(.system(size: 15))
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("如何去")
                    .font(.title2)
                Text("\(Fw.howToAccessTc)")
                    .fixedSize(horizontal: false, vertical: true)
                   
                    .font(.system(size: 15))
                    .frame(maxWidth: .infinity, alignment: .leading)
                


            }.padding()
            Spacer()
            
        }.onAppear{self.setRegion(CLLocationCoordinate2D(latitude: Fw.latitude, longitude: Fw.longitude))}
       
    }
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
            region = MKCoordinateRegion(
                center: coordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.009, longitudeDelta: 0.008 )
            )
        }
}

struct DetailViewTc_Previews: PreviewProvider {
    static var previews: some View {
        DetailViewTc(Fw: FacilityElement.sfw)
    }
}
