//
//  ContentView.swift
//  UI-554
//
//  Created by nyannyan0328 on 2022/05/02.
//

import SwiftUI

struct ContentView: View {
    @State var currentTab : Tab = .BookMark
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        VStack(spacing:0){
            
            TabView(selection: $currentTab) {
                
                Text("A")
                    .fillBG()
                    .tag(Tab.BookMark)
                
                Text("B")
                    .fillBG()
                    .tag(Tab.Camera)
                
                
                Text("C")
                    .fillBG()
                    .tag(Tab.Chat)
                
                Text("D")
                    .fillBG()
                    .tag(Tab.Settings)
                
                Text("E")
                    .fillBG()
                    .tag(Tab.Time)
            }
            
            CustomTabBar(currentTab: $currentTab)
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
extension View{
    
    func fillBG()->some View{
        
        self
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("BG"))
    }
}
enum Tab : String,CaseIterable{
    
    case BookMark = "Bookmark"
    case Camera = "Camera"
    case Chat = "Chat"
    case Settings = "Settings"
    case Time = "Time"
}
