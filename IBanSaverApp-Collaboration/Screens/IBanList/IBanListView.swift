//
//  IBanListView.swift
//  IBanSaverApp-Collaboration
//
//  Created by nika razmadze on 14.01.24.
//

import SwiftUI

struct IBanListView: View {
    //MARK: - Properties
    @StateObject var dataSource = PersonDataSource()
    @State private var searchText = ""
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            
            VStack {
                
                TextField("Search", text: $searchText)
                    .textFieldStyle(.roundedBorder)
                    .padding(.all, 10)
                
                List {
                    
                    ForEach(dataSource.getAllPerson().sorted { $0.name < $1.name }.filter { $0.name.contains(searchText) || searchText.isEmpty }, id: \.id) { person in
                        
                        Button(action: {
                            presentDetailsView(person: person)
                        }) {
                            Text(person.name)
                        }
                        .buttonStyle(.plain)
                        
                    }
                }
                .listStyle(.plain)
                
                addPersonButton
                
            }
            .navigationBarTitle("IBan List")
            
        }
    }
    
    //MARK: - Components
    private var addPersonButton: some View {
        //TODO: Add navigation to AddPersonView
        Button(action: {
            
        }) {
            Text("Add New Person")
        }
        .buttonStyle(.borderedProminent)
        .padding(.all, 10)
    }
    
    //MARK: - Methods
    func presentDetailsView(person: Person) {
        let detailsView = IBanDetailsViewRepresentable(person: person)
        let hostingController = UIHostingController(rootView: detailsView)
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        window?.rootViewController?.present(hostingController, animated: true, completion: nil)
    }
}


struct IBanDetailsViewRepresentable: UIViewControllerRepresentable {
    var person: Person
    
    func makeUIViewController(context: Context) -> UIHostingController<IBanDetailsView> {
        return UIHostingController(rootView: IBanDetailsView(person: person))
    }
    
    func updateUIViewController(_ uiViewController: UIHostingController<IBanDetailsView>, context: Context) {}
    
}

#Preview {
    IBanListView()
}
