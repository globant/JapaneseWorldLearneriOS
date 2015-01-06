//
//  Book.h
//  jwl
//
//  Created by Gabriel Verdi on 12/15/14.
//  Copyright (c) 2014 Gabriel Verdi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseEntity.h"
#import "Unit.h"

@interface Book : BaseEntity <NSCoding>

@property (strong,nonatomic) NSString* name;
@property (strong,nonatomic) NSMutableArray* units;

-(id)initWithCoder:(NSCoder*)aDecoder;
-(void)encodeWithCoder: (NSCoder *)coder;

@end
