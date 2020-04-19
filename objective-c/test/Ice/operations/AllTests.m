//
// Copyright (c) ZeroC, Inc. All rights reserved.
//

#import <objc/Ice.h>
#import <TestCommon.h>
#import <OperationsTest.h>

id<TestOperationsMyClassPrx>
operationsAllTests(id<ICECommunicator> communicator)
{
    NSString* ref = [NSString stringWithFormat:@"test:%@", getTestEndpoint(communicator, 0)];
    id<ICEObjectPrx> base = [communicator stringToProxy:(ref)];
    id<TestOperationsMyClassPrx> cl = [TestOperationsMyClassPrx checkedCast:base];
    id<TestOperationsMyDerivedClassPrx> derived = [TestOperationsMyDerivedClassPrx checkedCast:cl];
    id<TestOperationsMBPrx> bprx =
        [TestOperationsMBPrx checkedCast:[communicator stringToProxy: [NSString stringWithFormat:@"b:%@", getTestEndpoint(communicator, 0)]]];

    tprintf("testing twoway operations... ");
    void twoways(id<ICECommunicator>, id<TestOperationsMyClassPrx>, id<TestOperationsMBPrx>);
    twoways(communicator, cl, bprx);
    twoways(communicator, derived, bprx);
    [derived opDerived];
    tprintf("ok\n");

    tprintf("testing oneway operations... ");
    void oneways(id<ICECommunicator>, id<TestOperationsMyClassPrx>);
    oneways(communicator, cl);
    tprintf("ok\n");

    tprintf("testing twoway operations with AMI... ");
    void twowaysAMI(id<ICECommunicator>, id<TestOperationsMyClassPrx>);
    twowaysAMI(communicator, cl);
    twowaysAMI(communicator, derived);
    tprintf("ok\n");

    tprintf("testing oneway operations with AMI... ");
    void onewaysAMI(id<ICECommunicator>, id<TestOperationsMyClassPrx>);
    onewaysAMI(communicator, cl);
    tprintf("ok\n");

    tprintf("testing batch oneway operations... ");
    void batchOneways(id<TestOperationsMyClassPrx>);
    batchOneways(cl);
    batchOneways(derived);
    tprintf("ok\n");

    tprintf("testing batch oneway operations with AMI... ");
    void batchOnewaysAMI(id<TestOperationsMyClassPrx>);
    batchOnewaysAMI(cl);
    batchOnewaysAMI(derived);
    tprintf("ok\n");

    return cl;
}
