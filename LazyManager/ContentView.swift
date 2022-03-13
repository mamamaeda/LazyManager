//
//  ContentView.swift
//  LazyManager
//
//  Created by Takashi MAEDA on 2022/03/13.
//

import SwiftUI

struct ContentView: View {
    @State var taskName: String = ""
    @State var tasks = [String]()
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Enter new task", text: $taskName)
                        .accessibilityIdentifier("taskNameTextField")
                    
                    Button("Create") {
                        self.tasks.append(self.taskName)
                        self.taskName = ""
                    }
                    .accessibilityIdentifier("addTaskButton")
                }
                List(self.tasks, id: \.self) { name in
                    Text("\(name)")
                }
                Spacer()
            }
            .padding()
            .navigationBarTitle("Tasks")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
