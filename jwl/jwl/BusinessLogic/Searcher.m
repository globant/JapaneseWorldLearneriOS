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

-(Book*)searchBookByIdentifier:(int)identifier {
	return [BookRepository searchBookWithIdentifier:identifier];
}

-(Unit*)searchUnitByIdentifier:(int)identifier {
	return [UnitRepository searchUnitWithIdentifier:identifier];
}

-(Word*)searchWordByIdentifier:(int)identifier {
	return [WordRepository searchWordWithIdentifier:identifier];
}

-(NSArray*)searchAllBooks {
	return [BookRepository searchAllWithPredicates:nil andClassName:bookClass];
}



@end
