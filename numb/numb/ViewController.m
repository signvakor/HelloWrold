//
//  ViewController.m
//  numb
//
//  Created by vakor on 15/4/10.
//  Copyright (c) 2015年 com.kugou. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>{
    UIView *eye;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor redColor];
    NSLog(@"%@",NSStringFromCGRect(self.view.frame));
    NSLog(@"%@",NSStringFromCGRect([[UIScreen mainScreen] applicationFrame]));
    UITableView *table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    table.dataSource = self;
    table.delegate = self;
   
    self.view.backgroundColor = [UIColor blueColor];
    table.backgroundColor= [UIColor clearColor];
    self.title = @"fuck";
    table.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    table.tableHeaderView.backgroundColor = [UIColor lightGrayColor];
   
    eye = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    eye.backgroundColor = [UIColor greenColor];
   
   
     [self.view addSubview:table];
     [self.view addSubview:eye];
 
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if (scrollView.contentOffset.y > (scrollView.contentSize.height - scrollView.bounds.size.height)&& self.view.backgroundColor != [UIColor whiteColor]) {
        self.view.backgroundColor = [UIColor whiteColor];
    }else if (scrollView.contentOffset.y < 0 ){
        if (self.view.backgroundColor != [UIColor blueColor]) {
            self.view.backgroundColor = [UIColor blueColor];
        }
        CGRect rect = eye.frame;
        rect.size.height+= (fabs(scrollView.contentOffset.y))*0.03;
        NSLog(@"%f",scrollView.contentOffset.y);
       // NSLog(@"%f",fabs(scrollView.contentOffset.y));
       // eye.frame = rect;
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 100;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *i = @"cellreuseid";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:i ];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:i];
        cell.backgroundColor = [UIColor redColor];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld-%ld",indexPath.section,indexPath.row,nil];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
