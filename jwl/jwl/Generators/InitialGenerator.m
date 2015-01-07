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

+(NSString *) pathForDataFile;

@end

@implementation InitialGenerator

+(NSString *) pathForDataFile {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString* directory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSError* error;
    
    directory = [directory stringByExpandingTildeInPath];
    
    if ([fileManager fileExistsAtPath: directory] == NO)
    {
        
        [fileManager createDirectoryAtPath:directory withIntermediateDirectories:YES attributes:nil error:&error];
    }
    
    NSString *fileName = [directory stringByAppendingString:@"/jwl.ios"];
    
    return fileName;
}

+(void)saveData {
    Word* word = [[Word alloc]init];
    [word setIdentifier:[NSNumber numberWithInt:0]];
    [word setJapanese:@"日本人"];
    [word setTranslation:@"japones"];
    
    Word* word2 = [[Word alloc]init];
    [word2 setIdentifier:[NSNumber numberWithInt:1]];
    [word2 setJapanese:@"食べ物"];
    [word2 setTranslation:@"comida"];
    
    NSMutableArray* words = [NSMutableArray new];
    [words addObject:word];
    [words addObject:word2];
    
    Unit* unit = [[Unit alloc] init];
    [unit setIdentifier:0];
    [unit setName:@"Unidad 1"];
    [unit setWords:words];
    
    Word* word3 = [[Word alloc]init];
    [word3 setIdentifier:[NSNumber numberWithInt:2]];
    [word3 setJapanese:@"せんぱい"];
    [word3 setTranslation:@"senpai"];
    
    Word* word4 = [[Word alloc]init];
    [word4 setIdentifier:[NSNumber numberWithInt:3]];
    [word4 setJapanese:@"へんたい"];
    [word4 setTranslation:@"hentai"];
    
    Word* word5 = [[Word alloc]init];
    [word5 setIdentifier:[NSNumber numberWithInt:3]];
    [word5 setJapanese:@"猫"];
    [word5 setTranslation:@"gato"];
    
    NSMutableArray* words2 = [NSMutableArray new];
    [words2 addObject:word3];
    [words2 addObject:word4];
    [words2 addObject:word5];
    Unit* unit2 = [[Unit alloc] init];
    [unit2 setIdentifier:[NSNumber numberWithInt:1]];
    [unit2 setName:@"Unidad 2"];
    [unit2 setWords:words2];
    
    NSMutableArray* units = [NSMutableArray new];
    [units addObject:unit];
    [units addObject:unit2];
    
    Book* book = [[Book alloc]init];
    [book setIdentifier:[NSNumber numberWithInt:0]];
    [book setName:@"Libro 1"];
    [book setUnits:units];
    
    Book* book2 = [[Book alloc]init];
    [book2 setIdentifier:[NSNumber numberWithInt:1]];
    [book2 setName:@"Libro 2"];
    
    NSString *path = [InitialGenerator pathForDataFile];
    
    NSMutableDictionary *rootObject = [NSMutableDictionary new];
    
    [rootObject setObject:book forKey:@"book"];
    [rootObject setObject:book2 forKey:@"book2"];
    
    [NSKeyedArchiver archiveRootObject: rootObject toFile: path];
}

+(NSMutableDictionary*)loadData {
    NSString *path = [InitialGenerator pathForDataFile];
    NSMutableDictionary *rootObject;
    rootObject = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    
    return rootObject;
}

/*
-(void)initialBookGenerator {
	Saver* saver = [[Saver alloc]init];
	NSEntityDescription* entity = [NSEntityDescription entityForName:@"Word" inManagedObjectContext:[[CoreDataHelper sharedInstance]managedObjectContext]];
	Word* word = [[Word alloc] initWithEntity:entity insertIntoManagedObjectContext:nil];
	
	[word setIdentifier:[NSNumber numberWithInt:0]];
	[word setJapanese:@"日本人"];
	[word setTranslation:@"japones"];
	
	[saver saveWord:word];
	
	Word* word2 = [[Word alloc] initWithEntity:entity insertIntoManagedObjectContext:nil];
	
	[word2 setIdentifier:[NSNumber numberWithInt:1]];
	[word2 setJapanese:@"食べ物"];
	[word2 setTranslation:@"comida"];
	
	[saver saveWord:word2];
	
	NSEntityDescription* unitEntity = [NSEntityDescription entityForName:@"Unit" inManagedObjectContext:[[CoreDataHelper sharedInstance]managedObjectContext]];
	
	Searcher* searcher = [[Searcher alloc]init];
	
	Word* wordUnit1 = [searcher searchWordByIdentifier:0];
	Word* wordUnit2 = [searcher searchWordByIdentifier:1];
	
	Unit* unit = [[Unit alloc] initWithEntity:unitEntity insertIntoManagedObjectContext:nil];
	
	[unit setIdentifier:[NSNumber numberWithInt:0]];
	[unit setName:@"Unidad 1"];
	[unit setWords:[NSSet setWithObjects:wordUnit1,wordUnit2, nil]];
	
	[saver saveUnit:unit];

	
	NSEntityDescription* bookEntity = [NSEntityDescription entityForName:@"Book" inManagedObjectContext:[[CoreDataHelper sharedInstance]managedObjectContext]];
	
	Book* book = [[Book alloc]initWithEntity:bookEntity insertIntoManagedObjectContext:nil];
	Unit* unitBook = [searcher searchUnitByIdentifier:0];
	[book setIdentifier:[NSNumber numberWithInt:0]];
	[book setName:@"Libro 1"];
	[book setUnits:[NSSet setWithObjects:unitBook,nil]];
	
	[saver saveBook:book];
	
}
*/
@end
