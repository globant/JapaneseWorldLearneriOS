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

-(Book*)searchBookByIdentifier:(NSNumber*)identifier;
-(Unit*)searchUnitByIdentifier:(NSNumber*)identifier;
-(Word*)searchWordByIdentifier:(NSNumber*)identifier;

@end
