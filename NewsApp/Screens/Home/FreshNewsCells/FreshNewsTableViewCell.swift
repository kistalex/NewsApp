//
//
// NewsApp
// FreshNewsTableViewCell.swift
//
// Created by Alexander Kist on 17.10.2023.
//


import UIKit

class FreshNewsTableViewCell: UITableViewCell {
    
    private var data: [String] = [
        "Crypto investors should be prepared to lose all their money, BOE governor says 1",
        "Crypto investors should be prepared to lose all their money, BOE governor says 2",
        "Crypto investors should be prepared to lose all their money, BOE governor says 3",
        "Crypto investors should be prepared to lose all their money, BOE governor says 4",
        "Crypto investors should be prepared to lose all their money, BOE governor says 5"
    ]
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupViews() {
        contentView.addSubview(collectionView)
        backgroundColor = .white
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.alwaysBounceHorizontal = true
        collectionView.register(NewsCollectionViewCell.self, forCellWithReuseIdentifier: "\(NewsCollectionViewCell.self)")
    }
    
    private func setConstraints() {
        collectionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.bottom.equalToSuperview().inset(10)
            make.height.equalTo(240).multipliedBy(0.4)
        }
    }
}
//MARK: - UICollectionViewDataSource
extension FreshNewsTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(NewsCollectionViewCell.self)", for: indexPath) as? NewsCollectionViewCell else {
            return UICollectionViewCell()
        }
        let item = data[indexPath.item]
        cell.configure(with: item)
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension FreshNewsTableViewCell: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.frame.size
        return CGSize(width: size.width - 40 , height: size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    }
}
                      
                      
