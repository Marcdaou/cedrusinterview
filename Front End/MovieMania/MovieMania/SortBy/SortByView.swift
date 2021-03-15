//
//  SortByView.swift
//  MovieMania
//
//  Created by Unisoft on 3/15/21.
//

import UIKit

class SortByView: UIViewController {

    @IBOutlet var pickerView: UIPickerView!

    private var sortBy: [String] = []

    override func viewDidLoad() {

        super.viewDidLoad()

        pickerView.delegate = self
        pickerView.dataSource = self
        loadData()
    }

    func loadData() {

        sortBy.removeAll()

        sortBy.append("Relevance")
        sortBy.append("New Items")
        sortBy.append("Price (Hight First)")
        sortBy.append("Price (Low First)")

        refreshPickerView()
    }

    func refreshPickerView() {

        pickerView.reloadAllComponents()
    }

    @IBAction func actionClose(_ sender: UIButton) {

        dismiss(animated: true, completion: nil)
    }

    @IBAction func actionDone(_ sender: UIButton) {

        dismiss(animated: true, completion: nil)
    }
}

extension SortByView: UIPickerViewDataSource {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {

        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {

        sortBy.count
    }
}


extension SortByView: UIPickerViewDelegate {

    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {

        return 45
    }

    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {

        let label = UILabel()
        label.text = sortBy[row]
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        return label
    }
}
