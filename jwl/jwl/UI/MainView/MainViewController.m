//
//  MainViewController.m
//  jwl
//
//  Created by Gabriel Verdi on 12/15/14.
//  Copyright (c) 2014 Gabriel Verdi. All rights reserved.
//

#import "MainViewController.h"
#import "LearnMainViewViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Background color
    NSArray *colors = @[(id)[UIColor whiteColor].CGColor,
                        (id)[UIColor blackColor].CGColor];
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.colors = colors;
    gradient.frame = self.view.bounds;
    [self.view.layer insertSublayer:gradient atIndex:0];
    
    //Buttons color
    self.practiceButton.layer.borderColor = [UIColor blackColor].CGColor;
    self.practiceButton.layer.borderWidth = 1.0;
    self.practiceButton.layer.cornerRadius = 10;
    self.practiceButton.layer.backgroundColor = [UIColor colorWithWhite:0.9f alpha:0.9f].CGColor;
    
    self.learnButton.layer.borderColor = [UIColor blackColor].CGColor;
    self.learnButton.layer.borderWidth = 1.0;
    self.learnButton.layer.cornerRadius = 10;
    self.learnButton.layer.backgroundColor = [UIColor colorWithWhite:0.9f alpha:0.9f].CGColor;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)learnButton:(UIButton *)sender {
    LearnMainViewViewController* nextView = [[LearnMainViewViewController alloc]init];
    [self.navigationController pushViewController:nextView animated:YES];
    
}

@end
