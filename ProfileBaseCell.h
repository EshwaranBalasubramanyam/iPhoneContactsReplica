//
//  ProfileBaseCell.h
//  ContactsReplica
//
//  Created by Eshwaran Balasubramanyam on 23/10/13.
//  Copyright (c) 2013 Scoop. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol EmailCellDelegate;
@protocol PhoneCellDelegate;
@protocol URLCellDelegate;
@protocol AddressCellDelegate;



@interface ProfileBaseCell : UITableViewCell

@property (strong,nonatomic) id<EmailCellDelegate,UITextFieldDelegate> emailCelldelegate;
@property (strong,nonatomic) id<PhoneCellDelegate,UITextFieldDelegate> phonCelldelegate;
@property (strong,nonatomic) id<URLCellDelegate,UITextFieldDelegate> urlCellDelegate;
@property (strong,nonatomic) id<AddressCellDelegate,UITextFieldDelegate> addressCellDelegate;


@property NSInteger rowNumber;


-(void) configureCell:(NSInteger) buttonTag;
-(void) makeCellFieldAsFirstResponder;
-(void) setTypetitle:(NSString *) title;
-(void) setCountryName:(NSString *) countryName;

@end

@protocol EmailCellDelegate <NSObject>

@optional
-(void)showEmailTypes:(NSInteger) rowNumber forCell:(ProfileBaseCell *) cell;

@end

@protocol PhoneCellDelegate <NSObject>

@optional
-(void)showPhoneTypes:(NSInteger) rowNumber forCell:(ProfileBaseCell *) cell;

@end

@protocol URLCellDelegate <NSObject>

@optional
-(void)showURLTypes:(NSInteger) rowNumber forCell:(ProfileBaseCell *) cell;

@end

@protocol AddressCellDelegate <NSObject>

@optional
-(void)showAddressTypes:(NSInteger) rowNumber forCell:(ProfileBaseCell *) cell;
-(void)showCountryList:(ProfileBaseCell *) cell;

@end

