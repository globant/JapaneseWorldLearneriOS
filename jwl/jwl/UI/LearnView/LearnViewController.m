//
//  LearnViewController.m
//  jwl
//
//  Created by Federico Mazzini on 12/18/14.
//  Copyright (c) 2014 Gabriel Verdi. All rights reserved.
//

#import "LearnViewController.h"
#import "LearnTableViewCell.h"
#import "Searcher.h"
#import "Book.h"
#import "Unit.h"
#import "InitialGenerator.h"

@interface LearnViewController ()

@property(nonatomic,strong) NSDictionary* selection;
@property(nonatomic,strong) NSMutableArray* unitsArray;
@property(nonatomic,strong) Book* book;
@property(nonatomic,strong) Book* book2;

@end

@implementation LearnViewController

- (instancetype) initWithSelection:(NSDictionary*)theSelection {
    self = [super init];
    
    if (self){
        _selection = theSelection;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.unitsTable registerNib:[UINib nibWithNibName:@"LearnTableViewCell" bundle:nil] forCellReuseIdentifier:@"LearnTableViewCell"];
    
    self.unitsTable = [[UITableView alloc]init];
    
    self.unitsTable.delegate = self;
    self.unitsTable.dataSource = self;
    
    [InitialGenerator saveData];
   
    NSString *path = [InitialGenerator pathForDataFile];
    NSMutableDictionary* books = [NSMutableDictionary new];
    books = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    
    self.book = [books objectForKey:@"book"];
    
    self.book2 = [books objectForKey:@"book2"];
    
    self.unitsArray = self.book.units;
    
    /*
    int firstUnit = [[self.selection objectForKey:@"firstUnit"] intValue];
    int secondUnit = [[self.selection objectForKey:@"secondUnit"] intValue];
    */
    
    [self.unitsTable reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.unitsArray){
        Unit* unit = [self.unitsArray objectAtIndex:section];
        NSMutableArray* words = unit.words;
        int cont = (int)[words count];
        return cont;
    }
    return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (self.unitsArray){
        int cont = (int)[self.unitsArray count];
        return cont;
    }
    return 0;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString* title = [self.unitsArray[(int)section] name];
    return title;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"LearnTableViewCell";
    
    LearnTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if(!cell)
    {
        cell = [[LearnTableViewCell alloc] init];
    }
    
    Unit* unit = [self.unitsArray objectAtIndex:indexPath.section];
    Word* word = [unit.words objectAtIndex:indexPath.row];

    [cell setDelegate:self];
    
    [cell loadLearnCell: word];
/*
    //draw line
    [cell addColumn:50];
    [cell addColumn:120];
    */
    return cell;
}

#pragma mark - UITableViewDelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end
