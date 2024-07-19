//
//  TalkListCollectionViewCell.swift
//  Diffable&CompostinalPractice
//
//  Created by dopamint on 7/19/24.
//

import UIKit

class TalkListCollectionViewCell: BaseCollectionViewCell {
    
    let profileImageView = UIImageView().then {
        $0.layer.cornerRadius = 15
        $0.clipsToBounds =  true
    }
    let talkRoomNameLabel = UILabel()
    let recentTalkLabel = UILabel()
    let dateLabel = UILabel()
    
    override func configureHierarchy() {
        addSubview(profileImageView)
        addSubview(talkRoomNameLabel)
        addSubview(recentTalkLabel)
        addSubview(dateLabel)
    }
    override func configureLayout() {
        profileImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(10)
        }
        talkRoomNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(profileImageView.snp.trailing).offset(5)
            make.top.equalTo(profileImageView.snp.top).inset(5)
        }
        recentTalkLabel.snp.makeConstraints { make in
            make.leading.equalTo(profileImageView.snp.trailing).offset(5)
            make.bottom.equalTo(profileImageView.snp.bottom).inset(5)
        }
        dateLabel.snp.makeConstraints { make in
            make.centerY.equalTo(talkRoomNameLabel)
            make.trailing.equalToSuperview().inset(5)
        }
    }
    override func configureView() {
        
    }
}
