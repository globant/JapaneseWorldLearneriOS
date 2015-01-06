//
//  InitialGenerator.h
//  jwl
//
//  Created by Gabriel Verdi on 12/19/14.
//  Copyright (c) 2014 Gabriel Verdi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Singleton.h"

@interface InitialGenerator : Singleton

//-(void)initialBookGenerator;
+(void)saveData;
+(NSMutableDictionary*)loadData;
+(NSString *) pathForDataFile;
@end
