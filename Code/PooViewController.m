//
//  PooViewController.m
//  Code
//
//  Created by crazypoo on 14-4-14.
//  Copyright (c) 2014年 crazypoo. All rights reserved.
//

#import "PooViewController.h"
#import "PooCodeView.h"
@interface PooViewController ()<UITextFieldDelegate>
@property (nonatomic, retain) UITextField *input;
@property (nonatomic, retain) PooCodeView *codeView;
@end

@implementation PooViewController
@synthesize input = _input;
@synthesize codeView = _codeView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.codeView = [[PooCodeView alloc] initWithFrame:CGRectMake((self.view.frame.size.width - 100)/2, (self.view.frame.size.width - 100)/2, 100, 40)];
    [self.view addSubview:self.codeView];
    
    self.input = [[UITextField alloc] initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, 40)];
    self.input.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.input.layer.borderWidth = 2.0;
    self.input.layer.cornerRadius = 5.0;
    self.input.font            = [UIFont systemFontOfSize:21];
    self.input.placeholder     = @"请输入验证码!";
    self.input.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.input.backgroundColor = [UIColor clearColor];
    self.input.textAlignment   = NSTextAlignmentCenter;
    self.input.returnKeyType   = UIReturnKeyDone;
    self.input.delegate        = self;
    [self.view addSubview:self.input];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if ([self.input.text isEqualToString:self.codeView.changeString]) {
        UIAlertView *alview = [[UIAlertView alloc] initWithTitle:@"ROFLOL" message:@"LOL" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alview show];
    }
    else
    {
        CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
        anim.repeatCount = 1;
        anim.values = @[@-20, @20, @-20];
        [self.codeView.layer addAnimation:anim forKey:nil];
        [self.input.layer addAnimation:anim forKey:nil];
    }
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;
{
    NSString * toBeString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    if (self.input)
    {
        if ([toBeString length] > 4) {
            self.input.text = [toBeString substringToIndex:4];
            return NO;
        }
    }
    return YES;
}
@end
