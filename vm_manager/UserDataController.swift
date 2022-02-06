//
//  UserDataController.swift
//  vm_manager
//
//  Created by Michael Kennedy on 2/5/22.
//

import Foundation

class UserDataController{
    
    let userDefaults: UserDefaults
    private let pathKey: String = "path"
    private let refreshKey: String = "refresh"
    private let actionsKey: String = "actions"
    
    
    
    init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
    }
    
    
    // Gets the path of the virtual machine directory
    // The assumption is that the VMs live in a single directory and not in separate.
    public func getMachinePath() -> String? {
        return readValue(for: pathKey)
    }
    
    // This function returns a single dictionary element containing one key, value pair
    // The key in this case is the time value (ms, s, min, hr, day) and the value is the refresh interval
    public func getRefresh() -> Dictionary<String, CGFloat>? {
        return readValue(for: refreshKey) ?? nil
    }
    
    
    // This function returns a dictionary containing a key value pair of Strings.
    // These strings correspond to a "name" and an "action".
    public func getActions() -> Dictionary<String, String>?{
        return readValue(for: actionsKey) ?? nil
    }
    
    
    private func saveValue(for keyName: String, value: Any) {
        userDefaults.set(value, forKey: keyName)
    }
    
    private func readValue<T>(for keyName: String) -> T? {
        return userDefaults.value(forKey: keyName) as? T
    }
    
}


