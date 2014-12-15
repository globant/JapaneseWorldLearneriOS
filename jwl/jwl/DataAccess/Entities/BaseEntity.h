//
//  BaseEntity.h
//  jwl
//
//  Created by Gabriel Verdi on 12/15/14.
//  Copyright (c) 2014 Gabriel Verdi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface BaseEntity : NSManagedObject

@property (strong,nonatomic) NSNumber* identifier;

@end
