//
//  AddressCell.h
//  ContactsReplica
//
//  Created by Eshwaran Balasubramanyam on 23/10/13.
//  Copyright (c) 2013 Scoop. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProfileBaseCell.h"

@interface AddressCell : ProfileBaseCell
@property (weak, nonatomic) IBOutlet UITextField *street1TextField;
@property (weak, nonatomic) IBOutlet UITextField *street2TextField;
@property (weak, nonatomic) IBOutlet UITextField *provinceTextField;
@property (weak, nonatomic) IBOutlet UITextField *cityTextField;
@property (weak, nonatomic) IBOutlet UITextField *pinTextField;
@property (weak, nonatomic) IBOutlet UIButton *selectCountryButton;
@property (weak, nonatomic) IBOutlet UIButton *typeButton;


-(IBAction)selectCountry:(id)sender;
-(IBAction)cellButtonTapped:(id)sender;

@end
