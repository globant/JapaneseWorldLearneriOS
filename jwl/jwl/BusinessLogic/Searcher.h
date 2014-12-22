//
//  Searcher.h
//  jwl
//
//  Created by Gabriel Verdi on 12/15/14.
//  Copyright (c) 2014 Gabriel Verdi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Book.h"
#import "Unit.h"
#import "Word.h"

@interface Searcher : NSObject

-(Book*)searchBookByIdentifier:(int)identifier;
-(Unit*)searchUnitByIdentifier:(int)identifier;
-(Word*)searchWordByIdentifier:(int)identifier;

-(NSArray*)searchAllBooks;

@end
