//
//  LearnMainViewViewController.m
//  jwl
//
//  Created by Federico Mazzini on 12/16/14.
//  Copyright (c) 2014 Gabriel Verdi. All rights reserved.
//

#import "LearnMainViewViewController.h"
#import "LearnViewController.h"

@interface LearnMainViewViewController ()

@property(nonatomic,strong) NSArray* bookPickerData;
@property(nonatomic,strong) NSArray* unitPickerData;
@property(nonatomic,strong) NSDictionary* selection;

@end

@implementation LearnMainViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _bookPickerData = @[@"Book 1", @"Book 2", @"Book 3", @"Book 4"]; //TODO: change book names
    _unitPickerData = @[@"1", @"2", @"3", @"4", @"5"]; //TODO: check unit names
    
    self.bookPicker.dataSource = self;
    self.bookPicker.delegate = self;
    
    self.unitFirstPicker.dataSource = self;
    self.unitFirstPicker.delegate = self;
    
    self.unitSecondPicker.dataSource = self;
    self.unitSecondPicker.delegate = self;
    
    //Background color
    NSArray *colors = @[(id)[UIColor whiteColor].CGColor,
                        (id)[UIColor blackColor].CGColor];
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.colors = colors;
    gradient.frame = self.view.bounds;
    [self.view.layer insertSublayer:gradient atIndex:0];
    
    //Button color
    self.peakButton.layer.borderColor = [UIColor blackColor].CGColor;
    self.peakButton.layer.borderWidth = 1.0;
    self.peakButton.layer.cornerRadius = 10;
    self.peakButton.layer.backgroundColor = [UIColor colorWithWhite:0.9f alpha:0.9f].CGColor;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIPickerViewDataSource

// The number of columns of data
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// The number of rows of data
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if([pickerView isEqual: _bookPicker]){
        return [self.bookPickerData count];
    }else if([pickerView isEqual: _unitFirstPicker] || [pickerView isEqual: _unitSecondPicker]){
        return [self.unitPickerData count];
    }else{
        return 0;
    }
}

#pragma mark - UIPickerViewDelegate

// The data to return for the row and component (column) that's being passed in
/*
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return _pickerData[row];
}
*/

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    if([pickerView isEqual: _bookPicker]){
        return 100.0f;
    }else if([pickerView isEqual: _unitFirstPicker] || [pickerView isEqual: _unitSecondPicker]){
        return 50.0f;
    }else{
        return 0.0f;
    }
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    if([pickerView isEqual: _bookPicker]){
        return 18.0f;
    }else if([pickerView isEqual: _unitFirstPicker] || [pickerView isEqual: _unitSecondPicker]){
        return 18.0f;
    }else{
        return 0.0f;
    }
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row
          forComponent:(NSInteger)component reusingView:(UIView *)view {
    UILabel *retval = (id)view;
    
    if (!retval) {
        retval= [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, [pickerView rowSizeForComponent:component].width, [pickerView rowSizeForComponent:component].height)] ;
    }
    
    if([pickerView isEqual: _bookPicker]){
        retval.text = [_bookPickerData objectAtIndex:row];
        retval.font = [UIFont systemFontOfSize:16];
    }else if([pickerView isEqual: _unitFirstPicker] || [pickerView isEqual: _unitSecondPicker]){
        retval.text = [_unitPickerData objectAtIndex:row];
        retval.font = [UIFont systemFontOfSize:12];
    }
    
    retval.textAlignment = NSTextAlignmentCenter;
    retval.backgroundColor = [UIColor colorWithWhite:0.9f alpha:0.9f];
    
    return retval;
}

// Catpure the picker view selection
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
}

-(BOOL)verifySelectedUnits{
    NSNumber* firstUnitNumber = [NSNumber numberWithInteger:[self.unitFirstPicker selectedRowInComponent:0]];
    NSNumber* secondUnitNumber = [NSNumber numberWithInteger:[self.unitSecondPicker selectedRowInComponent:0]];
    
    if (secondUnitNumber < firstUnitNumber){
        [[[UIAlertView alloc] initWithTitle:@"Units must be the same or a range!" message:nil delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil] show];
        return false;
    }
    return true;
}

- (IBAction)nextButton:(UIButton *)sender {
    
    NSNumber* bookNumber = [NSNumber numberWithInteger:[self.bookPicker selectedRowInComponent:0]];
    NSNumber* firstUnitNumber = [NSNumber numberWithInteger:[self.unitFirstPicker selectedRowInComponent:0]];
    NSNumber* secondUnitNumber = [NSNumber numberWithInteger:[self.unitSecondPicker selectedRowInComponent:0]];
    
    self.selection = @{
                        @"book": bookNumber,
                        @"firstUnit": firstUnitNumber,
                        @"secondUnit": secondUnitNumber};
    if([self verifySelectedUnits]){
        LearnViewController* nextView = [[LearnViewController alloc]initWithSelection:self.selection];
        [self.navigationController pushViewController:nextView animated:YES];
    }
}

- (IBAction)peakButton:(UIButton *)sender {
}

@end
