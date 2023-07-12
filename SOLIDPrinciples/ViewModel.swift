//
//  ViewModel.swift
//  SOLIDPrinciples
//
//  Created by Harish on 2023-07-12.
//

import Foundation
class CommentsViewModel {
    let serviceHandler : CommentViewServiceDelegate
    let localDataBaseHandler : CommentsDelegate
    init(serviceHandler: CommentViewServiceDelegate = CommentViewService(), localDataBaseHandler: CommentsDelegate = LocalDataBaseHandler()) {
        self.serviceHandler = serviceHandler
        self.localDataBaseHandler = localDataBaseHandler
    }
    var comments = [CommentModel]()
    func fetchComments(completion : @escaping() -> Void){
        if isConnected(){
            serviceHandler.getComments { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let model) :
                        self.comments = model
                        completion()
                    case .failure(let error) :
                        print(error)
                    }
                }
            }
        }else{
            localDataBaseHandler.getComments { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let model) :
                        self.comments = model
                    case .failure(let error) :
                        print(error)
                    }
                }
            }
        }
        
    }
    
    
    func fetchUsers(){
        CommentViewService().fetchUsers { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let model) :
                    print("fetched users")
                case .failure(let error) :
                    print(error)
                }
            }
        }
    }
    //check wheather the internet is active or not
    private func isConnected() -> Bool{
        return true
    }
    
    
    
}

