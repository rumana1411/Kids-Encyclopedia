//
//  MyFavViewController.swift
//  Encyclopediarepair
//
//  Created by Rumana Nazmul on 10/8/17.
//  Copyright © 2017 ALFA. All rights reserved.
//

import UIKit

class MyFavViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CollapsibleTableViewHeaderDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    var sections = [Section]()
    
    @IBOutlet weak var topView: gradiantView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Auto resizing the height of the cell
        tableView.estimatedRowHeight = 44.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.topView.bringSubview(toFront: tableView)

        
        
   //self.tableView.contentInset = UIEdgeInsetsMake(100, 0, 0, 0)
        
        
        
        self.title = "Apple Products"
        
        for eachCntry in myFav{
            
            sections.append(Section(name: InfoDataArray[eachCntry].country, flagEmo: flagEmojiArray[eachCntry] , items: [
                Item(name: "Continent", detail: regionInfoArray[eachCntry].regName),
                Item(name: "Capital", detail: InfoDataArray[eachCntry].capital),
                Item(name: "Language", detail: langNCurrArray[eachCntry].languages[0]),
                Item(name: "Currency", detail: langNCurrArray[eachCntry].currencies[0])  ]))
            
            
        }
        
        print("sections: \(sections)")
    }
    


//
// MARK: - View Controller DataSource and Delegate
//

    
     func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
        
        //  return InfoDataArray.count
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].collapsed ? 0 : sections[section].items.count
        
        //  return 5
    }
    
    // Cell
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: CollapsibleTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CollapsibleTableViewCell ??
            CollapsibleTableViewCell(style: .default, reuseIdentifier: "cell")
        
        let item: Item = sections[indexPath.section].items[indexPath.row]
        
        //  let item: Country = InfoDataArray[indexPath.section]
        
        cell.nameLabel.text = item.name
        cell.nameLabel.font = UIFont(name: "Bradley Hand", size: 22)
       
        cell.detailLabel.text = item.detail
        cell.detailLabel.font = UIFont(name: "Bradley Hand", size: 20)
        
        //        cell.nameLabel.text = item.continent
        //        cell.detailLabel.text = item.capital
        
        
        return cell
    }
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    // Header
     func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as? CollapsibleTableViewHeader ?? CollapsibleTableViewHeader(reuseIdentifier: "header")
        
        header.titleLabel.text = sections[section].name
        header.titleLabel.font = UIFont(name: "Bradley Hand", size: 24)
        header.flagLabel.text = sections[section].flagEmo
        
        header.arrowLabel.text = ">"
        header.setCollapsed(sections[section].collapsed)
        
        header.section = section
        header.delegate = self
        
        return header
    }
    
     func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44.0
    }
    
     func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1.0
    }
    
    func toggleSection(_ header: CollapsibleTableViewHeader, section: Int) {
        let collapsed = !sections[section].collapsed
        
        // Toggle collapse
        sections[section].collapsed = collapsed
        header.setCollapsed(collapsed)
        
        tableView.reloadSections(NSIndexSet(index: section) as IndexSet, with: .automatic)
    }
    
    
    @IBAction func backButton(_ sender: UIButton) {
        
       performSegue(withIdentifier: "showTest", sender: nil)
        
    }
    
 
    
}

