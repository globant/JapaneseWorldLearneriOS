//
//  WordRepository.m
//  jwl
//
//  Created by Gabriel Verdi on 12/15/14.
//  Copyright (c) 2014 Gabriel Verdi. All rights reserved.
//

#import "WordRepository.h"
#import "CoreDataHelper.h"

#define wordClass @"Word"

@implementation WordRepository

+(BOOL)saveWord:(Word *)word {
	NSManagedObjectContext *context = [[CoreDataHelper sharedInstance] managedObjectContext];
	Word* object = [NSEntityDescription insertNewObjectForEntityForName:wordClass inManagedObjectContext:context];
	[object setJapanese:[word japanese]];
	[object setTranslation:[word translation]];
	[object setUnit:[word unit]];
	NSError* localError;
	if(![context save:&localError]) {
		NSLog([NSString stringWithFormat:@"Error, could not save: %@",[localError localizedDescription]],nil);
		[context rollback];
		return FALSE;
	}
	return TRUE;
}

+(BOOL)removeWord:(Word *)word {
	NSManagedObjectContext *context = [[CoreDataHelper sharedInstance] managedObjectContext];
	[context deleteObject:word];
	NSError* error = nil;
	if(![context save:&error]) {
		NSLog([NSString stringWithFormat:@"Error, couldn't delete: %@", [error localizedDescription]],nil);
		[context rollback];
		return FALSE;
	}
	return TRUE;

}
@end
