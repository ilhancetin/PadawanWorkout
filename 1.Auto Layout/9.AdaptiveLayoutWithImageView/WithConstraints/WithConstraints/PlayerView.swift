//
//  PlayerView.swift
//  WithConstraints
//
//  Created by I L H A N on 08.04.2024.
//

import UIKit

class PlayerView: UIView {

    var stackView: UIStackView
    var topAnchorConstraint = NSLayoutConstraint()
    var centerYConstraint = NSLayoutConstraint()

    init() {

    stackView = makeStackView(withOrientation: .vertical)
    stackView.distribution = .fillProportionally

    super.init(frame: .zero)

    setupViews()
    setupInitialOrientation()
}

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupViews() {

        let trackLabel = makeTrackLabel(withText: "Queen")
        let albumLabel = makeAlbumLabel(withText: "Bohemien Rhapsody • Ma Ma Mia (Album)")
        let playerView = ProgressRow()
        let spotifyButtonView = makeSpotifyButtonCustomView()

        addSubview(stackView)

        stackView.addArrangedSubview(trackLabel)
        stackView.addArrangedSubview(albumLabel)
        stackView.addArrangedSubview(playerView)
        stackView.addArrangedSubview(spotifyButtonView)
        
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true

    }

    func setupInitialOrientation() {
        topAnchorConstraint = stackView.topAnchor.constraint(equalTo: topAnchor)
        centerYConstraint = stackView.centerYAnchor.constraint(equalTo: centerYAnchor)

        if UIDevice.current.orientation.isPortrait {
            topAnchorConstraint.isActive = true
            centerYConstraint.isActive = false
        } else {
            topAnchorConstraint.isActive = false
            centerYConstraint.isActive = true
        }
    }

    func makeSpotifyButtonCustomView() -> UIView {
        let spotifyButton = makeSpotifyButton(withText: "PLAY ON SPOTIFY")

        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        container.addSubview(spotifyButton)

        spotifyButton.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
        spotifyButton.centerYAnchor.constraint(equalTo: container.centerYAnchor).isActive = true
        spotifyButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true

        return container
    }

    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 200)
    }

    func adjustForOrientation() {
        if UIDevice.current.orientation.isLandscape {
            topAnchorConstraint.isActive = false
            centerYConstraint.isActive = true
        } else {
            topAnchorConstraint.isActive = true
            centerYConstraint.isActive = false
        }
    }
}
