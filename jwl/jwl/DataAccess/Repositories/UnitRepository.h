//
//  UnitRepository.h
//  jwl
//
//  Created by Gabriel Verdi on 12/15/14.
//  Copyright (c) 2014 Gabriel Verdi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Unit.h"
#import "BaseRepository.h"

@interface UnitRepository : BaseRepository

+(BOOL)saveUnit:(Unit*)unit;
+(BOOL)removeUnit:(Unit*)unit;
+(NSArray*)searchUnitWithPredicates:(NSCompoundPredicate*)predicates;
+(Unit*)searchUnitWithIdentifier:(int)identifier;

extern NSString* const unitClass;

@end
