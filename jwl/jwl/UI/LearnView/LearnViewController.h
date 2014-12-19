//
//  LearnViewController.h
//  jwl
//
//  Created by Federico Mazzini on 12/18/14.
//  Copyright (c) 2014 Gabriel Verdi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LearnTableViewCell.h"

@interface LearnViewController : UIViewController <UITableViewDataSource , UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *wordTable;
- (instancetype) initWithSelection:(NSDictionary*)theselection;

@end
