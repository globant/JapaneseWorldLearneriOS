//
//  Saver.m
//  jwl
//
//  Created by Gabriel Verdi on 12/15/14.
//  Copyright (c) 2014 Gabriel Verdi. All rights reserved.
//

#import "Saver.h"
#import "BookRepository.h"
#import "UnitRepository.h"
#import "WordRepository.h"

@implementation Saver

-(BOOL)saveBook:(Book *)book {
	return [BookRepository saveBook:book];
}

-(BOOL)saveUnit:(Unit *)unit {
	return [UnitRepository saveUnit:unit];
}

-(BOOL)saveWord:(Word *)word {
	return [WordRepository saveWord:word];
}

@end
