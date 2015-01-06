//
//  LearnTableViewCell.h
//  jwl
//
//  Created by Federico Mazzini on 12/19/14.
//  Copyright (c) 2014 Gabriel Verdi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Word.h"

@interface LearnTableViewCell : UITableViewCell


@property (weak, nonatomic) id delegate;
@property (weak, nonatomic) NSMutableArray *columns;

-(void)loadLearnCell:(Word*)word;
-(void)addColumn:(CGFloat)position;

@end
