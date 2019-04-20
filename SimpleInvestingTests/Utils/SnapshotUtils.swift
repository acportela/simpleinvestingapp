//
//  SnapshotUtils.swift
//  SimpleInvestingTests
//
//  Created by Antonio Rodrigues on 20/04/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import Nimble
import Nimble_Snapshots
@testable import SimpleInvesting

func matchSnapshot(named name: String,
                   record: Bool = false) -> Predicate<Snapshotable> {
    if record {
        return recordSnapshot(named: name)
    } else {
        return haveValidSnapshot(named: name, tolerance: 0)
    }
}
