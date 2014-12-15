//
//  Singleton.h
//  tamagochiApp
//
//  Created by Gabriel Verdi on 11/24/14.
//  Copyright (c) 2014 globant. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Singleton : NSObject
+ (instancetype) sharedInstance;
@end