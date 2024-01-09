//
//  CaseThreeTableViewController.swift
//  SESAC-TableView
//
//  Created by Seryun Chun on 2024/01/05.
//

import UIKit

struct Constant {
    static let TAG_WEIGHT = 100000
}

struct Todo {
    var todo: String
    var checkBox: Bool
    var bookmark: Bool
    
    init(todo: String, checkBox: Bool, bookmark: Bool) {
        self.todo = todo
        self.checkBox = checkBox
        self.bookmark = bookmark
    }
}

class CaseThreeTableViewController: UITableViewController {
    
    var todoList: [Todo] = [
        Todo(todo: "그립톡 구매하기", checkBox: true, bookmark: true),
        Todo(todo: "사이다 구매", checkBox: false, bookmark: false),
        Todo(todo: "아이패드 케이스 최저가 알아보기", checkBox: false, bookmark: true),
        Todo(todo: "양말", checkBox: false, bookmark: true),
    ]
    
    @IBOutlet var textfieldView: UIView!
    @IBOutlet var todoTextfield: UITextField!
    @IBOutlet var cellView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCornerRadius(view: textfieldView)
    }
    
    @IBAction func addButtonTapped(_ sender: UIButton) {
        // add todoList
        let newTodo = Todo(todo: todoTextfield.text!, checkBox: false, bookmark: false)
        todoList.append(newTodo)
        tableView.reloadData()
        
        todoTextfield.text = ""
        
        // Keyboard Dismiss
        view.endEditing(true)
    }
    
    @IBAction func keyboardDismiss(_ sender: Any) {
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CaseThreeTableViewCell", for: indexPath) as! CaseThreeTableViewCell
        
        setCornerRadius(view: cell.cellView)
        
        cell.cellLabel?.text = todoList[indexPath.row].todo
        cell.cellLabel?.font = .systemFont(ofSize: 12)
        
        // 버튼 이미지 세팅
        let checkBoxButtonImage = todoList[indexPath.row].checkBox ? "checkmark.square.fill" : "checkmark.square"
        let starButtonImage = todoList[indexPath.row].bookmark ? "star.fill" : "star"
        cell.checkBoxButton.setImage(UIImage(systemName: checkBoxButtonImage), for: .normal)
        cell.starButton.setImage(UIImage(systemName: starButtonImage), for: .normal)
        
        // add checkBox Action
        cell.checkBoxButton.tag = indexPath.row
        cell.checkBoxButton.addTarget(self, action: #selector(checkBoxButtonTapped), for: .touchUpInside)
        
        // add starButton Action
        cell.starButton.tag = indexPath.row + Constant.TAG_WEIGHT
        cell.starButton.addTarget(self, action: #selector(starButtonTapped), for: .touchUpInside)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    @objc func checkBoxButtonTapped(sender: UIButton) {
        let indexPathRow = sender.tag
        todoList[indexPathRow].checkBox.toggle()
        tableView.reloadData()
    }
    
    @objc func starButtonTapped(sender: UIButton) {
        let indexPathRow = sender.tag - Constant.TAG_WEIGHT
        todoList[indexPathRow].bookmark.toggle()
        tableView.reloadData()
    }
    
    func setCornerRadius(view: UIView) {
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            todoList.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
}
