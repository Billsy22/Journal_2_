//
//  EntryDetailViewController.swift
//  Journal_2_
//
//  Created by Taylor Bills on 2/7/19.
//  Copyright © 2019 Taylor Bills. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController {
    
    // MARK: -  Properties
    var entry: Entry?
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextField: UITextView!
    
    // MARK: -  LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    // MARK: -  Actions
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let title = titleTextField.text, let body = bodyTextField.text else { return }
        if entry != nil {
            EntryController.shared.update(entry: entry!, newTitle: title, newBody: body)
        } else {
            EntryController.shared.addNewEntry(title: title, body: body)
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: -  UpdateViews
    func updateViews() {
        if entry != nil {
            titleTextField.text = entry?.title
            bodyTextField.text = entry?.body
        }
    }
}
