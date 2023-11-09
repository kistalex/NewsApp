//
//
// NewsApp
// NewsDetailViewController.swift
//
// Created by Alexander Kist on 07.11.2023.
//

import UIKit

final class NewsDetailViewController: UIViewController {

    private let viewModel: ArticleDetailViewModel

    init(viewModel: ArticleDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    private let sourceView = SourceView()
    private let backgroundImageView = UIImageView()
    private let contentLabel = UILabel()
    private let contentContainerView = UIView()
    private let scrollView = UIScrollView()
    private let placeholderView = UIView()

    required init?(coder: NSCoder) {
        fatalError("Error")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstraints()
        configure()
        view.backgroundColor = .white
    }

    private func setupViews() {
        view.addSubview(backgroundImageView)
        scrollView.addSubview(placeholderView)
        scrollView.addSubview(contentContainerView)
        placeholderView.backgroundColor = .clear

        contentContainerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        contentContainerView.layer.cornerRadius = 20

        view.addSubview(scrollView)
        view.addSubview(sourceView)

        contentLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Scelerisque eu ultrices vitae auctor eu augue ut. Fusce id velit ut tortor pretium viverra suspendisse potenti. Rhoncus aenean vel elit scelerisque. Magna sit amet purus gravida quis. Enim nulla aliquet porttitor lacus luctus accumsan tortor posuere ac. Aliquet nibh praesent tristique magna sit. Ultrices mi tempus imperdiet nulla malesuada pellentesque. Dignissim convallis aenean et tortor at. Sed ullamcorper morbi tincidunt ornare massa. Nisl nisi scelerisque eu ultrices vitae. Nec dui nunc mattis enim.\n Turpis egestas pretium aenean pharetra magna ac placerat vestibulum. Orci a scelerisque purus semper eget duis at tellus at. Mi eget mauris pharetra et ultrices neque. Augue ut lectus arcu bibendum. Ut lectus arcu bibendum at varius vel pharetra vel turpis. Facilisis gravida neque convallis a cras. In nibh mauris cursus mattis. Porttitor leo a diam sollicitudin tempor id eu nisl nunc. Semper viverra nam libero justo laoreet sit amet cursus sit. Suspendisse faucibus interdum posuere lorem. Arcu bibendum at varius vel pharetra vel turpis nunc eget. Id volutpat lacus laoreet non curabitur gravida arcu ac tortor. Gravida dictum fusce ut placerat orci nulla pellentesque dignissim enim. Quis risus sed vulputate odio ut enim blandit volutpat maecenas. Et malesuada fames ac turpis egestas integer eget aliquet.\n Tristique nulla aliquet enim tortor. Porttitor lacus luctus accumsan tortor posuere ac. Dignissim suspendisse in est ante in nibh mauris. Nunc scelerisque viverra mauris in aliquam sem fringilla ut morbi. In arcu cursus euismod quis. At consectetur lorem donec massa sapien faucibus et molestie. Diam donec adipiscing tristique risus nec feugiat in fermentum. Neque convallis a cras semper auctor neque. Nibh nisl condimentum id venenatis a condimentum. Metus dictum at tempor commodo ullamcorper a. Elit ullamcorper dignissim cras tincidunt lobortis feugiat vivamus at. Enim sit amet venenatis urna cursus. Odio pellentesque diam volutpat commodo sed egestas egestas. Faucibus in ornare quam viverra orci sagittis. Pellentesque nec nam aliquam sem et tortor consequat id porta."
        contentLabel.numberOfLines = 0

        contentContainerView.backgroundColor = .white
        contentContainerView.addSubview(contentLabel)
    }

    private func setConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        backgroundImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.3)

        }

        placeholderView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalTo(contentContainerView.snp.top)
            make.height.equalToSuperview().multipliedBy(0.3)
        }

        contentContainerView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.width.equalToSuperview()
        }

        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(sourceView.snp.bottom).offset(10)
            make.leading.trailing.bottom.equalToSuperview().inset(16)
        }

        sourceView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(32)
            make.centerY.equalTo(contentContainerView.snp.top)
        }
    }

    public func configure() {
        sourceView.configure(viewModel)
        viewModel.fetchImage { [weak self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    self?.backgroundImageView.image = image
                }
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}
