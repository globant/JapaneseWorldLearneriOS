//
//  Singleton.m
//  tamagochiApp
//
//  Created by Gabriel Verdi on 11/24/14.
//  Copyright (c) 2014 globant. All rights reserved.
//

#import "Singleton.h"

@implementation Singleton

+ (instancetype) sharedInstance {
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;
    //Garantiza que lo que se encuentre dentro solo se ejecutará una vez.
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init];
	});
    return _sharedObject;
}

@end
