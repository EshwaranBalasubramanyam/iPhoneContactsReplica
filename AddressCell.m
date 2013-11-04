//
//  AddressCell.m
//  ContactsReplica
//
//  Created by Eshwaran Balasubramanyam on 23/10/13.
//  Copyright (c) 2013 Scoop. All rights reserved.
//

#import "AddressCell.h"

@implementation AddressCell

@synthesize addressCellDelegate;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void) configureCell:(NSInteger) buttonTag{
    
    
    [self.street1TextField setDelegate:self.addressCellDelegate];
    [self.street2TextField setDelegate:self.addressCellDelegate];
    [self.provinceTextField setDelegate:self.addressCellDelegate];
    [self.cityTextField setDelegate:self.addressCellDelegate];
    [self.pinTextField setDelegate:self.addressCellDelegate];
    
}

-(void) setTypetitle:(NSString *) title{
    
    [self.typeButton setTitle:title forState:UIControlStateNormal];
}

-(IBAction)selectCountry:(id)sender{
    
    [self.addressCellDelegate showCountryList:self];
}

-(void) makeCellFieldAsFirstResponder{
    
    [self.street1TextField becomeFirstResponder];
}

-(IBAction)cellButtonTapped:(id)sender{
    
    [self.addressCellDelegate showAddressTypes:self.rowNumber forCell:self];
}

-(void) setCountryName:(NSString *) countryName{
    
    [self.selectCountryButton setTitle:countryName forState:UIControlStateNormal];
}


@end
