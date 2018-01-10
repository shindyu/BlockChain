//
//  ViewController.swift
//  BlockChain
//
//  Created by shindyu on 2018/01/09.
//  Copyright © 2018年 shindyu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private let myId = "me"
    private let recipientId = "someone"
    let button = UIButton()
    let logView = UITextView()
    let chainView = UITextView()
    let server = BlockChainService()
    let dateProvider = DefaultDateProvider()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        view.addSubview(button)
        view.addSubview(logView)
        view.addSubview(chainView)

        button.setTitle("mine", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(mineBtnTapped), for: .touchUpInside)

        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: view.topAnchor, constant: 50.0).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        logView.translatesAutoresizingMaskIntoConstraints = false
        logView.topAnchor.constraint(equalTo: button.bottomAnchor).isActive = true
        logView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        logView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        logView.heightAnchor.constraint(equalToConstant: 200.0).isActive = true

        chainView.translatesAutoresizingMaskIntoConstraints = false
        chainView.topAnchor.constraint(equalTo: logView.bottomAnchor).isActive = true
        chainView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        chainView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        chainView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

    private func updateChain() {
        let chain = server.chain()
        var text = "chain:\n"
        for block in chain {
            text.append("\(block)\n")
//            text.append(String(describing: type(of: block.self)) + "\n")
        }
        chainView.text = text
        print(text)
    }

    func sendBtnTapped(_ sender: UIButton) {
        let index = server.send(sender: myId, recipient: recipientId, amount: 5)
        let text = "Transaction will be added to Block \(index)"
        logView.text = text + "\n" + logView.text
        print(text)
        updateChain()
    }

    @objc func mineBtnTapped(_ sender: UIButton) {
        let startTime = dateProvider.timestamp()
        let block = server.mine(recipient: myId)
        let endTime = dateProvider.timestamp()

        let text = "New Block Forged *** time: \(endTime - startTime) (s)"
        logView.text = text + "\n" + logView.text
        print(text+String(describing: type(of: block.self)))
        updateChain()
    }
}

