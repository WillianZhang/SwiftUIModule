//
//  SwiftUIView.swift
//  Landmarks
//
//  Created by 张斌伟 on 2021/11/2.
//

import SwiftUI

//定义方法都大同小异。
struct MyProgressViewStyle:ProgressViewStyle{
    let foregroundColor:Color
    let backgroundColor:Color
    init(foregroundColor:Color = .blue,backgroundColor:Color = .orange){
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
    }
    func makeBody(configuration: Configuration) -> some View {
        GeometryReader{ proxy in
            ZStack(alignment:.topLeading){
                Color.green
            Rectangle()
                .fill(foregroundColor)
                .frame(width:proxy.size.width * CGFloat(configuration.fractionCompleted ?? 0.0))
            }.clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay(
                    configuration.label
                        .foregroundColor(.white)
            )
        }
    }
}

struct DarkBlueShadowProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
//        ProgressView(configuration)
        
        GeometryReader{ proxy in
            ZStack(alignment:.leading){
                configuration.label
                    .foregroundColor(Color.pink)
                
                Rectangle()
                    .fill(Color.blue)
                    .frame(width:proxy.size.width * CGFloat(configuration.fractionCompleted ?? 0.0))
                    .clipShape(RoundedRectangle(cornerRadius: 6))
                //                .trim(from: 0.0, to: CGFloat(configuration.fractionCompleted ?? 0))
                //                .stroke(style: StrokeStyle(lineWidth: 50, lineCap:.square , lineJoin: .round))
//                    .foregroundColor(Color.pink)
                //                .frame(width: 200, height: 50, alignment: .center)
                //            .shadow(color: Color(red: 0, green: 0, blue: 0.6),
                //                    radius: 4.0, x: 1.0, y: 2.0)
            }
        }
    }
}
//圆环  aaaaa
struct CirclerPercentProgressViewStyle: ProgressViewStyle {
    public func makeBody(configuration: LinearProgressViewStyle.Configuration) -> some View {
        VStack {
            configuration.label
                .foregroundColor(Color.pink)
            
            ZStack {
                Circle()
                    .stroke(lineWidth: 30.0)
//                    .opacity(0.3)
//                    .foregroundColor(Color.accentColor.opacity(0.5))
                    .foregroundColor(Color.yellow)
                
                Circle()
                    .trim(from: 0.0, to: CGFloat(configuration.fractionCompleted ?? 0))
                    .stroke(style: StrokeStyle(lineWidth: 30, lineCap:.butt , lineJoin: .round))
                    .foregroundColor(Color.accentColor)
                    .rotationEffect(Angle(degrees: -90))//逆时针90度
                
                Text("\(Int((configuration.fractionCompleted ?? 0) * 100)) %")
                    .font(.headline)
                    .foregroundColor(Color.secondary)
            }
        }
    }
}

class TextLimiter: ObservableObject {
    private let limit: Int
    init(limit: Int) {
        self.limit = limit
    }
    @Published var value = "" {
        didSet {
            
           
            
            if value.count > self.limit {
                value = String(value.prefix(self.limit))
                self.hasReachedLimit = true
                self.ccc = value;
                print("🌹\(value)")
            }
            else {
                self.hasReachedLimit = false
                self.ccc = value;
            }

            
        }
    }
    @Published var hasReachedLimit = false
    @Published var ccc = ""
    
}


struct SwiftUIView: View {
    
    let columns = [GridItem](repeating: .init(), count: WeekNames.count)
    @State var a:String = ""
    
    @ObservedObject var input = TextLimiter(limit: 5)
    
    var abc = ["第1课","第2课","第3课","第4课"]
    @State private var selectitem = 0 //默认选择
    
    @State var isModalView = false
    
    @State private var doubleAmount = 0.0
    
