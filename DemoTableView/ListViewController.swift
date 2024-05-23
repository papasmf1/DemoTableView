//
//  ListViewController.swift
//  DemoTableView
//
//  Created by user on 5/23/24.
//

import UIKit

class ListViewController: UITableViewController {

    //배열<ResultsData>
    var list = Array<ResultsData>()
    
    //웹사이트와 통신
    func getRandomUsers() {
        guard let url = URL(string: "https://randomuser.me/api/?results=20") else {
            return
        }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request,
        completionHandler:
        { (data, response, error) -> Void in
            if let error = error {
                print(error)
                return
            }
            if let data = data {
                self.list = self.parseJsonData(data: data)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            
        })
        task.resume()
    }
    
    func parseJsonData(data: Data) -> [ResultsData] {
        var list = [ResultsData]()
        do {
            let root = try JSONDecoder().decode(Root.self, from: data)
            print(root.results)
            list = root.results
        } catch {
            print(error)
        }
        return list
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //웹서버와 통신 시작
        self.getRandomUsers()
        
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
        //UITableViewCell ==> UserCell로 다운 캐스팅
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath)
            as! UserCell

        //아웃렛으로 연결
        cell.lastName?.text = row.name.last
        cell.firstName?.text = row.name.first
        cell.street?.text = row.location.street.name
        cell.mobilePhone?.text = row.cell
        //이미지출력
        row.retrieveImage { image, error in
            //백그라운드 쓰레드로 받아온 이미지를 포그라운드쓰레드가 제어하는 UI에 넘기기
            DispatchQueue.main.async {
                cell.thumbnail.image = image
            }
        }
        
        print("셀 생성을 종료합니다: \(indexPath.row)")

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
