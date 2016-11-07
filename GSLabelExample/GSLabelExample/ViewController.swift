//
//  ViewController.swift
//  GSLabelExample
//

import UIKit

class ViewController: UIViewController {
    // MARK: Properties

    @IBOutlet var contentInsetsSwitch: UISwitch!
    @IBOutlet var roundedCornersSwitch: UISwitch!
    @IBOutlet var labels: [GSLabel]!

    // MARK: IBActions

    @IBAction func valueChanged(_ sender: UISwitch) {
        if sender == contentInsetsSwitch {
            labels.forEach {
                if (sender.isOn) {
                    let inset = $0.font.pointSize / 4
                    $0.contentInsets = UIEdgeInsetsMake(inset, inset, inset, inset)
                } else {
                    $0.contentInsets = .zero
                }
            }
        } else if sender == roundedCornersSwitch {
            labels.forEach {
                if (sender.isOn) {
                    $0.layer.cornerRadius = $0.font.pointSize / 4
                } else {
                    $0.layer.cornerRadius = 0
                }
            }
        }
    }
}
