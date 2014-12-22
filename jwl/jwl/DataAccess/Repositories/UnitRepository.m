//
//  UnitRepository.m
//  jwl
//
//  Created by Gabriel Verdi on 12/15/14.
//  Copyright (c) 2014 Gabriel Verdi. All rights reserved.
//

#import "UnitRepository.h"
#import "CoreDataHelper.h"

@implementation UnitRepository

NSString* const unitClass = @"Unit";

+(BOOL)saveUnit:(Unit *)unit {
	NSManagedObjectContext *context = [[CoreDataHelper sharedInstance] managedObjectContext];
	Unit* object = [NSEntityDescription insertNewObjectForEntityForName:unitClass inManagedObjectContext:context];
	[object setIdentifier:[unit identifier]];
	[object setName:[unit name]];
	[object setWords:[unit words]];
	NSError* localError;
	if(![context save:&localError]) {
		NSLog([NSString stringWithFormat:@"Error, could not save: %@",[localError localizedDescription]],nil);
		[context rollback];
		return FALSE;
	}
	return TRUE;
}

+(BOOL)removeUnit:(Unit *)unit {
	NSManagedObjectContext *context = [[CoreDataHelper sharedInstance] managedObjectContext];
	[context deleteObject:unit];
	NSError* error = nil;
	if(![context save:&error]) {
		NSLog([NSString stringWithFormat:@"Error, couldn't delete: %@", [error localizedDescription]],nil);
		[context rollback];
		return FALSE;
	}
	return TRUE;
}

+(NSArray*)searchUnitWithPredicates:(NSCompoundPredicate *)predicates {
	return [super searchAllWithPredicates:predicates andClassName:unitClass];
}

+(Unit*)searchUnitWithIdentifier:(int)identifier {
	return (Unit*) [super searchWithId:identifier andClassName:unitClass];
}
@end
