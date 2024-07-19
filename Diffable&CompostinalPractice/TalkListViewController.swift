//
//  TalkListViewController.swift
//  Diffable&CompostinalPractice
//
//  Created by dopamint on 7/19/24.
//

import UIKit

class TalkListViewController: BaseViewController<TalkListView> {
    
    lazy var ChatListcollectionView = UICollectionView(frame: .zero, 
                                                       collectionViewLayout: createLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.titleView = rootView.searchBar
    }
    func createLayout() -> UICollectionViewLayout {
        
        var configuration = UICollectionLayoutListConfiguration(appearance: .plain)
        configuration.showsSeparators = true
        configuration.headerMode = .supplementary
        
        let layout = UICollectionViewCompositionalLayout
            .list(using: configuration)
        return layout
    }
    
}


extension TalkListViewController: UISearchBarDelegate {
    
}
