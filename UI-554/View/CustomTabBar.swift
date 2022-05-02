//
//  CustomTabBar.swift
//  UI-554
//
//  Created by nyannyan0328 on 2022/05/02.
//

import SwiftUI

struct CustomTabBar: View {
    @Binding var currentTab : Tab
    @State var yOffset : CGFloat = 0
    var body: some View {
        GeometryReader{proxy in
            let size = proxy.size.width
            HStack{
                
                
                ForEach(Tab.allCases,id:\.rawValue){tab in
                    
                    Button {
                        
                        withAnimation{
                            
                            currentTab = tab
                            yOffset = -60
                        }
                        
                        withAnimation(.easeInOut(duration: 0.1).delay(0.3)){
                            
                            yOffset = 0
                        }
                        
                    } label: {
                        
                        Image(tab.rawValue)
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(currentTab == tab ? getColor() : .gray )
                            .frame(width: 30, height: 30)
                            .frame(maxWidth:.infinity)
                            .scaleEffect(currentTab == tab && yOffset != 0 ? 1.5 : 1)
                    }

                }
                
            }
            .frame(maxWidth:.infinity)
            .background(alignment: .leading) {
                
                
                Circle()
                    .fill(Color("Yellow"))
                    .frame(width: 30, height: 30)
                    .offset(x: 10, y: yOffset)
                    .offset(x:indicatorOffset(widht: size))
                
            }
            
            
        }
        .padding(.top,15)
        .padding([.horizontal])
        .frame(height: 50)
    }
    func indicatorOffset(widht : CGFloat)->CGFloat{
        
        let index = CGFloat(getIndex())
        
        if index == 0{return 0}
        
        let buttonWidth = widht / CGFloat(Tab.allCases.count)
        
        return index * buttonWidth
        
        
        
        
    }
    func getIndex() -> Int{
        
        switch currentTab {
        case .BookMark:
            return 0
        case .Camera:
            return 1
        case .Chat:
            return 2
        case .Settings:
          return 3
        case .Time:
          return 4
        }
        
        
    }
    
    func getColor() -> Color{
        
        switch currentTab {
        case .BookMark:
            return .red
        case .Camera:
            return .orange
        case .Chat:
            return .blue
        case .Settings:
            return .brown
        case .Time:
            return .cyan
        }
        
        
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
