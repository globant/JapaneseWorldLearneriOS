//
//  Searcher.m
//  jwl
//
//  Created by Gabriel Verdi on 12/15/14.
//  Copyright (c) 2014 Gabriel Verdi. All rights reserved.
//

#import "Searcher.h"
#import "BookRepository.h"

@implementation Searcher

-(Book*)searchBookByIdentifier:(NSNumber *)identifier {
	return [BookRepository searchBookWithId:identifier];
}

@end
