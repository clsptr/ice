//
// Copyright (c) ZeroC, Inc. All rights reserved.
//

import Ice
import TestCommon

class TestI: TestIntf {
    var _helper: TestHelper

    init(_ helper: TestHelper) {
        _helper = helper
    }

    func baseAsBase(current _: Current) throws {
        throw Base(b: "Base.b")
    }

    func unknownDerivedAsBase(current _: Current) throws {
        throw UnknownDerived(b: "UnknownDerived.b", ud: "UnknownDerived.ud")
    }

    func knownDerivedAsBase(current _: Current) throws {
        throw KnownDerived(b: "KnownDerived.b", kd: "KnownDerived.kd")
    }

    func knownDerivedAsKnownDerived(current _: Current) throws {
        throw KnownDerived(b: "KnownDerived.b", kd: "KnownDerived.kd")
    }

    func unknownIntermediateAsBase(current _: Current) throws {
        throw UnknownIntermediate(b: "UnknownIntermediate.b", ui: "UnknownIntermediate.ui")
    }

    func knownIntermediateAsBase(current _: Current) throws {
        throw KnownIntermediate(b: "KnownIntermediate.b", ki: "KnownIntermediate.ki")
    }

    func knownMostDerivedAsBase(current _: Current) throws {
        throw KnownMostDerived(b: "KnownMostDerived.b", ki: "KnownMostDerived.ki", kmd: "KnownMostDerived.kmd")
    }

    func knownIntermediateAsKnownIntermediate(current _: Current) throws {
        throw KnownIntermediate(b: "KnownIntermediate.b", ki: "KnownIntermediate.ki")
    }

    func knownMostDerivedAsKnownIntermediate(current _: Current) throws {
        throw KnownMostDerived(b: "KnownMostDerived.b", ki: "KnownMostDerived.ki", kmd: "KnownMostDerived.kmd")
    }

    func knownMostDerivedAsKnownMostDerived(current _: Current) throws {
        throw KnownMostDerived(b: "KnownMostDerived.b",
                               ki: "KnownMostDerived.ki",
                               kmd: "KnownMostDerived.kmd")
    }

    func unknownMostDerived1AsBase(current _: Current) throws {
        throw UnknownMostDerived1(b: "UnknownMostDerived1.b",
                                  ki: "UnknownMostDerived1.ki",
                                  umd1: "UnknownMostDerived1.umd1")
    }

    func unknownMostDerived1AsKnownIntermediate(current _: Current) throws {
        throw UnknownMostDerived1(b: "UnknownMostDerived1.b",
                                  ki: "UnknownMostDerived1.ki",
                                  umd1: "UnknownMostDerived1.umd1")
    }

    func unknownMostDerived2AsBase(current _: Current) throws {
        throw UnknownMostDerived2(b: "UnknownMostDerived2.b",
                                  ui: "UnknownMostDerived2.ui",
                                  umd2: "UnknownMostDerived2.umd2")
    }

    func unknownMostDerived2AsBaseCompact(current _: Current) throws {
        throw UnknownMostDerived2(b: "UnknownMostDerived2.b",
                                  ui: "UnknownMostDerived2.ui",
                                  umd2: "UnknownMostDerived2.umd2")
    }

    func knownPreservedAsBase(current _: Current) throws {
        throw KnownPreservedDerived(b: "base",
                                    kp: "preserved",
                                    kpd: "derived")
    }

    func knownPreservedAsKnownPreserved(current _: Current) throws {
        throw KnownPreservedDerived(b: "base",
                                    kp: "preserved",
                                    kpd: "derived")
    }

    func relayKnownPreservedAsBase(r: RelayPrx?, current: Current) throws {
        let p = try uncheckedCast(prx: current.con!.createProxy(r!.ice_getIdentity()),
                                  type: RelayPrx.self)
        try p.knownPreservedAsBase()
        try _helper.test(false)
    }

    func relayKnownPreservedAsKnownPreserved(r: RelayPrx?, current: Current) throws {
        let p = try uncheckedCast(prx: current.con!.createProxy(r!.ice_getIdentity()),
                                  type: RelayPrx.self)
        try p.knownPreservedAsKnownPreserved()
        try _helper.test(false)
    }

    func unknownPreservedAsBase(current _: Current) throws {
        let ex = SPreserved2()
        ex.b = "base"
        ex.kp = "preserved"
        ex.kpd = "derived"
        ex.p1 = SPreservedClass(bc: "bc", spc: "spc")
        ex.p2 = ex.p1
        throw ex
    }

    func unknownPreservedAsKnownPreserved(current _: Current) throws {
        let ex = SPreserved2()
        ex.b = "base"
        ex.kp = "preserved"
        ex.kpd = "derived"
        ex.p1 = SPreservedClass(bc: "bc", spc: "spc")
        ex.p2 = ex.p1
        throw ex
    }

    func relayUnknownPreservedAsBase(r: RelayPrx?, current: Current) throws {
        let p = try uncheckedCast(prx: current.con!.createProxy(r!.ice_getIdentity()),
                                  type: RelayPrx.self)
        try p.unknownPreservedAsBase()
        try _helper.test(false)
    }

    func relayUnknownPreservedAsKnownPreserved(r: RelayPrx?, current: Current) throws {
        let p = try uncheckedCast(prx: current.con!.createProxy(r!.ice_getIdentity()),
                                  type: RelayPrx.self)
        try p.unknownPreservedAsKnownPreserved()
        try _helper.test(false)
    }

    func shutdown(current: Current) throws {
        current.adapter!.getCommunicator().shutdown()
    }
}
