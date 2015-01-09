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
    
    NSDictionary* allKanjis = [[NSDictionary alloc] initWithObjectsAndKeys:
                               @"会う", @"to meet",
                               @"青", @"blue",
                               nil];
    
    NSDictionary* allHiraganas= [[NSDictionary alloc] initWithObjectsAndKeys:
                               @"あう", @"to meet",
                               @"あお", @"blue",
                               nil];
    
    NSDictionary* allUnits= [[NSDictionary alloc] initWithObjectsAndKeys:
                                 @"Unit 1", @"0",
                                 @"Unit 2", @"1",
                                 @"Unit 3", @"2",
                                 nil];
    
    NSDictionary* allBooks= [[NSDictionary alloc] initWithObjectsAndKeys:
                             @"Book 1", @"0",
                             @"Book 2", @"1",
                             @"Book 3", @"2",
                             nil];
    
    NSMutableArray* allWords = [NSMutableArray new];
    
    int i = 0;
    for (NSString* key in allKanjis) {
        Word* word = [[Word alloc]init];
        [word setIdentifier:[NSNumber numberWithInt: i ]];
        [word setKanji: [allKanjis objectForKey: key ]];
        [word setTranslation: key ];
        [word setHiragana: [allHiraganas objectForKey:key]];
        [allWords addObject:word];
        i++;
    }
    
    NSMutableArray* units = [NSMutableArray new];
    
    for (NSString* key in allUnits) {
        
        //string key to NSNumber
        NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
        [f setNumberStyle:NSNumberFormatterDecimalStyle];
        NSNumber * unitId = [f numberFromString:key];
        
        Unit* unit = [[Unit alloc] init];
        [unit setIdentifier: unitId ];
        [unit setName:[allUnits objectForKey: key ]];
        
        //words rage for this unit
        NSArray* range = [NSArray new];
        range = [self getWordsRangeForUnit:key];
        NSMutableArray* words = [NSMutableArray new];
        for (i = 0; i <= [range[1] intValue]; i++) {
            [words addObject:allWords[i]];
        }
        [unit setWords:words];
        [units addObject:unit];
    }
    
    NSString *path = [InitialGenerator pathForDataFile];
    NSMutableDictionary *rootObject = [NSMutableDictionary new];
    
    for (NSString* key in allBooks) {
        
        //string key to NSNumber
        NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
        [f setNumberStyle:NSNumberFormatterDecimalStyle];
        NSNumber * bookId = [f numberFromString:key];
        
        Book* book = [[Book alloc] init];
        [book setIdentifier: bookId ];
        [book setName:[allBooks objectForKey: key ]];
        
        //units rage for this book
        NSArray* range = [NSArray new];
        range = [self getUnitsRangeForBook: key];
        NSMutableArray* bookUnits = [NSMutableArray new];
        for (i = 0; i <= [range[1] intValue]; i++) {
            [bookUnits addObject:units[i]];
        }
        [book setUnits:bookUnits];
        [rootObject setObject:book forKey: [book name] ];
    }
    
    [NSKeyedArchiver archiveRootObject: rootObject toFile: path];
}

+(NSMutableDictionary*)loadData {
    NSString *path = [InitialGenerator pathForDataFile];
    NSMutableDictionary *rootObject;
    rootObject = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    
    return rootObject;
}

+(NSArray*) getWordsRangeForUnit:(NSString*)unitId{
    NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
    [f setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber* unitNumber = [f numberFromString:unitId];
    int unit = [unitNumber intValue];
    
    switch (unit) {
        case 0:
            return @[@0, @1];
            break;
        case 1:
            return @[@0, @1];
            break;
            
        default:
            return @[@0, @1];
            break;
    }
}

+(NSArray*) getUnitsRangeForBook:(NSString*)bookId{
    NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
    [f setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber* bookNumber = [f numberFromString:bookId];
    int book = [bookNumber intValue];
    
    switch (book) {
        case 0:
            return @[@0, @2];
            break;
            
        default:
            return @[@0, @2];
            break;
    }
}

@end
