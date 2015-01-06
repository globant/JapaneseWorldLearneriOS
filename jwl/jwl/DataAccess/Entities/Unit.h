//
//  Unit.h
//  jwl
//
//  Created by Gabriel Verdi on 12/15/14.
//  Copyright (c) 2014 Gabriel Verdi. All rights reserved.
//

#import "BaseEntity.h"
#import "Word.h"

@interface Unit : BaseEntity

@property (strong,nonatomic) NSString* name;
@property (strong,nonatomic) NSMutableArray* words;

-(id)initWithCoder:(NSCoder*)aDecoder;
-(void)encodeWithCoder: (NSCoder *)coder;

@end
