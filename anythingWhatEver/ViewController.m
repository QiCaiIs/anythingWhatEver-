//
//  ViewController.m
//  anythingWhatEver
//
//  Created by apple on 15/12/29.
//  Copyright © 2015年 奇才. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ViewController
{
    UITableView *ownerTableView;
    CGPoint *newOffset;
    CGFloat num;
    UIImageView *bigImageView;
    UIView *bigView;
    UIImageView *smallImageView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    num = 200.0;
    
    bigImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, -200, self.view.bounds.size.width, 400)];
    bigImageView.image = [UIImage imageNamed:@"1.jpg"];
    
   bigView = [[UIView alloc]initWithFrame:bigImageView.bounds];
    bigView.backgroundColor = [UIColor whiteColor];
    bigView.alpha = .4;
    [bigImageView addSubview:bigView];
    
    smallImageView = [[UIImageView alloc]initWithFrame:CGRectMake(bigImageView.bounds.size.width/2-35, 70, 70, 70)];
    smallImageView.image = [UIImage imageNamed:@"1.jpg"];
    smallImageView.layer.cornerRadius = 35;
    smallImageView.clipsToBounds = YES;
    [self.view addSubview:bigImageView];
    [self.view addSubview:smallImageView];
    
    ownerTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
    ownerTableView.contentInset = UIEdgeInsetsMake(200, 0 ,0 , 0);
    ownerTableView.delegate = self;
    ownerTableView.dataSource = self;
    ownerTableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:ownerTableView];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{

    if (-ownerTableView.contentOffset.y > 200) {
        ownerTableView.contentInset = UIEdgeInsetsMake(200, 0 ,0 , 0);
    }else if (-ownerTableView.contentOffset.y < 60){
        ownerTableView.contentInset = UIEdgeInsetsMake(60, 0 ,0 , 0);
    }
    else{
        ownerTableView.contentInset = UIEdgeInsetsMake(-ownerTableView.contentOffset.y, 0 ,0 , 0);
        bigImageView.frame = CGRectMake(0, ownerTableView.contentOffset.y, self.view.bounds.size.width, bigImageView.frame.size.height);
        bigView.frame = bigImageView.bounds;
        smallImageView.frame = CGRectMake(bigImageView.bounds.size.width/2-(70-((200+ownerTableView.contentOffset.y)/3.5))/2, 70-((200+ownerTableView.contentOffset.y)/3.5), 70-((200+ownerTableView.contentOffset.y)/3.5), 70-((200+ownerTableView.contentOffset.y)/3.5));
        smallImageView.layer.cornerRadius = (70-((200+ownerTableView.contentOffset.y)/3.5))/2;
        NSLog(@"%f",num);
    }
        ownerTableView.scrollIndicatorInsets = ownerTableView.contentInset;
        num = -ownerTableView.contentOffset.y;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    return 1;
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"1"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"1"];
        cell.textLabel.text = @"1";
    }
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
