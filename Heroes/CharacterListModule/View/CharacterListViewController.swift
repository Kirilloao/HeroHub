//
//  ViewController.swift
//  Heroes
//
//  Created by Kirill Taraturin on 26.10.2023.
//

import UIKit

// MARK: - CharacterListProtocol
protocol CharacterListProtocol: AnyObject {
    func success()
    func failure(error: NetworkError)
}


class CharacterListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

