//
//  GuestsView.swift
//  GuestsCoreData
//
//  Created by Aldair Raul Cosetito Coral on 11/3/20.
//

import UIKit
import SnapKit

class GuestsView: UIViewController {
    
    //MARK: - UI Variables
    let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    //MARK: - Local Variables
    var viewModel: GuestViewModel?
    var guests: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        setupUI()
        configureTableView()
    }
    
    //MARK: - Setup UI
    func setupUI() {
        self.view.addSubview(tableView)
        self.tableView.backgroundColor = .blue
        self.tableView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(0.0)
            make.width.equalToSuperview()
            make.bottom.equalTo(self.view)
        }
    }
    
    //MARK: - Setup Actions
    
    //MARK: - Methods
    func configureTableView() {
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.tableView.dataSource = self
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension GuestsView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return guests.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = guests[indexPath.row]
        return cell
    }
}
