//
//  DoubleLabel.swift
//  wanlezu
//
//  Created by 伯驹 黄 on 2017/6/18.
//  Copyright © 2017年 伯驹 黄. All rights reserved.
//

import UIKit

extension UIFont {
    static var systemFont: UIFont {
        return UIFont.systemFont(ofSize: UIFont.systemFontSize)
    }
}

class DoubleLabel: UIView {
    
    private let topLabel = UILabel()
    private let bottomLabel = UILabel()

    /// Default 14 systemFont
    var topFont = UIFont.systemFont {
        didSet {
            topLabel.font = topFont
        }
    }

    /// Default 14 systemFont
    var bottomFont = UIFont.systemFont {
        didSet {
            bottomLabel.font = bottomFont
        }
    }

    /// Default UIColor.darkText
    var topColor = UIColor.darkText {
        didSet {
            topLabel.textColor = topColor
        }
    }

    /// Default UIColor.darkText
    var bottomColor = UIColor.darkText {
        didSet {
            bottomLabel.textColor = topColor
        }
    }

    /// Default 10
    var lineSpacing: CGFloat = 10 {
        didSet {
            bottomLabel.snp.updateConstraints { (make) in
                make.firstBaseline.equalTo(topLabel.snp.lastBaseline).offset(lineSpacing)
            }
        }
    }

    var textAlignment: NSTextAlignment = .center

    var topText: String? {
        didSet {
            topLabel.text = topText
        }
    }
    var bottomText: String? {
        didSet {
            bottomLabel.text = bottomText
        }
    }

    convenience init(alignment: NSTextAlignment = .center) {
        self.init(frame: .zero, alignment: alignment)
    }
    
    init(frame: CGRect, alignment: NSTextAlignment = .center) {
        super.init(frame: frame)
        textAlignment = alignment

        bottomLabel.font = bottomFont
        topLabel.font = topFont

        topLabel.textAlignment = alignment
        bottomLabel.textAlignment = alignment

        addSubview(topLabel)
        topLabel.snp.makeConstraints { (make) in
            make.leading.trailing.equalTo(0)
            make.top.equalTo(0)
        }

        addSubview(bottomLabel)
        bottomLabel.snp.makeConstraints { (make) in
            make.leading.trailing.equalTo(topLabel)
            make.firstBaseline.equalTo(topLabel.snp.lastBaseline).offset(lineSpacing)
            make.bottom.equalTo(0)
        }
    }

    func setContent(_ content: (String, String)) {
        topText = content.0
        bottomText = content.1
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
