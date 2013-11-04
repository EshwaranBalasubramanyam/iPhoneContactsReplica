//
//  PhoneCell.h
//  ContactsReplica
//
//  Created by Eshwaran Balasubramanyam on 23/10/13.
//  Copyright (c) 2013 Scoop. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProfileBaseCell.h"

@interface PhoneCell : ProfileBaseCell
@property (weak, nonatomic) IBOutlet UIButton *phoneTypeButton;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;



-(IBAction)selectPhoneTypes:(id)sender;

@end
