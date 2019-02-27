//
//  MainGrid.swift
//  Pixel8
//
//  Created by Richard Price on 27/02/2019.
//  Copyright © 2019 twisted echo. All rights reserved.
//

import UIKit

class MainGrid: UIViewController {
    
    let canvas = CanvasController(width: 20, height: 30, pixelSize: 15, canvasColor: UIColor.white, colors: [.white, .blue, .red, .green, .purple, .black, .darkGray, .yellow, .brown, .orange])
    
    override func viewDidLoad() {
        super.viewDidLoad()

        canvas.setupViews()

    }
    
    override func loadView() {
        self.view = canvas
    }
    
}
