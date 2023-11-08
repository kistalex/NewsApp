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
        scrollView.addSubview(backgroundImageView)
        scrollView.addSubview(contentContainerView)

        view.addSubview(scrollView)
        view.addSubview(sourceView)

        backgroundImageView.image = UIImage(systemName: "questionmark")
        backgroundImageView.tintColor = .red
        backgroundImageView.backgroundColor = .yellow

        contentLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Diam ut venenatis tellus in metus vulputate eu scelerisque felis. Magna fermentum iaculis eu non diam phasellus. Donec ultrices tincidunt arcu non. Porttitor eget dolor morbi non arcu. Faucibus pulvinar elementum integer enim. Massa vitae tortor condimentum lacinia quis vel eros. Ac turpis egestas sed tempus urna. Vulputate eu scelerisque felis imperdiet. Non curabitur gravida arcu ac tortor dignissim. Rutrum tellus pellentesque eu tincidunt tortor aliquam nulla facilisi cras. Ultrices dui sapien eget mi proin sed libero enim sed. Venenatis tellus in metus vulputate. Lectus nulla at volutpat diam ut venenatis. Erat velit scelerisque in dictum. Pulvinar sapien et ligula ullamcorper malesuada proin. Urna nunc id cursus metus aliquam eleifend mi in nulla. Dignissim suspendisse in est ante in nibh mauris. Aliquam etiam erat velit scelerisque in dictum. Vitae aliquet nec ullamcorper sit.\n Leo vel fringilla est ullamcorper eget nulla facilisi etiam dignissim. Sed enim ut sem viverra aliquet eget sit. Interdum consectetur libero id faucibus nisl. Suspendisse faucibus interdum posuere lorem ipsum dolor sit amet consectetur. Malesuada fames ac turpis egestas integer eget aliquet nibh praesent. Morbi enim nunc faucibus a pellentesque sit amet. Tortor condimentum lacinia quis vel. Tristique nulla aliquet enim tortor at auctor. Sollicitudin aliquam ultrices sagittis orci a scelerisque. Senectus et netus et malesuada. Nullam eget felis eget nunc lobortis mattis aliquam faucibus. A arcu cursus vitae congue mauris rhoncus. Phasellus egestas tellus rutrum tellus pellentesque eu. Diam donec adipiscing tristique risus nec feugiat in. Dolor purus non enim praesent. Dolor sit amet consectetur adipiscing elit duis tristique. Sagittis aliquam malesuada bibendum arcu vitae elementum curabitur vitae nunc. Pellentesque sit amet porttitor eget."

        contentLabel.numberOfLines = 0

        contentContainerView.backgroundColor = .white
        contentContainerView.addSubview(contentLabel)

        view.bringSubviewToFront(sourceView)
        view.sendSubviewToBack(backgroundImageView)
    }

    private func setConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        backgroundImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalTo(contentContainerView.snp.top)
            make.height.equalToSuperview().multipliedBy(0.35)
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
//        contentLabel.text = viewModel.articleContent
        viewModel.fetchImage { [weak self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    self?.backgroundImageView.image = image
                }
            case .failure(let error):
                print(String(describing: error))
                //                self?.backgroundImageView.removeFromSuperview()
            }
        }
    }
}
