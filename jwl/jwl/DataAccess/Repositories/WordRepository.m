//
//  WordRepository.m
//  jwl
//
//  Created by Gabriel Verdi on 12/15/14.
//  Copyright (c) 2014 Gabriel Verdi. All rights reserved.
//

#import "WordRepository.h"
#import "CoreDataHelper.h"

@implementation WordRepository

NSString* const wordClass = @"Word";

+(BOOL)saveWord:(Word *)word {
	NSManagedObjectContext *context = [[CoreDataHelper sharedInstance] managedObjectContext];
	Word* object = [NSEntityDescription insertNewObjectForEntityForName:wordClass inManagedObjectContext:context];
	[object setKanji:[word kanji]];
	[object setTranslation:[word translation]];
	[object setIdentifier:[word identifier]];
	NSError* localError = nil;
	if(![context save:&localError]) {
		NSLog([NSString stringWithFormat:@"Error, could not save: %@",[localError localizedDescription]],nil);
		[context rollback];
		return FALSE;
	}
	return TRUE;
}

+(BOOL)removeWord:(Word *)word {
 /*
	NSManagedObjectContext *context = [[CoreDataHelper sharedInstance] managedObjectContext];
	[context deleteObject:word];
	NSError* error = nil;
	if(![context save:&error]) {
		NSLog([NSString stringWithFormat:@"Error, couldn't delete: %@", [error localizedDescription]],nil);
		[context rollback];
		return FALSE;
	}
 */
	return TRUE;

}


+(NSArray*)searchBookWithPredicates:(NSCompoundPredicate *)predicates {
	return [super searchAllWithPredicates:predicates andClassName:wordClass];
}

+(Word*)searchWordWithIdentifier:(int)identifier {
	return (Word*) [super searchWithId:identifier andClassName:wordClass];
}

@end
