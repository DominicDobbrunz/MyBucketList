//
//  EditTip.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 07.03.25.
//

import Foundation
import TipKit

struct EditTip: Tip {
    
    var title: Text {
        Text("Hinzufügen")
    }
    var message: Text? {
        Text("Hier drüber kannst du eine neue Bucket hinzufügen. ✈️")
    }
    var image: Image? {
        Image(systemName: "plus")
    }
}
