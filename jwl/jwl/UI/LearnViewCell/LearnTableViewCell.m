//
//  LearnTableViewCell.m
//  jwl
//
//  Created by Federico Mazzini on 12/19/14.
//  Copyright (c) 2014 Gabriel Verdi. All rights reserved.
//

#import "LearnTableViewCell.h"

@interface LearnTableViewCell()

@property (strong, nonatomic) IBOutlet UILabel *kanjiLabel;
@property (strong, nonatomic) IBOutlet UILabel *translationLabel;

@end

@implementation LearnTableViewCell

-(instancetype)init {
    if(self = [super init]) {
        self.kanjiLabel = [[UILabel alloc]init];
        self.translationLabel = [[UILabel alloc]init];
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)loadLearnCell:(Word*)word{
    [self.kanjiLabel setText:word.japanese];
    [self.translationLabel setText:word.translation];
}

- (void)addColumn:(CGFloat)position {
    [self.columns addObject:[NSNumber numberWithFloat:position]];
}
/*
- (void)drawRect:(CGRect)rect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // Use the same color and width as the default cell separator for now
    CGContextSetRGBStrokeColor(ctx, 0.5, 0.5, 0.5, 1.0);
    CGContextSetLineWidth(ctx, 0.25);
    
    for (int i = 0; i < [self.columns count]; i++) {
        CGFloat f = [((NSNumber*) [self.columns objectAtIndex:i]) floatValue];
        CGContextMoveToPoint(ctx, f, 0);
        CGContextAddLineToPoint(ctx, f, self.bounds.size.height);
    }
    
    CGContextStrokePath(ctx);
    
    [super drawRect:rect];
}
*/
@end
