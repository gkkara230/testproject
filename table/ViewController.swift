//
//  ViewController.swift
//  table
//
//  Created by Govind K on 04/06/16.
//  Copyright © 2016 capgemini. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var array:[String]=[]
    var Numberofrows = 0
    @IBOutlet weak var imageVieww: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    
   
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell=UITableViewCell()
        for item in self.array{
            
            print(item)
            
        }
        cell.textLabel?.text=array[indexPath.row]
        
        return cell
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        Alamofire.request(.GET, "http://demo8449518.mockable.io/zoo").responseJSON { (Response) -> Void in
            if let JSON = Response.result.value{
                //print(JSON["firstkey"] as! String)
                self.array = (JSON["secondkey"] as! NSArray) as! [String]
                self.Numberofrows = self.array.count
                print(self.Numberofrows)
                
                self.tableView.reloadData()
            }
            
        }
    }
    @IBOutlet weak var imageView: UIImageView!
        func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           print(self.array.count)
            return self.array.count   }
        
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

