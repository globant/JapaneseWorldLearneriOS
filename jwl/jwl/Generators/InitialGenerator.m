//
//  InitialGenerator.m
//  jwl
//
//  Created by Gabriel Verdi on 12/19/14.
//  Copyright (c) 2014 Gabriel Verdi. All rights reserved.
//

#import "InitialGenerator.h"
#import "Saver.h"
#import "Searcher.h"
#import "CoreDataHelper.h"

@interface InitialGenerator()


@end

@implementation InitialGenerator

-(void)initialBookGenerator {
	Saver* saver = [[Saver alloc]init];
	NSEntityDescription* entity = [NSEntityDescription entityForName:@"Word" inManagedObjectContext:[[CoreDataHelper sharedInstance]managedObjectContext]];
	Word* word = [[Word alloc] initWithEntity:entity insertIntoManagedObjectContext:nil];
	
	[word setIdentifier:[NSNumber numberWithInt:1]];
	[word setJapanese:@"日本人"];
	[word setTranslation:@"japones"];
	
	[saver saveWord:word];
	
	Word* word2 = [[Word alloc] initWithEntity:entity insertIntoManagedObjectContext:nil];
	
	[word2 setIdentifier:[NSNumber numberWithInt:2]];
	[word2 setJapanese:@"食べ物"];
	[word2 setTranslation:@"comida"];
	
	[saver saveWord:word2];
	
	NSEntityDescription* unitEntity = [NSEntityDescription entityForName:@"Unit" inManagedObjectContext:[[CoreDataHelper sharedInstance]managedObjectContext]];
	
	Searcher* searcher = [[Searcher alloc]init];
	
	Word* wordUnit1 = [searcher searchWordByIdentifier:1];
	Word* wordUnit2 = [searcher searchWordByIdentifier:2];
	
	Unit* unit = [[Unit alloc] initWithEntity:unitEntity insertIntoManagedObjectContext:nil];
	
	[unit setIdentifier:[NSNumber numberWithInt:1]];
	[unit setName:@"Unidad 1"];
	[unit setWords:[NSSet setWithObjects:wordUnit1,wordUnit2, nil]];
	
	[saver saveUnit:unit];

	
	NSEntityDescription* bookEntity = [NSEntityDescription entityForName:@"Book" inManagedObjectContext:[[CoreDataHelper sharedInstance]managedObjectContext]];
	
	Book* book = [[Book alloc]initWithEntity:bookEntity insertIntoManagedObjectContext:nil];
	Unit* unitBook = [searcher searchUnitByIdentifier:1];
	[book setIdentifier:[NSNumber numberWithInt:3]];
	[book setName:@"Libro 1"];
	[book setUnits:[NSSet setWithObjects:unitBook,nil]];
	
	[saver saveBook:book];
	
}

@end
