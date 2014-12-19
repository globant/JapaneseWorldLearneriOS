//
//  LearnMainViewViewController.h
//  jwl
//
//  Created by Federico Mazzini on 12/16/14.
//  Copyright (c) 2014 Gabriel Verdi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LearnViewController.h"

@interface LearnMainViewViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UIPickerView *bookPicker;
@property (strong, nonatomic) IBOutlet UIPickerView *unitFirstPicker;
@property (strong, nonatomic) IBOutlet UIPickerView *unitSecondPicker;
- (IBAction)nextButton:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UIButton *peakButton;

-(BOOL)verifySelectedUnits;

@end
