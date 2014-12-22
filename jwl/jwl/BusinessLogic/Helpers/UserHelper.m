//
//  UserHelper.m
//  jwl
//
//  Created by Gabriel Verdi on 12/22/14.
//  Copyright (c) 2014 Gabriel Verdi. All rights reserved.
//

#import "UserHelper.h"
#import "User.h"

#define scoreHit 20


@interface UserHelper()



@end

@implementation UserHelper

-(int)calculateScore:(User *)user {
	return scoreHit * [[user hits] intValue];
}

-(void)addHit:(User *)user {
	int oldValue = [[user hits] intValue];
	[user setHits:[NSNumber numberWithInt:oldValue+1]];
}

-(void)addMiss:(User *)user {
	int oldValue = [[user miss] intValue];
	[user setMiss:[NSNumber numberWithInt:oldValue+1]];
}

@end
