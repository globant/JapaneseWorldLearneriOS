//
//  WordRepository.h
//  jwl
//
//  Created by Gabriel Verdi on 12/15/14.
//  Copyright (c) 2014 Gabriel Verdi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Word.h"
#import "BaseRepository.h"

@interface WordRepository : BaseRepository

+(BOOL)saveWord:(Word*)word;
+(BOOL)removeWord:(Word*)word;
+(NSArray*)searchBookWithPredicates:(NSCompoundPredicate*)predicates;
+(Word*)searchWordWithIdentifier:(int)identifier;

extern NSString* const wordClass;

@end

