//
//  Unit.m
//  jwl
//
//  Created by Gabriel Verdi on 12/15/14.
//  Copyright (c) 2014 Gabriel Verdi. All rights reserved.
//

#import "Unit.h"

@implementation Unit

@synthesize name;
@synthesize words;

- (id)initWithCoder:(NSCoder *)aDecoder {
    if ([self init])
    {
        [self setName: [aDecoder decodeObjectForKey:@"name"]];
        NSData *storedData =  [aDecoder decodeObjectForKey:@"words"];
        self.words = [NSMutableArray arrayWithArray:[NSKeyedUnarchiver unarchiveObjectWithData:storedData]];
    }
    return self;
}

- (void) encodeWithCoder: (NSCoder *)coder {
    [coder encodeObject:self.name forKey:@"name"];
    
    NSData *theWords = [NSKeyedArchiver archivedDataWithRootObject:self.words];
    
    [coder encodeObject:theWords forKey:@"words"];
}

@end
