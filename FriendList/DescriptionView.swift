//
//  DescriptionView.swift
//  FriendList
//
//  Created by Mohamed Hany on 18/10/2022.
//

import SwiftUI

struct DescriptionView: View {
    let user: User
    
    let columns = [
        GridItem(.adaptive(minimum: 130))
    ]
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView{
                VStack{
                    Image("profilePicture")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.5)
                    
                    HStack{
                        Text(user.name)
                            .font(.largeTitle.bold())
                            .padding(.trailing)
                        Text(user.isActive ? "Active" : "Offline")
                            .font(.title)
                            .foregroundColor(user.isActive ? .green : .red)
                            .padding(.leading)
                    }.padding(.bottom,5)
                    
                    VStack(alignment: .leading) {
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(.gray)
                        
                        Text("Info")
                            .font(.title3.bold())
                            .padding(.bottom, 1)
                        
                        VStack(alignment: .leading){
                            Text("Age: \(user.age)")
                            Text("Company: \(user.company)")
                            Text("Email: \(user.email)")
                            Text("Registered: \(user.registered)")
                            Text("Address: \(user.address)")
                            .padding(.bottom, 1)
                        }
                        
                        Text("About")
                            .font(.title3.bold())
                            .padding(.bottom, 1)
                        
                        VStack(alignment: .leading){
                            Text(user.about)
                            .padding(.bottom, 1)
                        }
                        
                        
                        Text("Tags")
                            .font(.title3.bold())
                            .padding(.bottom, 5)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(user.tags, id: \.self) { tag in
                                    HStack {
                                        Text(tag.self)
                                    }
                                    .padding(.horizontal)
                                    }
                                }
                        }
                        .padding(.bottom, 3)

                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(.gray)
                        
                        Text("Friends")
                            .font(.subheadline.bold())
                            .padding(.bottom, 5)
                        
                        
                        LazyVGrid(columns: columns){
                            ForEach(user.friends, id: \.id) { friend in
                                VStack{
                                    Image("profilePicture")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(maxWidth: geometry.size.width * 0.4)
                                    Text(friend.name)
                                }
                            }
                            .padding(.bottom)
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
    }
}
