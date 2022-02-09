//
//  ContentView.swift
//  vm_manager
//
//  Created by Michael Kennedy on 1/11/22.
//

import SwiftUI

struct ContentView: View {
    @Environment private var modelData = VMData.default
    @Environment private var dataController = UserDataController()
    @State private var manager = vm_managerApp()
    @State private var refresh: Int32 = 2000
    @State private var maxWidth : CGFloat = 800
    @State private var maxHeight : CGFloat = 400
    @State private var currSelected = "";
    
    var body: some View {
        VStack(alignment: .leading) {
            Form {
                HStack(alignment: .center){
                    Text("VM Path")
                        .font(.callout)
                        .bold()
                    TextField(/*@START_MENU_TOKEN@*/"Path"/*@END_MENU_TOKEN@*/, text: "Test")
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .accessibilityLabel("Virtual Machine Directory Path")
                    Button("Browse") {
                        path = manager.getDirectory()
                        print(path)
                    }
                }.padding()
                HStack(alignment: .center){
                    Text("Refresh Rate")
                        .font(.callout)
                        .bold()
                    TextField("", value: $refresh, formatter: NumberFormatter())
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .minimumScaleFactor(1.01)
                        .frame(maxWidth: 200, minHeight: 30, maxHeight: 30)
                    Menu(( self.currSelected.count > 0 ? self.currSelected : "Time")){
                        ForEach(dropdownList, id: \.self){ item in
                            Button(item){
                               print(item)
                               self.currSelected = item;
                            }
                        }
                    }
                    .frame(maxWidth: 150)
                }.padding()
                Section{
    
                    ForEach(actions.sorted(by: >), id: \.key){ key, action in
                        HStack(alignment: .center, spacing: 6){
                            Section(header: Text(key)){
                                Text(action)
                            }
                        }
                    }
                }
            }
            .frame(maxWidth: maxWidth, maxHeight: maxHeight)
        }
        .padding()
    }
    

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


