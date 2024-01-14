//
//  IBanDetailsView.swift
//  IBanSaverApp-Collaboration
//
//  Created by nika razmadze on 14.01.24.
//

import SwiftUI
import UIKit

struct IBanDetailsView: View {
    //MARK: - Properties
    let personToDisplay: Person
    @StateObject var viewModel: IBanDetailsViewModel
    @State var isSharing = false
    @State private var selectedIban: String? = nil
    
    
    //MARK: - init
    init(person: Person) {
        self.personToDisplay = person
        self._viewModel = StateObject(wrappedValue: IBanDetailsViewModel(person: person))
    }
    
    //MARK: - Body
    var body: some View {
        NavigationStack {
            
            VStack {
                
                ForEach(viewModel.IBans.keys.sorted(), id: \.self) { bank in
                    
                    Section(header: Text(verbatim: bank)) {
                        
                        ForEach(viewModel.IBans[bank]!, id: \.self) { iban in
                            
                            IBanRow(
                                iban: iban,
                                bank: bank,
                                deleteAction: {
                                    viewModel.deleteIBan(IBan: iban, bank: bank)
                                },
                                shareAction: {
                                    isSharing = true
                                    selectedIban = iban
                                }
                            )
                            
                        }
                    }
                }
                
                addNewIbanButton
                
            }
            .navigationBarTitle(Text(String(personToDisplay.name + " " + personToDisplay.surname)), displayMode: .automatic)
            .sheet(isPresented: $isSharing) {
                if let ibanToShare = selectedIban {
                    ActivityViewController(textToShare: ibanToShare)
                }
            }
        }
        
    }
    
    //MARK: - Components
    private var addNewIbanButton: some View {
        //TODO: Add navigation to addNewIbanView
        Button(action: {
            
        }) {
            Text("Add New IBan")
        }
        .buttonStyle(.borderedProminent)
        .padding(.all, 10)
    }
}

struct ActivityViewController: UIViewControllerRepresentable {
    var textToShare: String
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ActivityViewController>) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: [textToShare], applicationActivities: nil)
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: UIViewControllerRepresentableContext<ActivityViewController>) {}
}


#Preview {
    IBanDetailsView(person: Person(name: "nika", surname: "Razmadze"))
}
