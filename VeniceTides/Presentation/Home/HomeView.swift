//
//  HomeView.swift
//  VeniceTides
//
//  Created by Riccardo on 05/12/20.
//

import Foundation
import UIKit
import TinyConstraints

class HomeView: UIView {

    // MARK: - Top view

    let currentLevelStackView = UIStackView()

    let currentLevelImage = UIImageView(image: UIImage(systemName: "arrow.up.circle.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 36)))

    let currentLevelLabel = UILabel()
    let lastUpdateLabel = UILabel()
    let positionLabel = UILabel()

    // MARK: - Next hours

    let nextHoursLabel = UILabel()

    // MARK: - Today chart
    let todayChartLabel = UILabel()

    // MARK: - Generic

    let divider = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setup()

        style()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup
    func setup() {

        // MARK: - Top view
        self.addSubview(currentLevelStackView)

        currentLevelStackView.addArrangedSubview(currentLevelImage)
        currentLevelStackView.addArrangedSubview(currentLevelLabel)

        self.addSubview(lastUpdateLabel)
        self.addSubview(positionLabel)

        self.addSubview(divider)

        // MARK: - Next hours view
        self.addSubview(nextHoursLabel)

        // MARK: - Today chart view
        self.addSubview(todayChartLabel)

    }

    // MARK: - Style
    func style() {
        self.backgroundColor = .systemBackground

        // MARK: - Top view

        currentLevelLabel.text = "120 cm"
        currentLevelLabel.font = UIFont.boldSystemFont(ofSize: 48)

        currentLevelStackView.axis = .horizontal
        currentLevelStackView.alignment = .center

        positionLabel.text = "Piano Santa Salute - 10:32"
        positionLabel.textAlignment = .center
        positionLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)

        divider.backgroundColor = .separator

        // MARK: - Next hours

        nextHoursLabel.text = "Prossime ore"
        nextHoursLabel.font = UIFont.boldSystemFont(ofSize: 24)

        // MARK: - Today chart
        todayChartLabel.text = "Prossime ore"
        todayChartLabel.font = UIFont.boldSystemFont(ofSize: 24)

    }

    // MARK: - Layout

    override func layoutSubviews() {
        super.layoutSubviews()

        currentLevelStackView.topToSuperview(offset: 32, usingSafeArea: true)
        currentLevelStackView.centerXToSuperview()
        currentLevelStackView.spacing = 16

        positionLabel.widthToSuperview()
        positionLabel.topToBottom(of: currentLevelStackView, offset: 16)

//        divider.widthToSuperview()
//        divider.height(1)
//        divider.topToBottom(of: positionLabel, offset: 16)

        nextHoursLabel.topToBottom(of: positionLabel, offset: 16)
        nextHoursLabel.leftToMargin()

    }

}
