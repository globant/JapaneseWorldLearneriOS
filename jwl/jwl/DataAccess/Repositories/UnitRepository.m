//
//  UnitRepository.m
//  jwl
//
//  Created by Gabriel Verdi on 12/15/14.
//  Copyright (c) 2014 Gabriel Verdi. All rights reserved.
//

#import "UnitRepository.h"
#import "CoreDataHelper.h"

#define unitClass @"Unit"

@implementation UnitRepository

+(BOOL)saveUnit:(Unit *)unit {
	NSManagedObjectContext *context = [[CoreDataHelper sharedInstance] managedObjectContext];
	Unit* object = [NSEntityDescription insertNewObjectForEntityForName:unitClass inManagedObjectContext:context];
	[object setName:[unit name]];
	[object setBook:[unit book]];
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

+(Unit*)searchUnitWithId:(NSNumber*)identifier {
    NSManagedObjectContext *context = [[CoreDataHelper sharedInstance] managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:unitClass
                                   inManagedObjectContext:context];
    
    [fetchRequest setEntity:entity];
    [fetchRequest setReturnsObjectsAsFaults:NO];
    NSPredicate* identifierPredicate = [NSPredicate predicateWithFormat:@"identifier == %d",[identifier intValue]];
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
            return nil;
        }
    }
}

@end
