//
//  RoundedCornerCell.swift
//  SravniRu
//
//  Created by Marcus on 07.12.2021.
//

import UIKit

/// Ячейка с закругленными углами
final class RoundedCornerCell: UITableViewCell, TableViewCellProtocol {
    
    private var backView: UIView = {
        let backView = UIView(frame: CGRect(x: 16, y: 0, width: UIScreen.main.bounds.width - 32, height: 17))
        backView.backgroundColor = ColorsConstants.backgroundCellColor
        return backView
    }()
    
    /// Инициализатор
    /// - Parameter isTopCornerRound: нужно ли закруглять верхние углы
    init(isTopCornerRound: Bool) {
        super.init(style: .value2, reuseIdentifier: nil)
        setupRoundedCorner(isTopCornerRound: isTopCornerRound)
        setupUI()
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        isUserInteractionEnabled = false
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: false)
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(false, animated: false)
    }
    
    private func setupRoundedCorner(isTopCornerRound: Bool) {
        if isTopCornerRound == true  {
            let finallyPath = UIBezierPath(roundedRect: backView.bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: Constants.cornerRadius, height: Constants.cornerRadius))
            let shapeLayerAll = CAShapeLayer()
            shapeLayerAll.frame = backView.bounds
            shapeLayerAll.path = finallyPath.cgPath
            backView.layer.mask = shapeLayerAll
        } else {
            let finallyPath = UIBezierPath(roundedRect: backView.bounds, byRoundingCorners: [.bottomLeft, .bottomRight], cornerRadii: CGSize(width: Constants.cornerRadius, height: Constants.cornerRadius))
            let shapeLayerAll = CAShapeLayer()
            shapeLayerAll.frame = backView.bounds
            shapeLayerAll.path = finallyPath.cgPath
            backView.layer.mask = shapeLayerAll
        }
    }

    private func setupUI() {
        backgroundColor = ColorsConstants.mainBackgroundColor
        contentView.addSubview(backView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        backView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: contentView.topAnchor),
            backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.backViewLeadingAnchor),
            backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Constants.backViewTrailingAnchor),
            backView.heightAnchor.constraint(equalToConstant: Constants.backViewHeightAnchor)
        ])
    }
    
    enum Constants {
        /// Скругление для секций
        static let cornerRadius: CGFloat = 16
        static let backViewLeadingAnchor: CGFloat = 16
        static let backViewTrailingAnchor: CGFloat = -16
        static let backViewHeightAnchor: CGFloat = 17
    }
}
