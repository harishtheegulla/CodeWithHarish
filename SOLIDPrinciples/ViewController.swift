//
//  ViewController.swift
//  SOLIDPrinciples
//
//  Created by Harish on 2023-07-12.
//

import UIKit

class ViewController: UIViewController {
    private var viewModel  = CommentsViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel.fetchComments(completion: { [weak self] in
            print(self?.viewModel.comments ?? [])
        })
       
    }


}

