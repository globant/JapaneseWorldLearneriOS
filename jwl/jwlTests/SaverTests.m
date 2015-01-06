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

@property (strong,nonatomic) Saver* saver;
@property (strong,nonatomic) Searcher* searcher;
@end

@implementation SaverTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
	self.saver = [[Saver alloc]init];
	self.searcher = [[Searcher alloc]init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}
/*
-(void)testSaveWord {
	NSEntityDescription* entity = [NSEntityDescription entityForName:@"Word" inManagedObjectContext:[[CoreDataHelper sharedInstance]managedObjectContext]];
	Word* word = [[Word alloc] initWithEntity:entity insertIntoManagedObjectContext:nil];
	[word setIdentifier:[NSNumber numberWithInt:1]];
	[word setTranslation:@"hola"];
	[word setJapanese:@"こんいちわ"];
	BOOL result = [self.saver saveWord:word];
	XCTAssertTrue(result);
}

-(void)testSaveUnit {
	NSEntityDescription *entity = [NSEntityDescription entityForName:@"Unit" inManagedObjectContext:[[CoreDataHelper sharedInstance] managedObjectContext]];
	Unit* unit = [[Unit alloc]initWithEntity:entity insertIntoManagedObjectContext:nil];
	Searcher* searcher = [[Searcher alloc]init];
	Word* word = [searcher searchWordByIdentifier:[NSNumber numberWithInt:1]];
	[unit setIdentifier:[NSNumber numberWithInt:1]];
	[unit setName:@"Prueba Unit"];
	[unit setWords:[NSSet setWithObject:word]];
	BOOL result = [self.saver saveUnit:unit];
	XCTAssertTrue(result);
}


-(void)testSaveBook {
	NSEntityDescription *entity = [NSEntityDescription entityForName:@"Book" inManagedObjectContext:[[CoreDataHelper sharedInstance] managedObjectContext]];
	Book* book = [[Book alloc]initWithEntity:entity insertIntoManagedObjectContext:nil];
	Unit* unit = [self.searcher searchUnitByIdentifier:[NSNumber numberWithInt:1]];
	[book setIdentifier:[NSNumber numberWithInt:1]];
	[book setName:@"Test Book"];
	[book setUnits:[NSSet setWithObject:unit]];
	BOOL result = [self.saver saveBook:book];
	XCTAssertTrue(result);
}
*/
@end
