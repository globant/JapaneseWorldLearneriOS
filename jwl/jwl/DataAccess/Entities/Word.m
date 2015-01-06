//
//  Word.m
//  jwl
//
//  Created by Gabriel Verdi on 12/15/14.
//  Copyright (c) 2014 Gabriel Verdi. All rights reserved.
//

#import "Word.h"

@implementation Word

@synthesize japanese;
@synthesize translation;

- (id)initWithCoder:(NSCoder *)aDecoder {
    if ([self init])
    {
        [self setJapanese: [aDecoder decodeObjectForKey:@"japanese"]];
        [self setTranslation: [aDecoder decodeObjectForKey:@"translation"]];
    }
    return self;
}

- (void) encodeWithCoder: (NSCoder *)coder {
    [coder encodeObject:self.japanese forKey:@"japanese"];
    [coder encodeObject:self.translation forKey:@"translation"];
}

@end
