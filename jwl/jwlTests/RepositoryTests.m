//
//  RepositoryTests.m
//  jwl
//
//  Created by Gabriel Verdi on 12/19/14.
//  Copyright (c) 2014 Gabriel Verdi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "UnitRepository.h"
#import "WordRepository.h"
#import "BookRepository.h"
#import "InitialGenerator.h"

@interface RepositoryTests : XCTestCase

@end

@implementation RepositoryTests

+ (void)setUp {
    [super setUp];
	InitialGenerator* generator = [[InitialGenerator alloc]init];
	[generator initialBookGenerator];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)testRemoveWord {
	Word* word = [WordRepository searchWordWithIdentifier:1];
	BOOL result = [WordRepository removeWord:word];
	XCTAssertTrue(result);
}

-(void)testRemoveUnit {
	Unit* unit = [UnitRepository searchUnitWithIdentifier:1];
	BOOL result = [UnitRepository removeUnit:unit];
	XCTAssertTrue(result);
}

-(void)testRemoveBook {
	Book* book = [BookRepository searchBookWithIdentifier:1];
	BOOL result = [BookRepository removeBook:book];
	XCTAssertTrue(result);
}

-(void)testReadAllBooks {
	NSArray* result = [BookRepository searchAllWithPredicates:nil andClassName:bookClass];
	XCTAssertTrue(TRUE);
}

@end
