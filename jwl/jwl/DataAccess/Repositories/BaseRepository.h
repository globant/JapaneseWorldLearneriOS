//
//  BaseRepository.h
//  jwl
//
//  Created by Gabriel Verdi on 12/19/14.
//  Copyright (c) 2014 Gabriel Verdi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseEntity.h"

@interface BaseRepository : NSObject
+(NSArray*)searchAllWithPredicates:(NSCompoundPredicate*)predicates andClassName:(NSString*)className;
+(BaseEntity*)searchWithId:(int)identifier andClassName:(NSString*) className;
@end
