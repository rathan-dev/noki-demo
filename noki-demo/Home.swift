import SwiftUI

struct Home: View {
    var username: String
    @State private var data: [Player] = UserDefaults.standard.load(forKey: "players") ?? [
        Player(id: 1, name: "John Doe", age: 25),
        Player(id: 2, name: "Jane Smith", age: 22),
        Player(id: 3, name: "Alice Johnson", age: 27)
    ]
    
    @State private var itemText=""
    @State private var showAlert = false
    @State private var showEditSheet = false
    @State private var selectedPlayer: Player?
    @State private var editText=""
    @State private var navigateToDetail=false
    
    var body: some View {
        NavigationStack{
            VStack {
                Text("Hello, \(username)!")
                    .font(.largeTitle)
                    .padding()
                
                TextField("Add item",text: $itemText)
                
                List {
                    ForEach(data) { player in
                        Button(action: {
                            self.selectedPlayer = player
                            self.showAlert = true
                        }){
                            HStack {
                                Image("robot")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                    .clipShape(Circle())
                                Text(player.name)
                            }
                        }
                    }
                    
                }
                Button(action: {
                    addItem()
                }
                ){
                    Text("Add item")
                }
                
            }.actionSheet(isPresented: $showAlert) {
                ActionSheet(
                    title: Text("Options"),
                    message: Text("What would you like to do with \(selectedPlayer?.name ?? "")?"),
                    buttons: [
                        .destructive(Text("Delete")) {
                            if let player = selectedPlayer {
                                delete(player: player)
                            }
                        },
                        .default(Text("Edit")) {
                            self.showEditSheet = true
                        },
                        .default(Text("View Details")) {
                            navigateToDetail=true
                            
                        },
                        .cancel()
                    ]
                )
            }.sheet(isPresented: $showEditSheet) {
                if let player = selectedPlayer {
                    
                    TextField("Name",text:$editText).padding()
                    
                    HStack{
                        Button(action:{
                            updateItem(player:player)
                        }){
                            Text("Save")
                        }
                        Button(action:{
                            self.showEditSheet=false
                        }){
                            Text("Cancel")
                        }
                    }
                    
                }
            } .navigationDestination(isPresented: $navigateToDetail) {
                if let player = selectedPlayer {
                    PlayerDetail(name: player.name, age: player.age)
                }
            }
        }
    }
    func delete(player:Player) {
        if let index=data.firstIndex(where: { $0.id == player.id
        }){
            data.remove(at: index)
            saveData()
        }
        
    }
    
    func addItem(){
        let newPlayer=Player(id: Int.random(in: 10000...99999 ), name: itemText, age: 23)
        data.append(newPlayer)
        itemText=""
        saveData()
        
    }
    
    func updateItem(player:Player){
        if let player = selectedPlayer, let index = data.firstIndex(where: { $0.id == player.id }) {
            data[index].name = editText
            saveData()
        }
        self.showEditSheet=false
        self.editText=""
    }
    
    func saveData() {
        UserDefaults.standard.save(data, forKey:"players")
    }
    
    func loadData() {
        if let savedPlayers:[Player] = UserDefaults.standard.load(forKey: "players") {
            data = savedPlayers
        }
    }
    
}



#Preview {
    Home(username: "Preview User")
}
