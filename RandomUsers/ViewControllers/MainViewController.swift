//
//  ViewController.swift
//  RandomUsers
//
//  Created by Leon Fridman on 9/16/22.
//

import UIKit

class MainViewController: UITableViewController {
    
    enum Links: String {
        case userDataURL = "https://randomuser.me/api/"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchUserData()
    }

}

// MARK: - Networking
extension MainViewController {
    private func fetchUserData() {
        guard let userURL = URL(string: Links.userDataURL.rawValue) else { return }
        
        URLSession.shared.dataTask(with: userURL) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "Error with no data")
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let user = try decoder.decode(User.self, from: data)
                print(user)
            } catch {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
}
