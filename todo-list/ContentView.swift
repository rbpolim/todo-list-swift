//
//  ContentView.swift
//  todo-list
//
//  Created by Rodrigo Polim on 14/01/24.
//

import SwiftUI

struct ContentView: View {
    @State var txt: String = ""
    @State var toDos: [String] = []
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack(alignment: .trailing) {
                    TextField(
                        "Item",
                        text: $txt
                    )
                        .padding()
                        .frame(height: 60)
                        .background(Color.gray)
                        .cornerRadius(8)
                        
                    RoundedRectangle(cornerSize: CGSize(width: 8, height: 8))
                        .frame(width: 80, height: 60)
                        .foregroundColor(.blue)
                        .overlay(
                            Text("Add")
                                .foregroundColor(.white)
                                .font(.title3)
                        )
                        .onTapGesture {
                            if (txt.count > 0) {
                                toDos.append(txt)
                                txt = ""
                            }
                        }
                }
                
                List {
                    ForEach(toDos, id: \.self) { item in
                        Text(item)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
