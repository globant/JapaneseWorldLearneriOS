//
//  UserRepository.m
//  jwl
//
//  Created by Gabriel Verdi on 12/22/14.
//  Copyright (c) 2014 Gabriel Verdi. All rights reserved.
//

#import "UserRepository.h"
#import "User.h"
#import "CoreDataHelper.h"

@implementation UserRepository

NSString* const userClass = @"User";

+(User*)searchWordWithIdentifier:(int)identifier {
	return (User*) [super searchWithId:identifier andClassName:userClass];
}

+(BOOL)saveUser:(User*)user {
	NSManagedObjectContext *context = [[CoreDataHelper sharedInstance] managedObjectContext];
	User* object = [NSEntityDescription insertNewObjectForEntityForName:userClass inManagedObjectContext:context];
	[object setIdentifier:[user identifier]];
	[object setHits:[user hits]];
	[object setMiss:[user miss]];
	[object setScore:[user score]];
	[object setTotal:[user total]];
	NSError* localError = nil;
	if(![context save:&localError]) {
		NSLog([NSString stringWithFormat:@"Error, could not save: %@",[localError localizedDescription]],nil);
		[context rollback];
		return FALSE;
	}
	return TRUE;
}

+(BOOL)updateUser:(User *)user {
	NSManagedObjectContext *context = [[CoreDataHelper sharedInstance] managedObjectContext];
	NSError *error;
	if([user.managedObjectContext hasChanges] && ![user.managedObjectContext save:&error]) {
		NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
		[context rollback];
		return FALSE;
	}
	return TRUE;
}

@end
