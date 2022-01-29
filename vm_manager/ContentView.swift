//
//  ContentView.swift
//  vm_manager
//
//  Created by Michael Kennedy on 1/11/22.
//

import SwiftUI

struct ContentView: View {
    @State private var path: String = ""
    @State private var refresh: Int32 = 2000
    @State private var manager = vm_managerApp()
    @State private var maxWidth : CGFloat = 800
    @State private var maxHeight : CGFloat = 500
    @State private var dropdownList = ["Milliseconds (ms)","Seconds (sec)", "Hours (hr)", "Days (day)"]
    
    var body: some View {
        VStack(alignment: .leading) {
            Form {
                HStack(alignment: .center){
                    Text("VM Path")
                        .font(.callout)
                        .bold()
                    TextField(/*@START_MENU_TOKEN@*/"Path"/*@END_MENU_TOKEN@*/, text: $path)
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
                    Menu("Time"){
                        ForEach(dropdownList, id: \.self){ item in
                            Button(item){
                                print(item)
                            }
                            
                        }
                    }
                    .frame(maxWidth: 100)
                }.padding()
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


