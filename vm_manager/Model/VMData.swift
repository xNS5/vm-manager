//
//  VMData.swift
//  vm_manager
//
//  Created by Michael Kennedy on 2/8/22.
//

import Foundation

struct VMData: Identifiable, Codable {
    let id: UUID
    var path: String
    var refresh: Dictionary<String, CGFloat>
    var actions: Dictionary<String, String>
    
    
    init(path: String, refresh: Dictionary<String, CGFloat>, actions: Dictionary<String, String>){
        self.id = UUID()
        self.path = path
        self.refresh = refresh
        self.actions = actions
    }
    
    static let `default` = VMData(path:"~/",refresh:["ms":300000], actions:["GUI":"", "Headless":"", "Kill":""])
}

extension VMData{
    struct VM: Identifiable, Codable{
        let id: UUID
        let name: String
        
        init(name: String){
            self.id = UUID()
            self.name = name
        }
    }

}
