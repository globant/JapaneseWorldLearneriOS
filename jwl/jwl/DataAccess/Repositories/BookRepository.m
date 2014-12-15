//
//  BookRepository.m
//  jwl
//
//  Created by Gabriel Verdi on 12/15/14.
//  Copyright (c) 2014 Gabriel Verdi. All rights reserved.
//

#import "BookRepository.h"
#import <CoreData/CoreData.h>
#import "CoreDataHelper.h"

#define bookClass @"Book"

@implementation BookRepository


+(BOOL)saveBook:(Book *)book {
	NSManagedObjectContext *context = [[CoreDataHelper sharedInstance] managedObjectContext];
	Book* object = [NSEntityDescription insertNewObjectForEntityForName:bookClass inManagedObjectContext:context];
	[object setName:[book name]];
	NSError* localError;
	if(![context save:&localError]) {
		NSLog([NSString stringWithFormat:@"Error, could not save: %@",[localError localizedDescription]],nil);
		[context rollback];
		return FALSE;
	}
	return TRUE;
}

+(BOOL)removeBook:(Book *)book {
	NSManagedObjectContext *context = [[CoreDataHelper sharedInstance] managedObjectContext];
	[context deleteObject:book];
	NSError* error = nil;
	if(![context save:&error]) {
		NSLog([NSString stringWithFormat:@"Error, couldn't delete: %@", [error localizedDescription]],nil);
		[context rollback];
		return FALSE;
	}
	return TRUE;
}

@end
