//
//  OptionViewController.m
//  Life
//
//  Created by Magali Boizot-Roche on 13-04-30.
//  Copyright (c) 2013 Magali Boizot-Roche. All rights reserved.
//

#import "OptionViewController.h"
#import "LifeViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface OptionViewController ()
- (IBAction)clickedReturnToTree:(id)sender;
@property (weak, nonatomic) IBOutlet UITextView *storyTextView;
@property (weak, nonatomic) IBOutlet UIButton *topClickHereButton;
@property (weak, nonatomic) IBOutlet UIButton *secondClickHereButton;
@property (weak, nonatomic) IBOutlet UIButton *bottomClickHereButton;

@end

@implementation OptionViewController

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

	UIBarButtonItem *returnToTreeButton = [[UIBarButtonItem alloc] initWithTitle:@"Return to start" style:UIBarButtonItemStyleBordered target:self action:@selector(clickedReturnToTree:)];
	
	self.navigationItem.rightBarButtonItem = returnToTreeButton;
	
	self.storyTextView.backgroundColor = [UIColor clearColor];

	if (self.topClickHereButton) {
		self.topClickHereButton.alpha = 0.8;
	}
	
	if (self.secondClickHereButton) {
		self.secondClickHereButton.alpha = 0.8;
	}
	
	if (self.bottomClickHereButton) {
		self.bottomClickHereButton.alpha = 0.8;
	}	
}

-(NSUInteger)supportedInterfaceOrientations
{
	return (UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskPortraitUpsideDown);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickedReturnToTree:(id)sender {

	[self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:1] animated:YES];
}

@end
