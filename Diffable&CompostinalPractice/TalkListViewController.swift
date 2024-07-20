//
//  TalkListViewController.swift
//  Diffable&CompostinalPractice
//
//  Created by dopamint on 7/19/24.
//

import UIKit

enum Section: CaseIterable {
    case chatRoom
}

class TalkListViewController: BaseViewController<TalkListView> {
    
    var dataSource: UICollectionViewDiffableDataSource<Section, ChatRoom>!
    var registeration: UICollectionView.CellRegistration<TalkListCollectionViewCell, ChatRoom>!
    var mockData = MockChat().mockChatList
    
    lazy var searchedRoomList: [ChatRoom] = mockData {
        didSet {
            updateSnaphot()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureDataSource()
        updateSnaphot()
        configureSearchBar()
    }
    
    override func configureView() {
        navigationItem.title = "COCOA TALK"
        
    }
}

extension TalkListViewController {
    
    func configureDataSource() {
        registeration = UICollectionView.CellRegistration { cell, indexPath, itemIdentifier in
            cell.talkRoomNameLabel.text = itemIdentifier.chatroomName
            cell.profileImageView.image = UIImage(named: itemIdentifier.chatroomImage)
            cell.recentTalkLabel.text = itemIdentifier.chatList.last?.message
            cell.dateLabel.text = itemIdentifier.chatList.last?.date.formattedDotDate
        }
        
        self.dataSource = UICollectionViewDiffableDataSource(collectionView: self.rootView.chatListcollectionView,
                                                             cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueConfiguredReusableCell(using: self.registeration,
                                                                    for: indexPath,
                                                                    item: itemIdentifier)
            return cell
        })
    }
    func updateSnaphot() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, ChatRoom>()
        snapshot.appendSections([.chatRoom])
        snapshot.appendItems(searchedRoomList, toSection: .chatRoom)
        dataSource.apply(snapshot)
    }
}
extension TalkListViewController: UISearchResultsUpdating {
    
    func configureSearchBar() {
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
        searchController.isActive = true
        searchController.searchBar.placeholder = "친구 이름을 검색해보세요"
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
        guard let text = searchController.searchBar.text?.lowercased() else {
            searchedRoomList = mockData
            return
        }
        
        if text == "" {
            searchedRoomList = mockData
            
        } else {
            searchedRoomList = mockData.filter {
                $0.chatroomName.lowercased().contains(text)
            }
        }
    }
}
