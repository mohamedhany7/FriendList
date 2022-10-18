//
//  ViewModel.swift
//  FriendList
//
//  Created by Mohamed Hany on 18/10/2022.
//

import Foundation

class ViewModel: ObservableObject{
    @Published var users: [User] = []
    
    func fetch(){
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data , error == nil else {
                return
            }
            
            //convert data
            
            do{
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let users = try decoder.decode([User].self, from: data)
                
                DispatchQueue.main.async {
                    self?.users = users
                }
            }
            
            catch{
                print(error)
            }
        }
        task.resume()
    }
}
