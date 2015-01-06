//
//  Book.m
//  jwl
//
//  Created by Gabriel Verdi on 12/15/14.
//  Copyright (c) 2014 Gabriel Verdi. All rights reserved.
//

#import "Book.h"

@implementation Book

@synthesize name;
@synthesize units;

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [self init])
    {
        [self setName: [aDecoder decodeObjectForKey:@"name"]];
        
        NSData *storedData =  [aDecoder decodeObjectForKey:@"units"];
        self.units = [NSMutableArray arrayWithArray:[NSKeyedUnarchiver unarchiveObjectWithData:storedData]];
    }
    return self;
}

- (void) encodeWithCoder: (NSCoder *)coder {
    [coder encodeObject:self.name forKey:@"name"];
    
    NSData *theUnits = [NSKeyedArchiver archivedDataWithRootObject:self.units];
    
    [coder encodeObject:theUnits forKey:@"units"];
}

@end
