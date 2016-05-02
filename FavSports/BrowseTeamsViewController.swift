//
//  BrowseTeamsViewController.swift
//  FavSports
//
//  Created by Alberto Reyes on 4/27/16.
//  Copyright © 2016 CMPE 137. All rights reserved.
//

import UIKit
import Firebase

class BrowseTeamsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let cellIdentifier = "CellIdentifier"
    
    var categorizedTeams = [String: [String]]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
 //       print("did load")
//        teams = ["Sharks", "Kings", "Lakers", "Warriors", "Arsenal", "Man United", "Giants", "Dodgers", "49ers", "Raiders"]
        
//         var teams: [String] = []
        
//        CLUBS_REF.observeEventType(.ChildAdded, withBlock: {
//           
//            snapshot in
//            print("\(snapshot.value.objectForKey("name"))")
//            let test = snapshot.value.objectForKey("name") as! String
//            print("test is: \(test)")
//            teams.append(test)
//            
//        })
       
        //teams += importTeams()
//        
//        print("final array:")
//        for team in teams {
//            print("\(team)")
//        }
//        categorizedTeams = categorize(teams)
        
       
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(animated: Bool) {
 
        super.viewWillAppear(animated)
      
        print("did load")
        //        teams = ["Sharks", "Kings", "Lakers", "Warriors", "Arsenal", "Man United", "Giants", "Dodgers", "49ers", "Raiders"]
        
        var teams: [String] = []
        
        CLUBS_REF.observeEventType(.ChildAdded, withBlock: {
            
            snapshot in
            print("\(snapshot.value.objectForKey("name"))")
            let test = snapshot.value.objectForKey("name") as! String
            print("test is: \(test)")
            teams.append(test)
            
        })
        
        //teams += importTeams()
        
        print("final array:")
        for team in teams {
            print("\(team)")
        }
        categorizedTeams = categorize(teams)
        

    }
//    func importTeams() -> Array<String> {
//        let imported: [String] = []
//        print("import teams is executing now")
//        CLUBS_REF.observeEventType(.ChildAdded, withBlock: {
//            snapshot in
//            print("\(snapshot.value.objectForKey("name"))")
//            let test: String = snapshot.value.objectForKey("name") as! String
//            self.teams += [test]
//        })
//        return imported
//
//    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        print("number of sections")
//        print("final array:")
//        for team in teams {
//            print("\(team)")
//        }

        let keys = categorizedTeams.keys
        
        return keys.count
    }
    
    //Number of rows per section: the number of teams that will go in each sport category
    func tableView(tableView:UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print("number of rows per section")
//        print("final array:")
//        for team in teams {
//            print("\(team)")
//        }

        let keys = categorizedTeams.keys
        
        //sort keys
        let sortedKeys = keys.sort({ (a, b) -> Bool in
            a.lowercaseString < b.lowercaseString
        })
        
        
        //fetch teams
        let key = sortedKeys[section]
        
        if let teams = categorizedTeams[key]{
            return teams.count
        }
        return 0
    }

    //required methods for table protocol: tableView(_:cellForRowAtIndexPath:)
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
     
        print("cell for row at index path")
//        print("final array:")
//        for team in teams {
//            print("\(team)")
//        }

        //check if there was a table view already created in the reuse queue
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
        
        // Fetch and Sort Keys
        let keys = categorizedTeams.keys.sort({ (a, b) -> Bool in
            a.lowercaseString < b.lowercaseString
        })
        
        // Fetch teams for Section
        let key = keys[indexPath.section]
        
        if let teams = categorizedTeams[key] {
            // Fetch team
            let team = teams[indexPath.row]
            
            // Configure Cell
            cell.textLabel?.text = team
        }
        
        
        return cell
    }
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        print("headers")
//        print("final array:")
//        for team in teams {
//            print("\(team)")
//        }

        // Fetch and Sort Keys
        let keys = categorizedTeams.keys.sort({ (a, b) -> Bool in
            a.lowercaseString < b.lowercaseString
        })
        
        return keys[section]
    }
    private func categorize(array: [String]) -> [String: [String]] {
        var result = [String: [String]]()
        for item in array{
            if result["test category"] != nil{
                result["test category"]!.append(item)
                
            }
            else{
                result["test category"] = [item]
            }
        }
//        result["Hockey"] = [array[0]]
//        result["Hockey"]!.append(array[1])
//        
//        result["Basketball"] = [array[2]]
//        result["Basketball"]!.append(array[3])
//        
//        result["Soccer"] = [array[4]]
//        result["Soccer"]!.append(array[5])
//        
//        result["Baseball"] = [array[6]]
//        result["Baseball"]!.append(array[7])
//        
//        result["Football"] = [array[8]]
//        result["Football"]!.append(array[9])
        
      
        
        return result
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("table delegate")
//        print("Array count: \(teams.count)")
//        print("final array:")
//        for team in teams {
//            print("\(team)")
//        }
        // Fetch and Sort Keys
        let keys = categorizedTeams.keys.sort({ (a, b) -> Bool in
            a.lowercaseString < b.lowercaseString
        })
        
        // Fetch teams for Section
        let key = keys[indexPath.section]
        
        if let teams = categorizedTeams[key] {
            print(teams[indexPath.row])
        }
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
