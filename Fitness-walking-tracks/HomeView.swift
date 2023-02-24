
import SwiftUI
import Firebase

struct HomeView: View {
    
    private var FW: [FacilityElement] = FacilityElement.fWalking
    
    // Log Status
    @AppStorage("log_status") var logStatus: Bool = false

    
//    let item = Bundle.main.decode([FacilityElement].self, from:"facillity-fw.json")
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
//                TextField("Search...",text: $text)
//                    .padding(7)
//                    .padding(.horizontal,25)
//                    .shadow(color: .black, radius: 10)
//                    .background(Color(.systemGray3))
//
//                    .cornerRadius(8)
//                    .padding(.horizontal,10)
//                    .onTapGesture {
//                        self.Search = true
//                    }
//                if Search{
//                    Button(action:{
//                        self.Search = false
//                        self.text = ""
//                    })
//                    {
//                        Text("Cancel")
//                    }
//                    .padding(.trailing, 10)
//                    .transition(.move(edge: .trailing))
//                }
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
            HStack{
                Text("全部路線")
                    .padding(10)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                    .frame(maxWidth: .infinity,alignment: .leading)
                
                NavigationView {
                    List{
                        ForEach(FW, id: \.titleEn) { facility in
                            NavigationLink("", destination: DetailView(Fw: facility))
                            VStack(alignment: .leading) {
                                Text("\(facility.titleEn)")
                            }
                            
                            //Text("\(facility.titleEn)")
                        }
                    }
                }
            }

            
//            NavigationStack{
//                List{
//                    ForEach(menu) {section in Text(Section.name)
//
//                        ForEach(section.item) {item in ItemRow(item:item)}
//                    }
//                }
//                .navigationTitle("Hello")
//            }
        
                
            
        }

       
        VStack(spacing: 20){
            if logStatus{
                Text("Logged In")
                
                Button("Loggout") {
                    try? Auth.auth().signOut()
                    logStatus = false
                }
                
            }else{
                Text("Came as Guset")
            }
            
        }
        .navigationBarBackButtonHidden(false)
        .navigationTitle("Home")
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
