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
@property (strong, nonatomic) IBOutlet UILabel *hiraganaLabel;

@end

@implementation LearnTableViewCell

-(instancetype)init {
    if(self = [super init]) {
        self.kanjiLabel = [[UILabel alloc]init];
        self.translationLabel = [[UILabel alloc]init];
        self.hiraganaLabel = [[UILabel alloc]init];
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
    [self.translationLabel setText:word.translation];
    [self.hiraganaLabel setText:word.hiragana];
    if ([word.kanji isEqualToString:@""] || word.kanji == nil) {
        [self.kanjiLabel setText:@"None"];
    }else{
        [self.kanjiLabel setText:word.kanji];
    }
}


@end
