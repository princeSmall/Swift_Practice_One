//
//  AViewController.swift
//  OneDay
//
//  Created by le tong on 2019/9/24.
//  Copyright © 2019 iOS. All rights reserved.
//

import UIKit

class AViewController: UIViewController {
    var model = BaseModel(name: "", content: "", isSelected: false)
    var selectedButton = UIButton()
    var contentLabel = UILabel()
    
//    block
    typealias disBlock = (_ content: String) ->(Void)
    var blockPreperty: disBlock!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = model.name
        self.view.backgroundColor = UIColor.white
        self.setCurrentUI()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        blockPreperty(model.content)
    }
  
    
    @objc func selectedButtonAction() -> Void {
        selectedButton.isSelected = !selectedButton.isSelected
    }
    
    func setCurrentUI() -> Void {
        selectedButton = UIButton.init(frame: CGRect(x: UIScreen.main.bounds.size.width / 2.0 - 50, y: 100, width: 100, height: 50))
        contentLabel = UILabel.init(frame: CGRect(x: UIScreen.main.bounds.size.width / 2.0 - 50, y: 160, width: 100, height: 40))
        contentLabel.text = model.content
        contentLabel.textAlignment = NSTextAlignment.center
        selectedButton.isSelected = model.isSelected;
        selectedButton.setTitle("否", for: UIControl.State.normal)
        selectedButton.setTitle("是", for: UIControl.State.selected)
        selectedButton.setTitleColor(UIColor.black, for: UIControl.State.normal)
        selectedButton.addTarget(self, action: #selector(selectedButtonAction), for: UIControl.Event.touchUpInside)
        self.view.addSubview(selectedButton)
        self.view.addSubview(contentLabel)
    }
    
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
