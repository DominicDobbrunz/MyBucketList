//
//  AddLikeTip.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 07.03.25.
//

import Foundation
import TipKit

struct AddLikeTip: Tip {
    
    var title: Text {
        Text("Hinzufügen")
    }
    var message: Text? {
        Text("Hier drüber kannst du ein Highlight hinzufügen. 🏞️")
    }
    var image: Image? {
        Image(systemName: "plus")
    }
}
