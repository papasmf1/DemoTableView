//
//  ListViewController.swift
//  DemoTableView
//
//  Created by user on 5/23/24.
//

import UIKit

class ListViewController: UITableViewController {

    //배열
    var list = Array<UserVO>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var user = UserVO()
        user.firstName = "길동"
        user.lastName = "홍"
        user.street = "역삼역"
        user.mobile = "010-123-1234"
        self.list.append(user)
        
        user = UserVO()
        user.firstName = "우치"
        user.lastName = "전"
        user.street = "선릉역"
        user.mobile = "010-222-1234"
        self.list.append(user)
        
        user = UserVO()
        user.firstName = "문수"
        user.lastName = "박"
        user.street = "삼성역"
        user.mobile = "010-333-1234"
        self.list.append(user)
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        //그룹의 갯수
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //행의 숫자
        return list.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //셀의 컨텐츠를 생성
        let row = self.list[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = row.lastName
        cell.detailTextLabel?.text = row.firstName

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Cell touch: \(indexPath.row)")
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
