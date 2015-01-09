//
//  Word.m
//  jwl
//
//  Created by Gabriel Verdi on 12/15/14.
//  Copyright (c) 2014 Gabriel Verdi. All rights reserved.
//

#import "Word.h"

@implementation Word

@synthesize kanji;
@synthesize translation;
@synthesize hiragana;

- (id)initWithCoder:(NSCoder *)aDecoder {
    if ([self init])
    {
        [self setKanji: [aDecoder decodeObjectForKey:@"kanji"]];
        [self setTranslation: [aDecoder decodeObjectForKey:@"translation"]];
        [self setHiragana: [aDecoder decodeObjectForKey:@"hiragana"]];
    }
    return self;
}

- (void) encodeWithCoder: (NSCoder *)coder {
    [coder encodeObject:self.kanji forKey:@"kanji"];
    [coder encodeObject:self.translation forKey:@"translation"];
    [coder encodeObject:self.hiragana forKey:@"hiragana"];
}

@end
