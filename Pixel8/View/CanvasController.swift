//
//  CanvasController.swift
//  Pixel8
//
//  Created by Richard Price on 27/02/2019.
//  Copyright © 2019 twisted echo. All rights reserved.
//

import UIKit

    typealias Pixel8 = CanvasController

    class CanvasController: UIView {
        
        let pixel8Logo: UIImageView = {
            let image = UIImageView(image: #imageLiteral(resourceName: "pixel8Logo"))
            image.translatesAutoresizingMaskIntoConstraints = false
            return image
        }()
        
    let canvas: Canvas
    let pallet: Pallet
    let width: Int
    let height: Int
    let pixelSize: CGFloat
    let colors: Array<UIColor>
    
    var currentPaintBrush: UIColor {
        didSet {
            canvas.paintBrushColor = currentPaintBrush
        }
    }
    
        init(width: Int, height: Int, pixelSize: CGFloat, canvasColor: UIColor, colors: Set<UIColor>) {
        self.width = width
        self.height = height
        self.pixelSize = pixelSize
        self.colors = Array(colors.filter{ $0 != canvasColor }) + [canvasColor]
        currentPaintBrush = self.colors.first!
        
        canvas = Canvas(width: width, height: height, pixelSize: pixelSize, canvasColor: canvasColor)
        pallet = Pallet(colors: self.colors)
        super.init(frame: CGRect(
            x: 0,
            y: 0,
            width:  CGFloat(width) * pixelSize + 80,
            height: max(canvas.bounds.height, pallet.bounds.height) + 40))
        
        setupViews()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        backgroundColor = .white
        pallet.delegate = self
        addSubview(canvas)
        addSubview(pallet)
        canvas.frame.origin = CGPoint(x: Metrics.regular, y: Metrics.regular + 65)
        pallet.frame.origin = CGPoint(x: CGFloat(width) * pixelSize + 30, y: Metrics.regular + 60)
        addSubview(pixel8Logo)
        pixel8Logo.topAnchor.constraint(equalTo: canvas.bottomAnchor, constant: 15).isActive = true
        pixel8Logo.leftAnchor.constraint(equalTo: canvas.leftAnchor).isActive = true
        pixel8Logo.rightAnchor.constraint(equalTo: canvas.rightAnchor).isActive = true
        pixel8Logo.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
}

extension CanvasController: PalletDelegate {
    func paintBrushDidChange(color: UIColor) {
        currentPaintBrush = color
    }
}
