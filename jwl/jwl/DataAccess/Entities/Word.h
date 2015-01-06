//
//  Word.h
//  jwl
//
//  Created by Gabriel Verdi on 12/15/14.
//  Copyright (c) 2014 Gabriel Verdi. All rights reserved.
//

#import "BaseEntity.h"

@interface Word : BaseEntity

@property (strong,nonatomic) NSString* japanese;
@property (strong,nonatomic) NSString* translation;

-(id)initWithCoder:(NSCoder*)aDecoder;
-(void)encodeWithCoder: (NSCoder *)coder;

@end
