//
//  ViewController.swift
//  Diffable&CompostinalPractice
//
//  Created by dopamint on 7/18/24.
//

import UIKit
import SnapKit
import Then

class SettingViewcontroller: UIViewController {
    
    enum Preference: String, CaseIterable, Hashable {
        case entire = "전체 설정"
        case personal = "개인 설정"
        case etc = "기타"
        
        var subOptions: [String] {
            switch self {
            case .entire:
                return ["공지사항", "실험실", "버전 정보"]
            case .personal:
                return ["개인/보안", "알림", "채팅", "멀티프로필"]
            case .etc:
                return ["고객센터/도움말"]
            }
        }
    }
    
    // 컬렉션뷰 선언
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
    
    // MARK: 1. 컬렉션뷰 레이아웃 -
    func createLayout() -> UICollectionViewLayout {
        
        var configuration = UICollectionLayoutListConfiguration(appearance: .plain)
        configuration.showsSeparators = true
        configuration.headerMode = .supplementary
        
        let layout = UICollectionViewCompositionalLayout
            .list(using: configuration)
        return layout
    }
    
    // MARK: 2. 데이터 소스<섹션 구분데이터, 셀 데이터> -
    // registration
    var dataSource: UICollectionViewDiffableDataSource<Preference, String>!
    var cellRegisteration: UICollectionView.CellRegistration<UICollectionViewListCell, String>!
    var headerRegistration: UICollectionView.SupplementaryRegistration<UICollectionViewListCell>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "설정"
        view.backgroundColor = .white
        configureHierarchy()
        configureLayout()
        configureHeaderRegistration()
        configureCellRegistration()
        
        configureSupplemeentaryViewProvider()
        updateSnapshot()
    }
    
    func configureHierarchy() {
        view.addSubview(collectionView)
    }
    func configureLayout() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    // MARK: 헤더뷰 등록 -
    func configureHeaderRegistration() {
        headerRegistration = UICollectionView.SupplementaryRegistration
        <UICollectionViewListCell>(elementKind: UICollectionView.elementKindSectionHeader) {(headerView, elementKind, indexPath) in
            
            var configuration = headerView.defaultContentConfiguration()
            configuration.text = Preference.allCases[indexPath.section].rawValue
            configuration.textProperties.font = .boldSystemFont(ofSize: 20)
            headerView.contentConfiguration = configuration
        }
    }
    
    func configureCellRegistration() {
        cellRegisteration = UICollectionView.CellRegistration {
            cell, indexPath, itemIdentifier in
            
            var content = UIListContentConfiguration.valueCell()
            content.text = itemIdentifier
            content.textProperties.color = .black
            content.textProperties.font = .systemFont(ofSize: 15)
            cell.contentConfiguration = content
        }
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView,
                                                        cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueConfiguredReusableCell(using: self.cellRegisteration,
                                                                    for: indexPath,
                                                                    item: itemIdentifier)
            return cell
        })
    }
    
    func configureSupplemeentaryViewProvider() {
        dataSource.supplementaryViewProvider = { [weak self] collectionView, elementKind, indexPath in
            guard let self = self else { return nil }
            return collectionView.dequeueConfiguredReusableSupplementary(using: self.headerRegistration,
                                                                         for: indexPath)
        }
    }
    
    // reloadData 역할
    func updateSnapshot() {
        guard let dataSource = self.dataSource else {
            return
        }
        var snapshot = NSDiffableDataSourceSnapshot<Preference, String>()
        snapshot.appendSections([.entire, .personal, .etc])
        snapshot.appendItems(Preference.entire.subOptions, toSection: .entire)
        snapshot.appendItems(Preference.personal.subOptions, toSection: .personal)
        snapshot.appendItems(Preference.etc.subOptions, toSection: .etc)
        dataSource.apply(snapshot)
    }
}

