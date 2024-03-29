
import SwiftUI
import Firebase

struct HomeView: View {
    @State var searchQuery = ""
    @State private var FW: [FacilityElement] = FacilityElement.fWalking
    @State var tonext = false
    
    @State private var filteredFacility: [FacilityElement] = FacilityElement.fWalking
    let randomInt = Int.random(in: 1..<30)
    // Log Status
    @AppStorage("log_status") var logStatus: Bool = false
    
    private func performSearch(keyword: String){
        filteredFacility = FW.filter{ Fw in
            Fw.titleEn.contains(keyword)
        }
    }
    
    private var facilitys: [FacilityElement] {
        filteredFacility.isEmpty ? FW: filteredFacility
    }
    var body: some View {
        
        VStack(){

            HStack{
                    Text("Suggested Path")
                        .padding(10)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                        .frame(maxWidth: .infinity,alignment: .leading)
                
                NavigationLink("EN", destination: HomeViewSc().navigationBarBackButtonHidden(true)).padding().disabled(true)
                NavigationLink("繁", destination: HomeViewTc().navigationBarBackButtonHidden(true))
                NavigationLink("简", destination: HomeViewSc().navigationBarBackButtonHidden(true)).padding()
                        

                }
            
            HStack{
                NavigationLink(destination:  DetailView(Fw: FW[randomInt]),isActive: $tonext, label: {
                    Button(action:{
                        tonext = true
                    },label: {
                        AsyncImage(url: URL(string: "\(FW[randomInt].mapURLEn)")){
                            Image in Image
                                .resizable()
                            
                            
                        }placeholder: {
                            
                        }.frame(width: 400,height: 200)
                        
                    })
                })
   
            }
            
            VStack{
                Text("All Routes")
                    .padding(10)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                    .frame(maxWidth: .infinity,alignment: .leading)
                
                List {
                    ForEach(facilitys, id: \.id) { facility in
                        NavigationLink{
                            DetailView(Fw: facility)
                        }label: {
                            
                            AsyncImage(url: URL(string: "\(facility.mapURLEn)")){
                                Image in Image
                                    .resizable()
                            }placeholder: {
                            }.frame(width: 90,height: 90)
                        Text("\(facility.titleEn)")
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

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
