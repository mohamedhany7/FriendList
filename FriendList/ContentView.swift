//
//  ContentView.swift
//  FriendList
//
//  Created by Mohamed Hany on 13/10/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView{
            List{
                ForEach(viewModel.users, id: \.id){ user in
                    NavigationLink {
                        DescriptionView(user: user)
                    }label: {
                        HStack{
                            Circle()
                                .frame(width: 20, height: 50, alignment: .leading)
                                .foregroundColor(user.isActive ? .green : .red)
                            Text(user.name)
                                .bold()
                        }
                    }
                }
            }
            .navigationTitle("Users")
            .onAppear{
                viewModel.fetch()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Joke: Codable {
    let value: String
}