    var body: some View {
        
        
        
        VStack{
            
            ZStack {
                      Circle()
                          .stroke(Color(#colorLiteral(red: 0.7762585282, green: 0.7716453075, blue: 0.7798054218, alpha: 0.3909460616)),
                                  style: StrokeStyle(lineWidth: 5))
                          .frame(width: 44, height: 44)
                      
                      Circle()
                          .trim(from: 0.8, to: 1)
                          .stroke(
                              LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing),
                              style: StrokeStyle(lineWidth: 5)
                      )
                          .rotationEffect(Angle(degrees: 90))
                      .rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y: 0, z: 0))
                          .frame(width: 44, height: 44)
                          .shadow(color: Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)).opacity(0.1), radius: 3, x: 0, y: 3)
                      
                      Text("80%")
                          .font(.caption)
                          .fontWeight(.bold)
                  }
            
            
            ProgressView("工程进度",value: doubleAmount, total: 100)
                            .progressViewStyle(MyProgressViewStyle())
                            .frame(width: 300, height: 50,alignment: .center)
            
            ProgressView("Downloading...", value:doubleAmount,total:100)
                .progressViewStyle(DarkBlueShadowProgressViewStyle())
                .frame(width: 300, height: 50,alignment: .center)
                .padding()
            
            VStack {
                ProgressView("Downloading...", value:doubleAmount,total:100)
                    .progressViewStyle(CirclerPercentProgressViewStyle())
                    .frame(width: 120, height: 120,alignment: .center)
                    .padding()
                
                Button(action: {
                    withAnimation {
                        if doubleAmount < 100 {
                            doubleAmount += 10
                        }
                        
                    }
                },label: {
                    Text("+10%")
                })
                
                Button(action: {
                    withAnimation {
                        if doubleAmount >= 10 {
                            doubleAmount -= 10
                        }
                        
                    }
                },label: {
                    Text("-10%")
                })
                
            }
//            .navigationBarTitle("ProgressView",displayMode: .inline)
            
//            Text("点击跳出ModalView窗口")
//                          .onTapGesture {
//                              self.isModalView.toggle()
//                      }
//                      .sheet(isPresented: $isModalView) {
//                          Text("新窗口")
//                      }
            
            
            
            Picker("选择背景颜色", selection: $selectitem) {
                ForEach(abc, id: \.self) {
                    Text($0)
                        .frame(maxWidth:.infinity,alignment: .leading)
                        
                }
            }.pickerStyle(.inline)
              
              
            
            Picker(selection: $selectitem, label: Text("哈哈")) {
                ForEach(0..<abc.count){
                    Text(self.abc[$0])
                        .font(.system(size: 18))
                }
            }.pickerStyle(.menu)
             
            
            Picker(selection: $selectitem, label: Text("选择课程")) {
                                ForEach(abc.indices , id: \.self){ i in
                                    Text(self.abc[i])
                                        .font(.system(size: 18))
                                }
                
//                ForEach(0..<abc.count){ i in
//                    Text(self.abc[i])
//                        .font(.system(size: 18))
//                }
                
            }.pickerStyle(.segmented)
//                .pickerStyle(.inline)
            //                .pickerStyle(.automatic)
            
            
            Text("当前选择的课程是: \(self.abc[selectitem])")
                .background(Color("ColorDefault"))
                .border(Color.red)
        }
        


//                GeometryReader{ geo in
//
//
//                    VStack(spacing: 20){
//                        TextField("Text Input",text: $input.value)
//                                    .border(Color.red,width: $input.hasReachedLimit.wrappedValue ? 1 : 0 )
//
//
//
//                        TextField("x", text: $input.value)
//                        .frame(width: 150, height: 35) //尺寸
//                        .textFieldStyle(RoundedBorderTextFieldStyle()) // 圆角描边
//                        .keyboardType(.numberPad) //将键盘更改为数字模式
//                        .border(Color.red)
//
//
//
//
//
////                        TextField("请您输入密码", text: $a).onEditingChanged{
////
////                        }
//
//
//
////                        TextField("请您输入密码",text: $a , onEditingChanged: { (obj) in
////                            print("🐯\(obj)")
////                            print("🐯\(a)")
////                        }){
////                            print("🌹\(a)")
////                        }.frame(width: 150, height: 35) //尺寸
////                            .textFieldStyle(RoundedBorderTextFieldStyle()) // 圆角描边
////                            .keyboardType(.numberPad) //将键盘更改为数字模式
////                            .border(Color.red)
//
//                    }
//
//
//
//                }
        
        

       
                
        
        
        //03年10月29天
