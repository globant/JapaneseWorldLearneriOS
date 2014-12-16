//
//  WordRepository.h
//  jwl
//
//  Created by Gabriel Verdi on 12/15/14.
//  Copyright (c) 2014 Gabriel Verdi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Word.h"

@interface WordRepository : NSObject

+(BOOL)saveWord:(Word*)word;
+(BOOL)removeWord:(Word*)word;
+(Word*)searchWordWithId:(NSNumber*)identifier;
@end
