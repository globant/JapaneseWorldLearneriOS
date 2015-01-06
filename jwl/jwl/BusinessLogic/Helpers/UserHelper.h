//
//  UserHelper.h
//  jwl
//
//  Created by Gabriel Verdi on 12/22/14.
//  Copyright (c) 2014 Gabriel Verdi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface UserHelper : NSObject

-(int)calculateScore:(User*)user;
-(void)addHit:(User*)user;
-(void)addMiss:(User*)user;

@end
