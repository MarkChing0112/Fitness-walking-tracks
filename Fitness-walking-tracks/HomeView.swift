
import SwiftUI
import Firebase

struct HomeView: View {
    
    private var FW: [FacilityElement] = FacilityElement.fWalking
    
    // Log Status
    @AppStorage("log_status") var logStatus: Bool = false

    

    var body: some View {
        //init()
        VStack(){
          
            HStack(){
                
                Text("Fitness Walking Tracks")
                    .padding(10)
                    .fontWeight(.bold)
                    .font(.title)
                //                    Image(systemName: "gear").resizable().aspectRatio( contentMode: .fit).frame(width: 50,height: 50)
                Spacer()
                if logStatus{
                    Button(action:{
                        try? Auth.auth().signOut()
                        logStatus = false},label: {
                        Image(systemName: "rectangle.portrait.and.arrow.forward")
                            .resizable()
                            .aspectRatio( contentMode: .fit)
                            .frame(width: 40,height: 40)
                            .padding(10)
                    })
                    
                }else{
                    Text("Came as Guset")
                }
                
            }
            HStack{

            }
            
            HStack{
                    Text("推薦路線")
                        .padding(10)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                        .frame(maxWidth: .infinity,alignment: .leading)
                }
            
            HStack{
                Button(action:{},label: {
                    Image(systemName: "gear")
                        .resizable()
                        .aspectRatio( contentMode: .fit)
                        .frame(width: 200,height: 200)
                })
            }
            
            VStack{
                Text("全部路線")
                    .padding(10)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                    .frame(maxWidth: .infinity,alignment: .leading)
                
                List {
                    ForEach(FW, id: \.titleEn) { facility in
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
                    
            }
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
