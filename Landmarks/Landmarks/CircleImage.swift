//
//  CircleImage.swift
//  Landmarks
//
//  Created by 张斌伟 on 2021/5/28.
//

import SwiftUI

struct CircleImage: View {
    
    @State private var tapCount = 0
    @State private var name = ""
    
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = 0

    
    var body: some View {
        
        
        VStack{
            
            Image("turtlerock")
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(Color.green,lineWidth: 4)
                )
                .shadow(radius: 10)

//            Form {
//                Section {
//                    Text("Hello World")
//                }
//
//                Section{
//                    TextField("Enter your name", text: $name)
//                        .keyboardType(.decimalPad)
//                    Text("Hello World\(name)")
//                }
//            }
            
            
            Section(header:Text("How much tip do you want to leave?")) {
                Picker("Select your student", selection: $selectedStudent) {
                    ForEach(0 ..< students.count) {
                        Text(self.students[$0])
                    }
                }
                Text("You chose: Student # \(students[selectedStudent])")
            }
            
       
            
        

           
        }.padding()
        
        
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
