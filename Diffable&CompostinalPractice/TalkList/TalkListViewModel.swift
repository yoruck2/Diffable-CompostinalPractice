//
//  TalkListViewModel.swift
//  Diffable&CompostinalPractice
//
//  Created by dopamint on 7/20/24.
//

import Foundation

class TalkListViewModel {
    
    private var mockData = MockChat().mockChatList
    
    var inputSearchedRoomList: Observable<String?> = Observable("")
    private(set) var outputSearchedRoomList: Observable<[ChatRoom]?> = Observable([])
    
    init() {
        inputSearchedRoomList.bind { [weak self] text in
            guard let text, let self else {
                self?.outputSearchedRoomList.value = self?.mockData
                return
            }
            
            if text == "" {
                self.outputSearchedRoomList.value = self.mockData
                
            } else {
                self.outputSearchedRoomList.value = self.mockData.filter {
                    $0.chatroomName.lowercased().contains(text)
                }
            }
        }
    }
}
