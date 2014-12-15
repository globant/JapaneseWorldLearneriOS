//
//  Saver.h
//  jwl
//
//  Created by Gabriel Verdi on 12/15/14.
//  Copyright (c) 2014 Gabriel Verdi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Book.h"
#import "Unit.h"
#import "Word.h"

@interface Saver : NSObject

-(BOOL)saveBook:(Book*)book;
-(BOOL)saveUnit:(Unit*)unit;
-(BOOL)saveWord:(Word*)word;
@end
