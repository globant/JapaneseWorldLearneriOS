//
//  BookRepository.h
//  jwl
//
//  Created by Gabriel Verdi on 12/15/14.
//  Copyright (c) 2014 Gabriel Verdi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Book.h"
#import "BaseRepository.h"

@interface BookRepository : BaseRepository

+(BOOL)saveBook:(Book*) book;
+(BOOL)removeBook:(Book*)book;
+(NSArray*)searchBookWithPredicates:(NSCompoundPredicate*)predicates;
+(Book*)searchBookWithIdentifier:(int)identifier;

extern NSString* const bookClass;

@end
