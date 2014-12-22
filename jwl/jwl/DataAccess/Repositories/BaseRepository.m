//
//  BaseRepository.m
//  jwl
//
//  Created by Gabriel Verdi on 12/19/14.
//  Copyright (c) 2014 Gabriel Verdi. All rights reserved.
//

#import "BaseRepository.h"
#import "CoreDataHelper.h"

@implementation BaseRepository

+(NSArray*)searchAllWithPredicates:(NSCompoundPredicate*)predicates andClassName:(NSString*)className {
	NSManagedObjectContext *context = [[CoreDataHelper sharedInstance] managedObjectContext];
	NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
	NSEntityDescription *entity = [NSEntityDescription
								   entityForName:className
								   inManagedObjectContext:context];
	
	[fetchRequest setEntity:entity];
	[fetchRequest setReturnsObjectsAsFaults:NO];
	[fetchRequest setPredicate:predicates];
	NSError *error;
	NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
	if(error) {
		NSLog([NSString stringWithFormat:@"Error recovering %@",[error localizedDescription]], nil);
		return nil;
	}
	else {
		if(fetchedObjects.count > 0) {
			return fetchedObjects;
		}
		else {
			NSLog(@"Fetched Objects 0");
			return nil;
		}
	}
}

+(BaseEntity*)searchWithId:(int)identifier andClassName:(NSString*) className {
	NSManagedObjectContext *context = [[CoreDataHelper sharedInstance] managedObjectContext];
	NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
	NSEntityDescription *entity = [NSEntityDescription
								   entityForName:className
								   inManagedObjectContext:context];
	
	[fetchRequest setEntity:entity];
	[fetchRequest setReturnsObjectsAsFaults:NO];
	NSPredicate* identifierPredicate = [NSPredicate predicateWithFormat:@"identifier == %d",identifier];
	[fetchRequest setPredicate:identifierPredicate];
	NSError *error;
	NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
	if(error) {
		NSLog([NSString stringWithFormat:@"Error recovering %@",[error localizedDescription]], nil);
		return nil;
	}
	else {
		if(fetchedObjects.count > 0) {
			return [fetchedObjects objectAtIndex:0];
		}
		else {
			NSLog(@"Fetched Objects 0");
			return nil;
		}
	}

}

@end
