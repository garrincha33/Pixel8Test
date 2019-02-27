//
//  ViewController.swift
//  Pixel8
//
//  Created by Richard Price on 27/02/2019.
//  Copyright © 2019 twisted echo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let canvas = CanvasController(width: 10, height: 10, pixelSize: 5, canvasColor: UIColor.white, colors: [.cyan, .yellow, .blue, .green])

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        canvas.setupViews()
        
    }


}