//        GeometryReader{ geo in
//
//            ZStack{
//
//                VStack{
//                    let image = UIImage(named: "aaa")
//                    Image(uiImage: image!)
//                        .resizable()
//                }.frame(width: 170, height: 170, alignment: .center)
//
//
//                VStack{
//
//
//                    Text("我们在一起")
//                        .frame(width: 100, height: 22, alignment: .center)
//
//                        .font(.system(size: 16))
////                        .offset(y: 8)
////                        .padding(.bottom, 8)
//
//
//                    HStack{
//
//
//                        HStack{
//
//                            Text("03")
//                                .frame(width: 38, height: 42, alignment: .center)
//                                .font(.system(size: 30, weight: .semibold, design: .default))
//                            //                            .font(.custom("HelloFont WenYiHei", size: 50))
//                                .minimumScaleFactor(0.3)
//                                .offset(x: 3)
//
//                            Text("年")
//                                .frame(width: 12, height: 17, alignment:.center)
//                                .font(.system(size: 12))
//                                .offset(x: -5, y:5)
//
//                        }.offset(x: 15)
//
//                        HStack{
//
//                            Text("10")
//                                .frame(width: 38, height: 42, alignment: .center)
//                                .font(.system(size: 30, weight: .semibold, design: .default))
//    //                            .font(.custom("HelloFont WenYiHei", size: 50))
//                                .minimumScaleFactor(0.3)
//                                .offset(x: 3)
//
//                            Text("月")
//                                .frame(width: 12, height: 17, alignment:.center)
//                                .font(.system(size: 12))
//                                .offset(x: -5, y:5)
//
//                        }.padding(0)
//
//
//                        HStack{
//
//                            Text("29")
//                                .frame(width: 38, height: 42, alignment: .center)
//                                .font(.system(size: 30, weight: .semibold, design: .default))
//    //                            .font(.custom("HelloFont WenYiHei", size: 50))
//                                .minimumScaleFactor(0.3)
//                                .offset(x: 3)
//
//                            Text("天")
//                                .frame(width: 12, height: 17, alignment:.center)
//                                .font(.system(size: 12))
//                                .offset(x: -5, y:5)
//
//                        }.offset(x: -15)
//
//
//
//
//
//
//
//                    }
//
//                }
//                .foregroundColor(Color.white)
//
//            }
//            .frame(width: 170, height: 170, alignment: .center)
//            .padding(10)
//
//
//
//        }

        
//        Mr.章&Ms.穆
//        GeometryReader{ geo in
//
//            ZStack{
//
//                VStack{
//                    let image = UIImage(named: "aaa")
//                    Image(uiImage: image!)
//                        .resizable()
//                }.frame(width: 170, height: 170, alignment: .center)
//
//
//                VStack{
//
//                    Text("345")
//                        .frame(width: 150, height: 70, alignment: .leading)
//
//                        .font(.custom("HelloFont WenYiHei", size: 50))
//                        .offset(y: 10)
//
//                    Text("Mr.章&Ms.穆")
//                        .frame(width: 150, height: 22, alignment: .leading)
//
//                        .font(.system(size: 16))
////                        .offset(y: 8)
////                        .padding(.bottom, 8)
//
//
//
//                    Text("Friday")
//                        .frame(width: 150, height: 22, alignment:.leading)
//
//                        .font(.system(size: 16))
//                        .offset(y: -10)
//
//
//                    Spacer();
//                }
//                .foregroundColor(Color.white)
//
//            }
//            .frame(width: 170, height: 170, alignment: .center)
//            .padding(10)
//
//
//
//        }
        
        
        
//我们在一起
//        GeometryReader{ geo in
//
//            ZStack{
//
//                VStack{
//                    let image = UIImage(named: "aaa")
//                    Image(uiImage: image!)
//                        .resizable()
//                }.frame(width: 170, height: 170, alignment: .center)
//
//
//                VStack{
//
//                    Text("我们在一起")
//                        .frame(width: 100, height: 22, alignment: .center)
//                        .foregroundColor(Color.white)
//                        .font(.system(size: 16, weight: .medium, design: .default))
//                        .offset(y: 8)
////                        .padding(.bottom, 8)
//
//                    Text("345")
//                        .frame(width: 150, height: 70, alignment: .center)
//                        .foregroundColor(Color.white)
//                        .font(.system(size: 50, weight: .semibold, design: .default))
//
//
////                    Rectangle()
////                        .stroke(style: StrokeStyle(lineWidth: 1, dash: [10]))
////                        .foregroundColor(Color(UIColor.blue))
//////                        .fill(Color.white)
////                        .frame(width: 133, height: 1, alignment: .center)
//
//
//                    Text("2021-11-04")
//                        .frame(width: 100, height: 22, alignment: .center)
//                        .foregroundColor(Color.white)
//                        .font(.system(size: 16, weight: .regular, design: .default))
//
//
//                }
//
//            }
//            .frame(width: 170, height: 170, alignment: .center)
//            .padding(10)
//
//
//
//        }
        
        
        
