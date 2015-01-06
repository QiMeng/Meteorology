//
//  WeatherViewController.m
//  Meteorology
//
//  Created by QiMENG on 15/1/7.
//  Copyright (c) 2015年 QiMENG. All rights reserved.
//

#import "WeatherViewController.h"
#import "WeatherModel.h"
#import "WeatherCell.h"
@interface WeatherViewController ()

@end

@implementation WeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
//    self.navigationController.navigationBarHidden = NO;
//    self.navigationController.hidesBarsOnSwipe = YES;//ios8才有
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _weatherArray.count/3;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    return 300;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    WeatherCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WeatherCell"];
    
    if (!cell) {
        
        [tableView registerNib:[UINib nibWithNibName:@"WeatherCell" bundle:nil] forCellReuseIdentifier:@"WeatherCell"];
        
        cell = [tableView dequeueReusableCellWithIdentifier:@"WeatherCell"];
        
    }
    
    WeatherModel * model = _weatherArray[indexPath.row*3];

    cell.model = model;

    return cell;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
