//
//  TalkListView.swift
//  Diffable&CompostinalPractice
//
//  Created by dopamint on 7/19/24.
//

import UIKit

import SnapKit
import Then

final class TalkListView: BaseView {
    
    let talkListCollectionView = UICollectionView()
    
    let searchBar = UISearchBar().then {
        $0.placeholder = "채팅방 검색"
    }
    
    
    
    
}
