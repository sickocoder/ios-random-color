//
//  ColorsDetailVC.swift
//  RandomColors
//
//  Created by José Tony on 15/02/22.
//

import UIKit

class ColorsDetailVC: UIViewController {
  
  var color: UIColor?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = color ?? .blue
  }
  
}

