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
    
    NSMutableArray* words = [NSMutableArray new];
    int i = 0;
    for (NSString* key in allKanjis) {
        Word* word = [[Word alloc]init];
        [word setIdentifier:[NSNumber numberWithInt: i ]];
        [word setKanji: [allKanjis objectForKey: key ]];
        [word setTranslation: key ];
        [word setHiragana: [allHiraganas objectForKey:key]];
        [words addObject:word];
        i++;
    }
    
    Unit* unit = [[Unit alloc] init];
    [unit setIdentifier:0];
    [unit setName:@"Unidad 1"];
    [unit setWords:words];
    
    NSMutableArray* units = [NSMutableArray new];
    [units addObject:unit];
    
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

@end
