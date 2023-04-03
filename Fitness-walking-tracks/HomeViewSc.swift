
import SwiftUI
import Firebase

struct HomeViewSc: View {
    @State var searchQuery = ""
    @State private var FW: [FacilityElement] = FacilityElement.fWalking
    @State var tonext = false
    
    @State private var filteredFacility: [FacilityElement] = FacilityElement.fWalking
    let randomInt = Int.random(in: 1..<30)
    // Log Status
    @AppStorage("log_status") var logStatus: Bool = false
    
    private func performSearch(keyword: String){
        filteredFacility = FW.filter{ Fw in
            Fw.titleSc.contains(keyword)
        }
    }
    
    private var facilitys: [FacilityElement] {
        filteredFacility.isEmpty ? FW: filteredFacility
    }
    var body: some View {
        
        VStack(){

            HStack{
                    Text("建议路线")
                        .padding(10)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                        .frame(maxWidth: .infinity,alignment: .leading)
                
                NavigationLink("EN", destination: HomeView().navigationBarBackButtonHidden(true)).padding()
                NavigationLink("繁", destination: HomeViewTc().navigationBarBackButtonHidden(true))
                NavigationLink("简", destination: HomeViewSc().navigationBarBackButtonHidden(true)).padding().disabled(true)
                        

                }
            
            HStack{
                NavigationLink(destination:  DetailViewSc(Fw: FW[randomInt]),isActive: $tonext, label: {
                    Button(action:{
                        tonext = true
                    },label: {
                        AsyncImage(url: URL(string: "\(FW[randomInt].mapURLSc)")){
                            Image in Image
                                .resizable()
                            
                            
                        }placeholder: {
                            
                        }.frame(width: 400,height: 200)
                        
                    })
                })
   
            }
            
            VStack{
                Text("所有路线")
                    .padding(10)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                    .frame(maxWidth: .infinity,alignment: .leading)
                
                List {
                    ForEach(facilitys, id: \.id) { facility in
                        NavigationLink{
                            DetailViewSc(Fw: facility)
                        }label: {
                            
                            AsyncImage(url: URL(string: "\(facility.mapURLSc)")){
                                Image in Image
                                    .resizable()
                            }placeholder: {
                            }.frame(width: 90,height: 90)
                        Text("\(facility.titleSc)")
                        }
                    }
                }.scaleEffect(x: 1.2 ,y: 1.029, anchor:.bottom)
                    .searchable(text: $searchQuery)
                    .onChange(of: searchQuery, perform: performSearch)
                    .navigationBarItems( leading:
                                            HStack{Image("runningIcon")
                            .resizable()
                            .frame(width: 40,height: 40)
                    Text("Fitness Walking Tracks")
                            .fontWeight(.bold)
                            .font(.system(size: 20))
                    }
                                         ,trailing: HStack{if logStatus{
                                             Button(action:{
                                                 try? Auth.auth().signOut()
                                                 logStatus = false},label: {
                                                     Image(systemName: "rectangle.portrait.and.arrow.forward")
                                                         .resizable()
                                                         .aspectRatio( contentMode: .fit)
                                                         .frame(width: 30,height: 30)
                                                        
                                                 })
                                             
                                         }else{
                                             Text("Came as Guset")
                                         }
                    }
                    )}
                    
            }
        }
        
    }

struct HomeViewSc_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewSc()
    }
}
