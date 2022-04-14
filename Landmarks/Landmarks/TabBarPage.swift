//
//  TabBarPage.swift
//  Landmarks
//
//  Created by 张斌伟 on 2021/9/6.
//

import SwiftUI

struct TabBarPage: View {
    
    
    @State private var index = 0
    let imgs = ["mine01","mine02","mine03","mine04"]
    let titles = ["首页","心态","美女","我哦"]
    let imgSelect = ["tab_mine","tab_theme","tab_wall"]
    let imgSelectNo = ["tab_mineNo","tab_themeNo","tab_wallNo"]
    var body: some View {
        
        NavigationView {
            TabView(selection: $index) {
                
                //1.创建方式1：循环创建
                ForEach(0..<imgSelect.count) { item in
                    TabItemPage(index: item)
                        .tabItem {
                            //                        Image(self.imgs[item])
                            //                        Image(systemName: "2.square.fill")//系统的
                            Image(index == item ? imgSelect[item] : imgSelectNo[item])
                            Text(self.titles[item])
                            
                        }
                        .tag(item)
                }
                
//                //创建方式2  可以自定义选中颜色选中图标
//                ContentView().tabItem {
//                    Image(index == 0 ? imgSelect[0] : imgSelectNo[0])
//                    Text(self.titles[0])
//                }.tag(0)
//
//                CircleImage().tabItem {
//                    Image(index == 1 ? imgSelect[1] : imgSelectNo[1])
//                    Text(self.titles[1])
//                }.tag(1)
//
//                MapView().tabItem {
//                    Image(index == 2 ? imgSelect[2] : imgSelectNo[2])
//                    Text(self.titles[2])
//                }.tag(2)
                
            }.accentColor(.red)
            .navigationBarTitle(self.titles[index], displayMode: .inline)
               
                }
           
        
    }
}


fileprivate struct TabItemPage:View{
    
    var index:Int
    
    var body: some View{
        
        switch index {
        case 0:
            SwiftUIView()
            
        case 1:
            CircleImage()
        default:
            ContentView()
        }
    }
}


struct TabBarPage_Previews: PreviewProvider {
    static var previews: some View {
        TabBarPage()
    }
}
