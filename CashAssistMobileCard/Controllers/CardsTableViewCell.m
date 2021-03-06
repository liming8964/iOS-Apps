//
//  CardsTableViewCell.m
//  CashAssistMobileCard
//
//  Created by User on 4/14/15.
//  Copyright (c) 2015 liming. All rights reserved.
//

#import "CardsTableViewCell.h"
#import "Global.h"
#import "NSData+Base64.h"

@implementation CardsTableViewCell

@synthesize logoImageView;
@synthesize cardNumberLabel;
@synthesize companyLabel;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) showCardRecord:(NSString *) number company:(NSString *) company {
    [cardNumberLabel setText:number];
    
    CompanyRecord *companyRecord = [[CompanyRecord alloc] init];
    for(CompanyRecord *_company in g_CompanysModel.companysArray) {
        if ([_company.company isEqualToString:company]) {
            companyRecord = _company;
        }
    }
    NSData *imageData = [NSData dataFromBase64String:companyRecord.logo];
    [logoImageView setImage:[UIImage imageWithData:imageData]];
    [companyLabel setText:companyRecord.name];
}

@end
