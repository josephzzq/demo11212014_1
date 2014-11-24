//
//  ViewController.m
//  demo11212014_1
//
//  Created by Brian on 2014/11/21.
//  Copyright (c) 2014年 alphacamp. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
{
    NSArray *dataSource;
    NSArray *detailDataSource;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    dataSource = [NSArray arrayWithObjects:@"Message1", @"Message2", @"Message3", @"Message4", @"Message5", @"Message6", @"Message7", @"Message8", nil];

    detailDataSource = [NSArray arrayWithObjects:@"Abstract1", @"Abstract2", @"Abstract3", @"Abstract4", @"Abstract5", @"Abstract6", @"Abstract7", @"Abstract8", nil];

    NSLog(@"DataSource: %@", dataSource);
    NSLog(@"Detail DataSource: %@", detailDataSource);
}

//- (void)calc
//{
//    // Calc something...
//    [self.tableView reloadData];
//}

#pragma mark - UITableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [dataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *requestIdentifier = @"HelloCell1";
    static NSString *requestIdentifier2 = @"HelloCell2";
    
    
    UITableViewCell *cell;
    switch (indexPath.section) {
        case 0:{
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:requestIdentifier];
            
            if (!cell) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:requestIdentifier];
                cell.textLabel.textColor = [UIColor whiteColor];
                cell.detailTextLabel.textColor =
                [UIColor colorWithRed:241.0f/255.0f green:244.0f/255.0f blue:239.0f/255.0f alpha:1.0f];
                cell.backgroundColor = [UIColor clearColor];
                
                cell.textLabel.font  = [UIFont fontWithName: @"AvenirNextCondensed-Bold" size: 14.0];
                
                cell.detailTextLabel.font = [UIFont boldSystemFontOfSize:12.0f];
                
                cell.selectionStyle =UITableViewCellSelectionStyleGray;
            }
        }
            
            break;
            
        case 1:{
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:requestIdentifier2];
            if (!cell) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:requestIdentifier2];
                cell.textLabel.textColor = [UIColor whiteColor];
                cell.detailTextLabel.textColor =
                [UIColor colorWithRed:241.0f/255.0f green:244.0f/255.0f blue:239.0f/255.0f alpha:1.0f];
                cell.backgroundColor = [UIColor clearColor];
                
                cell.textLabel.font  = [UIFont fontWithName: @"AvenirNextCondensed-Bold" size: 14.0];
                
                cell.detailTextLabel.font = [UIFont boldSystemFontOfSize:12.0f];
                
                cell.selectionStyle =UITableViewCellSelectionStyleGray;
            }
        }
            
            break;
            
        default:
            break;
    }
    
    
    
    

   // UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:requestIdentifier];

//    if (!cell) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:requestIdentifier];
//        cell.textLabel.textColor = [UIColor whiteColor];
//        cell.detailTextLabel.textColor =
//        [UIColor colorWithRed:241.0f/255.0f green:244.0f/255.0f blue:239.0f/255.0f alpha:1.0f];
//        cell.backgroundColor = [UIColor clearColor];
//
//        cell.textLabel.font  = [UIFont fontWithName: @"AvenirNextCondensed-Bold" size: 14.0];
//
//        cell.detailTextLabel.font = [UIFont boldSystemFontOfSize:12.0f];
//
//        cell.selectionStyle =UITableViewCellSelectionStyleGray;
//    }

    cell.textLabel.text = dataSource[indexPath.row];
    cell.detailTextLabel.text = detailDataSource[indexPath.row];
    
    NSString *title;
    switch (indexPath.section) {
        case 0:
            title =@"Download";
            break;
            
        case 1:
            title =@"Upload";
            break;
            
            
        default:
            break;
    }
    
    
    
    
    UIButton *button= [[UIButton alloc]initWithFrame:CGRectMake(250, 10, 90, 40)];
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font=[UIFont fontWithName:@"Menlo-BoldItalic" size:10.0f];
    
    [button setBackgroundColor:[UIColor redColor]];
    [cell.contentView addSubview:button];
    [button.layer setCornerRadius:4.0f];
    [button.layer setBorderColor:[[UIColor whiteColor] CGColor]];
    [button.layer setBorderWidth:2.0f];
    
    
    [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    button.tag= indexPath.row;
    
//    if (indexPath.row == 0) {
//        cell.textLabel.text = @"Message";
//        cell.detailTextLabel.text = @"Abstract";
//    }
//    else {
//        cell.textLabel.text = @"iOS";
//        cell.detailTextLabel.text = @"iOS Abstract";
//    }

    return cell;
}


-(void)buttonPressed: (id)sender{
    
    UIButton *button =(UIButton*)sender;
    NSLog(@"button pressed %d" ,button.tag);
};



-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"You selected : %ld %ld " , indexPath.row,indexPath.section);
    
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
