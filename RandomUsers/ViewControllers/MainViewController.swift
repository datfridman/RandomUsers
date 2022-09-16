//
//  ViewController.swift
//  RandomUsers
//
//  Created by Leon Fridman on 9/16/22.
//

import UIKit

class MainViewController: UIViewController {
    
    private let userDataURL = "https://randomuser.me/api/"

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchUserData()
    }

}

// MARK: - Networking
extension MainViewController {
    private func fetchUserData() {
        guard let userURL = URL(string: userDataURL) else { return }
        
        let session = URLSession(configuration: .default)
        
        let getUserDataTask = session.dataTask(with: userURL) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "Error with no data")
                return
            }
            
            let jsonDecoder = JSONDecoder()
            
            do {
                let user = try jsonDecoder.decode(User.self, from: data)
                print(user)
                let randu = user.results
            } catch {
                print(error.localizedDescription)
            }
            
        }
        getUserDataTask.resume()
    }
}
