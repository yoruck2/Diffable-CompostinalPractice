//
//  TalkListCollectionViewCell.swift
//  Diffable&CompostinalPractice
//
//  Created by dopamint on 7/19/24.
//

import UIKit

class TalkListCollectionViewCell: BaseCollectionViewCell {
    
    var profileImageView = UIImageView().then {
        $0.layer.cornerRadius = 15
        $0.clipsToBounds =  true
    }
    var talkRoomNameLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 15)
    }
    var recentTalkLabel = UILabel().then {
        $0.textColor = .gray
        $0.font = .boldSystemFont(ofSize: 13)
    }
    var dateLabel = UILabel().then {
        $0.textColor = .gray
        $0.font = .systemFont(ofSize: 13)
    }
    
    override func configureHierarchy() {
        addSubview(profileImageView)
        addSubview(talkRoomNameLabel)
        addSubview(recentTalkLabel)
        addSubview(dateLabel)
    }
    override func configureLayout() {
        profileImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(15)
            make.width.equalTo(contentView).multipliedBy(0.18)
            make.height.equalTo(contentView).multipliedBy(0.8)
        }
        talkRoomNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(profileImageView.snp.trailing).offset(15)
            make.top.equalTo(profileImageView.snp.top).inset(5)
        }
        recentTalkLabel.snp.makeConstraints { make in
            make.leading.equalTo(profileImageView.snp.trailing).offset(15)
            make.top.equalTo(talkRoomNameLabel.snp.bottom).offset(15)
        }
        dateLabel.snp.makeConstraints { make in
            make.centerY.equalTo(talkRoomNameLabel)
            make.trailing.equalToSuperview().inset(15)
        }
    }
}
