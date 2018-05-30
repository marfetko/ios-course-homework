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
    
//    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let barButton = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addNewPost))
        navigationItem.rightBarButtonItem = barButton
        // Do any additional setup after loading the view, typically from a nib.
        
        
        records = [Record(date: Date(), title: "title test", tags: ["tag1","tag2"], text: "description"),
                   Record(date: Date(), title: "title test", tags: ["tag1","tag2"], text: "description"),
                   Record(date: Date())!]
        
//        let post1 = Record(date: Date(), title: "title test", tags: ["tag1","tag2"], text: "description")
//        print(post1.description())
//
//        let post2 = Record(date: Date(), title: "title 2 test", tags: ["tag12","tag22"], text: "description2")
//        print(post2.description())
//
//        let post3 = Record(date: Date())
//        print(post3?.description() as Any)
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension RecordListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return records.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("DiaryRecordTableViewCell", owner: self, options: nil)?.first as! DiaryRecordTableViewCell
        cell.title.text = records[indexPath.row].title
        return cell
    }
    @objc func addNewPost(sender: UIBarButtonItem){
        self.navigationController?.performSegue(withIdentifier: "newRecordSegueIdentifier", sender: self)
        print("record added")
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath) {
        self.performSegue(withIdentifier: "recordSegueIdentifier", sender: indexPath);
        print("segue")
    }
}

