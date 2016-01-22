//
//  PhotoViewController.swift
//  Instagram
//
//  Created by Esme Romero on 1/21/16.
//  Copyright © 2016 Esme Romero. All rights reserved.
//

import UIKit
import AFNetworking


class PhotoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var photos: [NSDictionary]?
    
    @IBOutlet weak var tableViewLabel: UITableView!
   
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewLabel.rowHeight = 320
        tableViewLabel.dataSource = self
        tableViewLabel.delegate = self
        
        let clientId = "e05c462ebd86446ea48a5af73769b602"
        let url = NSURL(string:"https://api.instagram.com/v1/media/popular?client_id=\(clientId)")
        let request = NSURLRequest(URL: url!)
        let session = NSURLSession(
            configuration: NSURLSessionConfiguration.defaultSessionConfiguration(),
            delegate:nil,
            delegateQueue:NSOperationQueue.mainQueue()
        )
        
        let task : NSURLSessionDataTask = session.dataTaskWithRequest(request,
            completionHandler: { (dataOrNil, response, error) in
                if let data = dataOrNil {
                    if let responseDictionary = try! NSJSONSerialization.JSONObjectWithData(
                        data, options:[]) as? NSDictionary {
                            NSLog("photos: \(responseDictionary)")
                            
                            self.photos = responseDictionary["data"] as? [NSDictionary]
                            self.tableViewLabel.reloadData()
                    }
                }
        });
        task.resume()
        
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableViewLabel.dequeueReusableCellWithIdentifier("photoCell", forIndexPath: <#T##NSIndexPath#>) as! PhotoTableViewCell
        
        let photo = photos![indexPath.row]
        
        let baseUrl = photo["images"]!["low_resolution"]!!["url"] as! String
        
        let photoUrl = NSURL(fileURLWithPath: baseUrl)
        
        cell.photoViewLabel.setImageWithURL(photoUrl)
        
        
        return cell
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
