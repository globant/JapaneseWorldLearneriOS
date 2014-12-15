//
//  SaverTests.m
//  jwl
//
//  Created by Gabriel Verdi on 12/15/14.
//  Copyright (c) 2014 Gabriel Verdi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Saver.h"

@interface SaverTests : XCTestCase

@end

@implementation SaverTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)testSaveBook {
	Saver* saver = [[Saver alloc]init];
	Book* book = [[Book alloc]init];
	[book setName:@"Test Book"];
	BOOL result = [saver saveBook:book];
	XCTAssertTrue(result);
}


@end
