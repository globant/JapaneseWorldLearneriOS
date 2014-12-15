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
#import "CoreDataHelper.h"
#import "Searcher.h"

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
	NSEntityDescription *entity = [NSEntityDescription entityForName:@"Book" inManagedObjectContext:[[CoreDataHelper sharedInstance] managedObjectContext]];
	Book* book = [[Book alloc]initWithEntity:entity insertIntoManagedObjectContext:[[CoreDataHelper sharedInstance] managedObjectContext]];
	[book setName:@"Test Book"];
	[book setIdentifier:[NSNumber numberWithInt:1]];
	BOOL result = [saver saveBook:book];
	XCTAssertTrue(result);
}

-(void)testRemoveBook {
	Searcher* searcher = [[Searcher alloc]init];
	Book* result = [searcher searchBookByIdentifier:[NSNumber numberWithInt:1]];
	XCTAssertTrue([[result name]isEqualToString:@"Test Book"]);
}

@end
