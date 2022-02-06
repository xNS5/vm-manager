//
//  vm_managerApp.swift
//  vm_manager
//
//  Created by Michael Kennedy on 1/11/22.
//

import SwiftUI
import Cocoa

@main
struct vm_managerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    func getDirectory() -> String {
        let dialog = NSOpenPanel()
        var path: String = ""
        
        dialog.title = "Choose a Directory";
        dialog.showsResizeIndicator = false;
        dialog.showsHiddenFiles = false;
        dialog.allowsMultipleSelection = false;
        dialog.canChooseFiles = false;
        dialog.canChooseDirectories = true;
        dialog.resolvesAliases = true;
        
        if(dialog.runModal() == NSApplication.ModalResponse.OK){
            let result = dialog.url;
            
            if(result != nil){
                path = result!.path;
            }
        }
        return path;
    }
    
//    func getDefaults() ->

}

//@main
//class AppDelegate: NSObject, NSApplicationDelegate {
//
//    var statusBar: StatusBarController?
//    var popover = NSPopover.init()
//
//    func applicationDidFinishLaunching(_ aNotification: Notification) {
//        let contentView = ContentView()
//        popover.contentSize = NSSize(width: 360, height: 360)
//        popover.contentViewController = NSHostingController(rootView: contentView)
//        statusBar = StatusBarController.init(popover)
//    }
//
//    func applicationWillTerminate(_ aNotification: Notification) {
//        // Insert code here to tear down your application
//    }
//
//
//}
