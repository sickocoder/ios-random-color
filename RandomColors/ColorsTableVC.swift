//
//  ColorsTableVC.swift
//  RandomColors
//
//  Created by José Tony on 15/02/22.
//

import UIKit

class ColorsTableVC: UIViewController {
  var colors: [UIColor] = []
  
  enum Cells {
    static let colorCell = "ColorCell"
  }
  
  enum Segues {
    static let toDetail = "toColorsDetailVC"
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    addRandomColors()
  }
  
  func addRandomColors() {
    for _ in 0..<50 {
      colors.append(.random())
    }
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let destVC = segue.destination as! ColorsDetailVC
    destVC.color = sender as? UIColor
  }
  
}

extension ColorsTableVC: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return colors.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: Cells.colorCell) else {
      return UITableViewCell()
    }
    
    let color = colors[indexPath.row]
    cell.backgroundColor = color
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let color = colors[indexPath.row]
    performSegue(withIdentifier: Segues.toDetail, sender: color)
  }
}
