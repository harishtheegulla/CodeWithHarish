//
//  ViewService.swift
//  SOLIDPrinciples
//
//  Created by Harish on 2023-07-12.
//

import Foundation

protocol CommentViewServiceDelegate : CommentsDelegate,UsersDelegate{
    
}
protocol CommentsDelegate {
    func getComments(completion : @escaping (Result<[CommentModel],DataError>) -> Void)
}
protocol UsersDelegate {
    func fetchUsers(completion : @escaping (Result<UserModel,DataError>) -> Void)
}

class CommentViewService : CommentViewServiceDelegate{
    func getComments(completion : @escaping (Result<[CommentModel],DataError>) -> Void){
        //used free api service for data
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/comments") else {
            return completion(.failure(.wrongUrl))
        }
        
        NetworkManager().fetchRequest(type: [CommentModel].self, url: url, completion: completion)
        
        }
    func fetchUsers(completion : @escaping (Result<UserModel,DataError>) -> Void){
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/comments") else {
            return completion(.failure(.wrongUrl))
        }
        NetworkManager().fetchRequest(type: UserModel.self, url: url, completion: completion)
    }
    private func isConnected() -> Bool{
        return true
    }
}
