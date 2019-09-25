//
//  ViewController.swift
//  OneDay
//
//  Created by le tong on 2019/9/24.
//  Copyright © 2019 iOS. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var baseTableView = UITableView()
    let identifier = "baseTableViewCellIndentifier"
    var baseModelArray : [BaseModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "BaseViewController"
        self.view.backgroundColor = UIColor.white
        self.baseModelArray = [BaseModel.init(name: "A", content: "aaaaa", isSelected: true),
                               BaseModel.init(name: "B", content: "bbbbb", isSelected: false),
                               BaseModel.init(name: "C", content: "ccccc", isSelected: false),
                               BaseModel.init(name: "D", content: "ddddd", isSelected: true)]
        self.creatCurrentTableView()
    }
    
    func creatCurrentTableView() -> Void {
        self.baseTableView = UITableView.init(frame: self.view.bounds, style: UITableView.Style.plain)
        self.baseTableView.delegate = self
        self.baseTableView.dataSource = self
        self.baseTableView.tableFooterView = UIView.init()
        self.baseTableView.register(BaseTableViewCell.classForCoder(), forCellReuseIdentifier: identifier)
        self.view.addSubview(self.baseTableView)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.baseModelArray.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model: BaseModel = self.baseModelArray[indexPath.row]
        
        let a = AViewController()
        a.model = model
        a.blockPreperty = {(content) in
            model.content = content
            tableView.reloadData()
        }
        self.navigationController?.pushViewController(a, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: BaseTableViewCell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! BaseTableViewCell
        
        let baseModel:BaseModel = baseModelArray[indexPath.row]
        cell.updateCurrentCell(model: baseModel)
        cell.functionBlock = {(isSelected) in
            baseModel.isSelected = isSelected
            tableView.reloadData()
        }
        return cell
    }
    


}

