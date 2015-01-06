//
//  LearnViewController.h
//  jwl
//
//  Created by Federico Mazzini on 12/18/14.
//  Copyright (c) 2014 Gabriel Verdi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LearnViewController : UIViewController <UITableViewDataSource , UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *unitsTable;
- (instancetype) initWithSelection:(NSDictionary*)theSelection;

@end
