//
//  TwoViewController.m
//  Meteorology
//
//  Created by QiMENG on 14-11-27.
//  Copyright (c) 2014年 QiMENG. All rights reserved.
//

#import "TwoViewController.h"
#import "AppDelegate.h"
@interface TwoViewController ()

@end

@implementation TwoViewController

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
	// Do any additional setup after loading the view, typically from a nib.
    
    [self convertCurrencyTapped:nil];
    
}

-(IBAction)convertCurrencyTapped:(id)sender {
    
    MKNetworkOperation *currencyOperation = [ApplicationDelegate.yahooEngine currencyRateFor:@"SGD"
                                                                                  inCurrency:@"USD"
                                                                                onCompletion:^(double rate) {
                                                                                    
                                                                                    [[[UIAlertView alloc] initWithTitle:@"Today's Singapore Dollar Rates"
                                                                                                                message:[NSString stringWithFormat:@"%.2f", rate]
                                                                                                               delegate:nil
                                                                                                      cancelButtonTitle:NSLocalizedString(@"Dismiss", @"")
                                                                                                      otherButtonTitles:nil] show];
                                                                                }
                                                                                     onError:^(NSError* error) {
                                                                                         
                                                                                         
                                                                                         DLog(@"%@\t%@\t%@\t%@", [error localizedDescription], [error localizedFailureReason],
                                                                                              [error localizedRecoveryOptions], [error localizedRecoverySuggestion]);
                                                                                     }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
