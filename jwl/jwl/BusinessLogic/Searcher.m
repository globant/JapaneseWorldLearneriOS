//
//  Searcher.m
//  jwl
//
//  Created by Gabriel Verdi on 12/15/14.
//  Copyright (c) 2014 Gabriel Verdi. All rights reserved.
//

#import "Searcher.h"
#import "BookRepository.h"
#import "UnitRepository.h"
#import "WordRepository.h"

@implementation Searcher

-(Book*)searchBookByIdentifier:(NSNumber *)identifier {
	return [BookRepository searchBookWithId:identifier];
}
-(Unit*)searchUnitByIdentifier:(NSNumber*)identifier{
    return [UnitRepository searchUnitWithId:identifier];
}
-(Word*)searchWordByIdentifier:(NSNumber*)identifier{
    return [WordRepository searchWordWithId:identifier];
}

@end
