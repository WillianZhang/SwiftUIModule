//
//  ContentView.swift
//  Landmarks
//
//  Created by 张斌伟 on 2021/5/28.
//

import SwiftUI

struct ContentView: View {
    
    let heart = [80,78,55,135,44,90,1314,5]

    var body: some View {
        
        
        VStack
        {
//            Color.purple.edgesIgnoringSafeArea(.all)
            
    

            Text("12:10:09")
                .frame(width: 70, height: 30, alignment: .center)
                .font(.system(size: 20))
                .minimumScaleFactor(0.3)
                .foregroundColor(.white)
                .background(Color.green)
            
            
            Text(Date().getCurrentDayStart(true), style: .timer)
            .frame(width: 200, height: 100)
            .font(.system(size: 20))
            .background(Color.red)
            
            Text(Date().getCurrentDayStart(false), style: .timer)
            .frame(width: 200, height: 100)
            .font(.system(size: 20))
            .background(Color.green)
            
            
            
            Text("Hello World")
                .font(.system(size: 12))
                .padding()
                .background(Color.red)
                .padding()
                .background(Color.blue)
                .padding()
                .background(Color.green)
                .padding()
                .background(Color.pink)
            
            
            
            HStack{
                ForEach(self.heart,id:\.self){ hr in
                    Text(String(hr))
                        .padding(4)
                        .background(Color.purple)
                        .cornerRadius(4)
                }
            }
            
            
      
            
            
            
        }.frame(width: 375, height: 600, alignment: .center)
        .background(Color.yellow)
        

    
   
        
      

        
//
//        Button("Hello World") {
//            // do nothing
//        }
//        .background(Color.red)
//        .frame(width: 200, height: 200)
        
        

        
        
//        VStack{
//
//            Text("我是大帅哥")
//                .font(.system(size: 36))//设置文本视图的字体尺寸为36，增加文字的尺寸。
//                .padding()//设置文本视图的间距，增加文本视图的内边距。
//                .foregroundColor(.white)//接着设置文本的颜色为白色，以突出作为背景存在的线性渐变。
//                //给文本视图添加一个背景，线性渐变将被放入小括号之内。
//                //创建一个线性渐变，起始颜色为橙色，中间颜色为红色，终点颜色为紫色。
//                //渐变的起点位于文本视图的左上角，渐变的终点位于文本视图的右下角。
//                //最后将渐变的起点修改为文本视图的右上角，终点修改为文本视图的左下角，然后对比预览窗口渐变效果的变化。
//                .background(LinearGradient(gradient: Gradient(colors: [.orange, .red, .purple,.green]), startPoint: .topLeading, endPoint: .bottomTrailing))
//
//
//
//            Text("我是大帅哥")//首先修改此处的文本视图，角度渐变将作为文本视图的背景。
//               .font(.system(size: 36))//设置文本视图的字体尺寸为36，增加文字的尺寸。
//               .padding()//设置文本视图的间距，增加文本视图的内边距。
//               .foregroundColor(.black)//接着设置文本的颜色为白色，以突出作为背景存在的角度渐变。
//               //给文本视图添加一个背景，角度渐变将被放入小括号之内。
//               //创建一个角度渐变，起始颜色为橙色，中间颜色为红色，终点颜色为紫色。渐变的中心点位于文本视图的中心位置。
//                .background(AngularGradient(gradient: Gradient(colors: [.orange, .red, .purple]), center: UnitPoint(x: 0.5, y: 0.5), angle: Angle.init(degrees: -45)))
//
//            Text("我是大帅哥")
//                .font(.system(size: 36))
//                .padding()
//                .foregroundColor(.white)
//                .background(AngularGradient(gradient: Gradient(colors: [.orange, .red, .purple]), center: UnitPoint(x: 0.5, y: 0.5), startAngle: Angle.init(degrees: 0), endAngle: Angle.init(degrees: 0)))
//
//            //首先修改此处的文本视图，径向渐变将作为文本视图的背景。
//            Text("SwifUI Gradient")
//                .font(.system(size: 36))//设置文本视图的字体尺寸为36，增加文字的尺寸。
//                .padding()//设置文本视图的间距，增加文本视图的内边距。接着设置文本的颜色为白色，以突出作为背景存在的径向渐变。
//                .foregroundColor(.white)
//                //创建一个径向渐变，设置它的起始颜色为橙色，中间颜色为红色，终点颜色为紫色。渐变中心点为文本视图的中心位置，起点半径为10，终点半径为120。
//                .background(RadialGradient(gradient: Gradient(colors: [.orange, .red, .purple]), center: .init(x: 0.5, y: 0.5), startRadius: CGFloat(10), endRadius: CGFloat(120)))
//
//
//
//        }
        
        
        
     
        

        
    }
    

}

struct MyDetailView:View {
    
    @State var message:String
    
    var body: some View{
        Text(message)
    }
}


struct MyButtonStyle: ViewModifier {
  let isVip: Bool
  
  func body(content: Content) -> some View {
    HStack {
      content
      if isVip {
        Text("Vip")
          .font(.caption).bold()
          .foregroundColor(.white)
          .padding(3)
          .background(Color.orange)
          .cornerRadius(3)
      } else {
        Button {
          // action
        } label: {
          Text("开通会员")
            .font(.caption)
            .foregroundColor(.white)
            .padding(5)
            .background(Color.blue)
            .clipShape(Capsule())
        }
        .buttonStyle(BorderlessButtonStyle())
      }
    }
  }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()

    }
}


extension Date {
    

    
   func getCurrentDayStart(_ isDayOf24Hours: Bool)-> Date {
       let calendar:Calendar = Calendar.current;
       let year = calendar.component(.year, from: self);
       let month = calendar.component(.month, from: self);
       let day = calendar.component(.day, from: self);
//    let hour = calendar.component(.hour, from: self);
//    let minute = calendar.component(.minute, from: self);
//    let second = calendar.component(.second, from: self);
   
    var hour = 0;
    if isDayOf24Hours {
        hour = 0;
    }else{
        hour = 12;
    }
    
    
       let components = DateComponents(year: year, month: month, day: day, hour: hour, minute: 0, second: 0)
       return Calendar.current.date(from: components)!
   }
    
    func getWeekDay(dateTime:String)->String{
         let dateFmt = DateFormatter()
         dateFmt.dateFormat = "yyyy-MM-dd"
         let date = dateFmt.date(from: dateTime)
         let interval = Int(date!.timeIntervalSince1970)
         let days = Int(interval/86400) // 24*60*60
         let weekday = ((days + 5)%7+7)%7
         let weekDays = ["周日","周一","周二","周三","周四","周五","周六"]
         return weekDays[weekday]
     }

}
