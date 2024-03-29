//
//  AViewController.swift
//  OneDay
//
//  Created by le tong on 2019/9/24.
//  Copyright © 2019 iOS. All rights reserved.
//

import UIKit

class AViewController: UIViewController ,UITextFieldDelegate{
    var model = BaseModel(name: "", content: "", isSelected: false)
    var selectedButton = UIButton()
    var contentTextField = UITextField()
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
        blockPreperty(contentTextField.text!)
    }
  
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        contentTextField.resignFirstResponder()
        return true
    }
    
    @objc func selectedButtonAction() -> Void {
        self.selectedButton.isSelected = !self.selectedButton.isSelected
    }
    
    func setCurrentUI() -> Void {
        selectedButton = UIButton.init(frame: CGRect(x: UIScreen.main.bounds.size.width / 2.0 - 50, y: 100, width: 100, height: 50))
        contentTextField = UITextField.init(frame: CGRect(x: UIScreen.main.bounds.size.width / 2.0 - 100, y: 160, width: 200, height: 40))
        let leftLabel = UILabel.init(frame: CGRect(x: 0, y: 0, width: 90, height: 40))
        leftLabel.text = "我可修改："
        contentTextField.leftView = leftLabel
        contentTextField.text = model.content
        contentTextField.leftViewMode = UITextField.ViewMode.always
        contentTextField.delegate = self
        contentTextField.textAlignment = NSTextAlignment.left
        selectedButton.isSelected = model.isSelected;
        selectedButton.setTitle("否", for: UIControl.State.normal)
        selectedButton.setTitle("是", for: UIControl.State.selected)
        selectedButton.setTitleColor(UIColor.black, for: UIControl.State.normal)
        selectedButton.addTarget(self, action: #selector(selectedButtonAction), for: UIControl.Event.touchUpInside)
        self.view.addSubview(selectedButton)
        self.view.addSubview(contentTextField)
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
