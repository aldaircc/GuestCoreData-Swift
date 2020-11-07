//
//  GuestsView.swift
//  GuestsCoreData
//
//  Created by Aldair Raul Cosetito Coral on 11/3/20.
//

import UIKit
import SnapKit
import CoreData

class GuestsView: UIViewController {
    
    //MARK: - UI Variables
    let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    //MARK: - Local Variables
    var viewModel: GuestViewModel?
    var guests: [NSManagedObject] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        setupUI()
        configureTableView()
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        self.viewModel = GuestViewModel(context: appDelegate.persistenContainer.viewContext)
        self.guests = viewModel!.getGuests()
    }
    
    //MARK: - Setup UI
    func setupUI() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "Add", style: .plain, target: self, action: #selector(addName))
        self.view.addSubview(tableView)
        self.tableView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(0.0)
            make.width.equalToSuperview()
            make.bottom.equalTo(self.view)
        }
    }
    
    //MARK: - Methods
    func configureTableView() {
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.tableView.dataSource = self
    }
    
    @objc func addName() {
        let alertView = UIAlertController.init(title: "New guest",
                                               message: "",
                                               preferredStyle: .alert)
        let saveAction = UIAlertAction.init(title: "Save", style: .default) {
            [unowned self] action in
            
            guard let textField = alertView.textFields?.first,
                  let nameGuest = textField.text else {
                return
            }
            
            self.guests.append(
                self.viewModel!.save(name: nameGuest))
            self.tableView.reloadData()
        }
        let cancelAction = UIAlertAction.init(title: "Cancel", style: .cancel)
        
        alertView.addTextField()
        alertView.addAction(saveAction)
        alertView.addAction(cancelAction)
        present(alertView, animated: true)
    }
    
    func reloadData() {
        self.guests = self.viewModel!.getGuests()
        self.tableView.reloadData()
    }

}

extension GuestsView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return guests.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let guest = guests[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = guest.value(forKey: "name") as? String
        return cell
    }
}

extension GuestsView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.viewModel!.delete(guest: self.guests[indexPath.row])
            self.reloadData()
        }
    }
}
