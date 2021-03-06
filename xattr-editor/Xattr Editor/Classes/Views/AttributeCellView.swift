//
//  AttributeCellView.swift
//  Xattr Editor
//
//  Created by Richard Csiko on 2017. 01. 22..
//

import Cocoa

class AttributeCellView: NSTableCellView {

    public var attributeDidChangeCallback: (() -> Void)?

    var attribute: Attribute? {
        didSet {
            guard let attr = attribute else { return }
            textField?.stringValue = attr.name
        }
    }

    override func awakeFromNib() {
        textField?.target = self
        textField?.action = #selector(didEndEditing(_:))
    }

    @IBAction func didEndEditing(_ sender: NSTextField) {
        guard let attribute = attribute else { return }
        guard let callback = attributeDidChangeCallback else { return }

        attribute.name = sender.stringValue
        callback()
    }

}
