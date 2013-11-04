//
//  TypesViewController.m
//  ContactsReplica
//
//  Created by Eshwaran Balasubramanyam on 23/10/13.
//  Copyright (c) 2013 Scoop. All rights reserved.
//

#import "TypesViewController.h"

@interface TypesViewController () <UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *typesTableView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *cancelButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;


-(IBAction)cacnel:(id)sender;
-(IBAction)done:(id)sender;

@end

@implementation TypesViewController

@synthesize delegate=_delegate,isCountrySelect=_isCountrySelect;

@synthesize dataArray=_dataArray,selectedRow=_selectedRow;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void) viewWillAppear:(BOOL)animated{
    
    [self.typesTableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark TableView Delegate Method


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [self.dataArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"TableCell";
    UITableViewCell   *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
        [cell.textLabel setText:[self.dataArray objectAtIndex:indexPath.row]];
        
    }
    
    if (indexPath.row == self.selectedRow) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }else{
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
    
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self.typesTableView deselectRowAtIndexPath:indexPath animated:YES];
    
    self.selectedRow = indexPath.row;
    
    [self.typesTableView reloadData];
}

-(IBAction)cacnel:(id)sender{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
-(IBAction)done:(id)sender{
    
    if (self.isCountrySelect) {
        
        [self.delegate didSelectCountry:[self.dataArray objectAtIndex:self.selectedRow]];
        
    }else{
        
         [self.delegate didSelectType:[self.dataArray objectAtIndex:self.selectedRow] atIndex:self.selectedRow];
    }
   
    [self dismissViewControllerAnimated:YES completion:nil];

}


@end
