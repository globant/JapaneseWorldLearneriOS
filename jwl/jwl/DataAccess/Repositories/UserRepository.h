//
//  UserRepository.h
//  jwl
//
//  Created by Gabriel Verdi on 12/22/14.
//  Copyright (c) 2014 Gabriel Verdi. All rights reserved.
//

#import "BaseRepository.h"
#import "User.h"

@interface UserRepository : BaseRepository

+(BOOL)updateUser:(User*)user;
+(BOOL)saveUser:(User*)user;
+(User*)searchWordWithIdentifier:(int)identifier;

extern NSString* const userClass;

@end
