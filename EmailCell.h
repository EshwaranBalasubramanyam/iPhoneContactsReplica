//
//  EmailCell.h
//  ContactsReplica
//
//  Created by Eshwaran Balasubramanyam on 23/10/13.
//  Copyright (c) 2013 Scoop. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProfileBaseCell.h"

@interface EmailCell : ProfileBaseCell

@property (weak, nonatomic) IBOutlet UIButton *emailTypeButton;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;

-(IBAction)cellButtonTapped:(id)sender;
@end
