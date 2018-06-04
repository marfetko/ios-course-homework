//
//  ViewController.swift
//  03-diary-ui
//
//  Created by Mariana Ruzhytska on 27/05/2018.
//  Copyright © 2018 Mariana Ruzhytska. All rights reserved.
//

import UIKit

class RecordListViewController: UIViewController {
    
    var records = [Record]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        self.title = "Diary"
        super.viewDidLoad()
        
        let barButton = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addNewPost))
        
        self.navigationItem.rightBarButtonItem = barButton
        self.navigationItem.leftBarButtonItem = editButtonItem
        // Do any additional setup after loading the view, typically from a nib.
     
        records = [Record(date: Date(), title: "title test", tags: ["tag1","tag2"], text: "description"),
                   Record(date: Date(), title: "title test", tags: ["tag1","tag2"], text: "description")]
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: true)
        tableView.setEditing(editing, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func load () {
//        if let loadedData = UserDefaults.standard.value(forKey: "diary") as? [Record]{
//        records = loadedData
//        tableView.reloadData()
//        }
//    }
//
//    func save () {
//        UserDefaults.standard.set(records, forKey: "diary")
//        UserDefaults.standard.synchronize()
//    }
    
}

extension RecordListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return records.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("DiaryRecordTableViewCell", owner: self, options: nil)?.first as! DiaryRecordTableViewCell
        cell.title.text = records[indexPath.row].title
        return cell
    }
    @objc func addNewPost(sender: UIBarButtonItem){
//        let lableTitle:String = ""
//        records.insert(lableTitle at: 0)
        self.navigationController?.performSegue(withIdentifier: "newRecordSegueIdentifier", sender: self)
        print("new record")
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "recordSegueIdentifier", sender: indexPath);
        print("\(records[indexPath.row])")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       // let recordView.
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    records.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
}