//倒计时小
//        GeometryReader{ geo in
//
//            ZStack{
//
//                VStack{
//                    let image = UIImage(named: "aaa")
//                    Image(uiImage: image!)
//                        .resizable()
//                }.frame(width: 170, height: 170, alignment: .center)
//
//
//                VStack{
//
//                    Text("高考倒计时")
//                        .frame(width: 100, height: 22, alignment: .center)
//                        .foregroundColor(Color.white)
//                        .font(.system(size: 16, weight: .medium, design: .default))
//                        .offset(y: -8)
////                        .padding(.bottom, 8)
//
//
//
//                    HStack{
//
//                        Spacer()
//
//                        VStack{
//                            Text("年")
//                                .foregroundColor(Color.white)
//                                .font(.system(size: 12))
//
//                            ZStack{
//                                    VStack{
//
//                                    }.frame(width: 34, height: 36, alignment: .center)
//                                    .background(Color.white)
//                                    .cornerRadius(5)
//                                    .opacity(0.3)
//
//                                    Text("03")
//                                        .foregroundColor(Color.white)
//                                        .font(.system(size: 30, weight: .semibold, design: .default))
//
//                            }.frame(width: 40, height: 42, alignment: .center)
//
//                        }
//
//                        Spacer()
//
//                        VStack{
//                            Text("月")
//                                .foregroundColor(Color.white)
//                                .font(.system(size: 12))
//
//                            ZStack{
//                                    VStack{
//
//                                    }.frame(width: 34, height: 36, alignment: .center)
//                                    .background(Color.white)
//                                    .cornerRadius(5)
//                                    .opacity(0.3)
//
//                                    Text("10")
//                                        .foregroundColor(Color.white)
//                                        .font(.system(size: 30, weight: .semibold, design: .default))
//
//                            }.frame(width: 40, height: 42, alignment: .center)
//
//                        }
//
//                        Spacer()
//
//                        VStack{
//                            Text("天")
//                                .foregroundColor(Color.white)
//                                .font(.system(size: 12))
//
//                            ZStack{
//
//                                    VStack{
//
//
//                                    }.frame(width: 34, height: 36, alignment: .center)
//                                    .background(Color.white)
//                                    .cornerRadius(5)
//                                    .opacity(0.3)
//
//                                    Text("29")
//                                        .foregroundColor(Color.white)
//                                        .font(.system(size: 30, weight: .semibold, design: .default))
//
//                                }.frame(width: 40, height: 42, alignment: .center)
//
//                        }
//
//                        Spacer()
//
//
//                    }
//                    .offset(y: 8)
//
//                }
//
//            }
//            .frame(width: 170, height: 170, alignment: .center)
//            .padding(10)
//
//
//
//        }
        
        
    
        
        
        
        
        
        
        
        
        
        
        
        
        
//        GeometryReader{ geo in
//            
//            ZStack{
//                
//                VStack{
//                    let image = UIImage(named: "aaa")
//                    Image(uiImage: image!)
//                        .resizable()
//                }.frame(width: 170, height: 170, alignment: .center)
//                
//                
//                VStack(content: {
//                    LazyVGrid(columns: [GridItem()], alignment: .leading) {
//                        Text(MiniCalHelper.monthName)
//                            .foregroundColor(.red)
//                            .font(.caption)
//                            .fontWeight(.black)
//                    }
//                    
//                    LazyVGrid(columns: columns) {
//                        ForEach((0...6), id: \.self) {
//                            Text(WeekNames[$0])
//                                .foregroundColor($0 == 0 || $0 == 6 ? .gray : .primary)
//                                .fontWeight(.black)
//                                .frame(width:15,height:15)
//                                .minimumScaleFactor(0.1)
//                        }
//                    }
//                    
//                    LazyVGrid(columns: columns, spacing: MiniCalHelper.countOfItems > 35 ? 1:3) {
//                        ForEach((0..<MiniCalHelper.countOfItems), id: \.self) {
//                            let color: Color = $0 % 7 == 0 || $0 % 7 == 6 ? .gray: .primary
//                            let isToday = $0 == MiniCalHelper.indexOfToday
//                            let foregroundColor: Color = isToday ? .white : color
//                            let text = MiniCalHelper.items[$0]
//                            ZStack(content: {
//                                if isToday {
//                                    Circle()
//                                        .frame(width:18,height:18)
//                                        .foregroundColor(.red)
//                                }
//                                Text(text)
//                                    .fontWeight(.bold)
//                                    .frame(width:20,height:20)
//                                    .foregroundColor(foregroundColor)
//                                    .minimumScaleFactor(0.1)
//                                    
//                            })
//                        }
//                    }
//                    
//                })
//                    .frame(width: 170, height: 170, alignment: .center)
//                    .padding()
//                
//             
//                
//            }
//            
//            
//        }
    }
}


struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
