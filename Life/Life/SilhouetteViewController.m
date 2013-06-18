//
//  SilhouetteViewController.m
//  Life
//
//  Created by Magali Boizot-Roche on 13-04-29.
//  Copyright (c) 2013 Magali Boizot-Roche. All rights reserved.
//

#import "SilhouetteViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface SilhouetteViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *silhouette;

@property (weak, nonatomic) IBOutlet UILabel *storyLabel;
@property (weak, nonatomic) IBOutlet UITextView *instructionLabel;
@end

@implementation SilhouetteViewController

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
	// Do any additional setup after loading the view.
	
//	self.silhouette.center = self.view.center;
//	self.storyLabel.alpha = 0.0;
//	self.instructionLabel.hidden = YES;
}

- (void)viewWillAppear:(BOOL)animated
{
	self.silhouette.center = self.view.center;
	self.storyLabel.alpha = 0.0;
	self.instructionLabel.hidden = YES;
}

- (void) viewDidAppear:(BOOL)animated
{
	
	[UIView animateWithDuration:3.0
						  delay:0.0
						options:UIViewAnimationOptionAllowUserInteraction
					 animations:^(void) {
		self.silhouette.frame = CGRectMake(self.silhouette.frame.origin.x - self.silhouette.frame.size.width / 2, self.silhouette.frame.origin.y - self.silhouette.frame.size.height / 2, self.silhouette.frame.size.width * 2, self.silhouette.frame.size.height * 2);
					 }
					completion:nil];
	
	[UIView animateWithDuration:4.0
						   delay:0.0
						 options:UIViewAnimationOptionAllowUserInteraction
					  animations:^(void) {
						  self.storyLabel.alpha = 1.0;
					  }
					  completion:^(BOOL finished) {
						  if (finished) {
							  //self.silhouetteTargetButton.hidden = NO;
							  self.instructionLabel.hidden = NO;
						  }
						  
					  }];
}

-(NSUInteger)supportedInterfaceOrientations
{
	return (UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskPortraitUpsideDown);
}

//- (void) willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
//{
//	self.silhouette.frame = CGRectMake(self.silhouette.frame.origin.x - self.silhouette.frame.size.width / 2, self.silhouette.frame.origin.y - self.silhouette.frame.size.height / 2, self.silhouette.frame.size.width * 2, self.silhouette.frame.size.height * 2);
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)silhouetteTargetButtonClicked:(id)sender {
	
	
}
@end
