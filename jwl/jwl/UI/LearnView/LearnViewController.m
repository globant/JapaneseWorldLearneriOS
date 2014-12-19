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

@property(nonatomic,strong) NSMutableArray* wordsArray;

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
    
    self.wordsArray = [NSMutableArray new];
    [self.wordTable reloadData];
    
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

#pragma mark - UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.wordsArray)
    {
        return [self.wordsArray count];
    }
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"LearnTableViewCell";
    
    LearnTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if(!cell)
    {
        cell = [[LearnTableViewCell alloc] init];
    }
    
    [cell loadLearnCell:[self.wordsArray objectAtIndex:indexPath.row]];
    [cell setDelegate:self];
    
    //draw line
    [cell addColumn:50];
    [cell addColumn:120];
    
    return cell;
}

#pragma mark - UITableViewDelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
