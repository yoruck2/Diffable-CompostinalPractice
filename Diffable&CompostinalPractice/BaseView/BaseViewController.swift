//
//  BaseViewController.swift
//  Diffable&CompostinalPractice
//
//  Created by dopamint on 7/19/24.
//

import UIKit

class BaseViewController<RootView: UIView, ViewModel>: UIViewController {
    
    let rootView = RootView()
    var viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureLayout()
        configureView()
    }
    
    func configureHierarchy() {}
    func configureLayout() {}
    func configureView() {}
    func bindViewModel() {}
}
