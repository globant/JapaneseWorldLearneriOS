//
//  BaseEntity.m
//  jwl
//
//  Created by Gabriel Verdi on 12/15/14.
//  Copyright (c) 2014 Gabriel Verdi. All rights reserved.
//

#import "BaseEntity.h"

/**
 Base entity for all entities. It should contain common properties and common functionality
 */
@implementation BaseEntity

@synthesize identifier;

- (id)initWithCoder:(NSCoder *)aDecoder {
    if ([self init])
    {
        //TODO usar constantes
        [self setIdentifier: [aDecoder decodeObjectForKey:@"identifier"]];
    }
    return self;
}

- (void) encodeWithCoder: (NSCoder *)coder {
    [coder encodeObject:self.identifier forKey:@"identifier"];
}

@end
