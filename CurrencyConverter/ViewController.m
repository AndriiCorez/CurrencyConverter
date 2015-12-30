//
//  ViewController.m
//  CurrencyConverter
//
//  Created by Andres on 12/29/15.
//  Copyright (c) 2015 Andres. All rights reserved.
//

#import "ViewController.h"
#import "CurrencyRequest/CRCurrencyRequest.h"
#import "CurrencyRequest/CRCurrencyResults.h"

@interface ViewController () <CRCurrencyRequestDelegate>
@property (weak, nonatomic) IBOutlet UITextField *fieldInput;
@property (weak, nonatomic) IBOutlet UILabel *currency1;
@property (weak, nonatomic) IBOutlet UILabel *currency2;
@property (weak, nonatomic) IBOutlet UILabel *currency3;
@property (weak, nonatomic) IBOutlet UIButton *btnConvert;
@property (nonatomic) CRCurrencyRequest *request;

@end

@implementation ViewController

- (IBAction)btnTapped:(id)sender {
    self.btnConvert.enabled = NO;
    
    self.request = [[CRCurrencyRequest alloc] init];
    self.request.delegate = self;
    [self.request start];
}

- (void)currencyRequest:(CRCurrencyRequest *)req retrievedCurrencies:(CRCurrencyResults *)currencies{
    
    double inputValue = [self.fieldInput.text floatValue];
    double eur = inputValue * currencies.EUR;
    double gbp = inputValue * currencies.GBP;
    double pln = inputValue * currencies.PLN;
    
    self.currency1.text = [NSString stringWithFormat:@"%.2f", eur];
    self.currency2.text = [NSString stringWithFormat:@"%.2f", gbp];
    self.currency3.text = [NSString stringWithFormat:@"%.2f", pln];
    self.btnConvert.enabled = YES;
}


@end
