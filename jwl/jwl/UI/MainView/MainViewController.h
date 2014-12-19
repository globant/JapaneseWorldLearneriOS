//
//  MainViewController.h
//  jwl
//
//  Created by Gabriel Verdi on 12/15/14.
//  Copyright (c) 2014 Gabriel Verdi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LearnMainViewViewController.h"

@interface MainViewController : UIViewController

- (IBAction)learnButton:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UIButton *practiceButton;
@property (strong, nonatomic) IBOutlet UIButton *learnButton;

@end
