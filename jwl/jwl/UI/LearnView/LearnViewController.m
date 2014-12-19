//
//  LearnViewController.m
//  jwl
//
//  Created by Federico Mazzini on 12/18/14.
//  Copyright (c) 2014 Gabriel Verdi. All rights reserved.
//

#import "LearnViewController.h"

@interface LearnViewController ()

@property(nonatomic,strong) NSDictionary* selection;

@end

@implementation LearnViewController

- (instancetype) initWithSelection:(NSDictionary*)theselection
{
    self = [super init];
    
    if (self){
        _selection = theselection;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString* book = [[self.selection objectForKey:@"book"] stringValue];
    self.title = book;
    
    //Background color
    NSArray *colors = @[(id)[UIColor whiteColor].CGColor,
                        (id)[UIColor blackColor].CGColor];
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.colors = colors;
    gradient.frame = self.view.bounds;
    [self.view.layer insertSublayer:gradient atIndex:0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
