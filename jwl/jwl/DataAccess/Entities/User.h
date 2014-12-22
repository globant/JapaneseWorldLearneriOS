//
//  User.h
//  jwl
//
//  Created by Gabriel Verdi on 12/22/14.
//  Copyright (c) 2014 Gabriel Verdi. All rights reserved.
//

#import "BaseEntity.h"

@interface User : BaseEntity

@property (strong,nonatomic) NSNumber* score;
@property (strong,nonatomic) NSNumber* hits;
@property (strong,nonatomic) NSNumber* miss;
@property (strong,nonatomic) NSNumber* total;

@end
