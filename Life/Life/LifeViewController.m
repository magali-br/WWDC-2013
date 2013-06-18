//
//  LifeViewController.m
//  Life
//
//  Created by Magali Boizot-Roche on 13-04-29.
//  Copyright (c) 2013 Magali Boizot-Roche. All rights reserved.
//

#import "LifeViewController.h"
#import <Quartzcore/QuartzCore.h>
#import "OptionViewController.h"

@interface LifeViewController ()
@property (weak, nonatomic) IBOutlet UIButton *targetButton;
@property (weak, nonatomic) IBOutlet UIImageView *treeImage;
@property (weak, nonatomic) IBOutlet UIImageView *castleImage;
@property (weak, nonatomic) IBOutlet UIImageView *computerImage;
@property (weak, nonatomic) IBOutlet UIImageView *graduationCapImage;
@property (weak, nonatomic) IBOutlet UIImageView *cellphoneImage;
@property (weak, nonatomic) IBOutlet UIImageView *houseImage;
@property (weak, nonatomic) IBOutlet UIImageView *squirrelImage;
@property (weak, nonatomic) IBOutlet UIImageView *languagesImage;

@property (nonatomic) BOOL panTargetButtonBegan;
@end

@implementation LifeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	self.panTargetButtonBegan = NO;
	
	self.treeImage.center = self.view.center;
	
	self.targetButton.layer.cornerRadius = 22;
	self.targetButton.layer.masksToBounds = YES;

	UIBezierPath *shapePath = [UIBezierPath bezierPathWithOvalInRect:self.targetButton.bounds];
	CAShapeLayer *shapeLayer = [CAShapeLayer layer];
	shapeLayer.frame = self.targetButton.bounds;
	shapeLayer.path = shapePath.CGPath;
	shapeLayer.fillColor = [UIColor clearColor].CGColor;
	shapeLayer.strokeColor = [UIColor blackColor].CGColor;
	shapeLayer.lineWidth = 2;
	[self.targetButton.layer addSublayer:shapeLayer];

	self.treeImage.center = self.view.center;
	
	UIPanGestureRecognizer *panButtonRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleDragTargetButton:)];
	[self.view addGestureRecognizer:panButtonRecognizer];
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

- (IBAction)targetButtonClicked:(id)sender {
	
	[UIView animateWithDuration: .26
                          delay: 0
                        options: UIViewAnimationOptionAutoreverse | UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                         [UIView setAnimationRepeatCount: 4];
						 
						 self.targetButton.frame = CGRectMake(100, 100, self.targetButton.frame.size.width, self.targetButton.frame.size.height);
                     }
                     completion:^(BOOL finished) {
                         if (finished) {

                         }
                     }];
}

- (void)handleDragTargetButton:(UIGestureRecognizer *)sender
{
	CGPoint point = [sender locationInView:self.view];
	if (sender.state == UIGestureRecognizerStateBegan) {
		if ( (point.x >= self.targetButton.frame.origin.x)
			&& (point.y >= self.targetButton.frame.origin.y)
			&& (point.x <= self.targetButton.frame.origin.x + self.targetButton.frame.size.width)
			&& (point.y <= self.targetButton.frame.origin.y + self.targetButton.frame.size.height) ) {
			
			self.panTargetButtonBegan = YES;

		}
				
	} else if ((sender.state == UIGestureRecognizerStateChanged) && self.panTargetButtonBegan) {
		self.targetButton.center = point;
		
	} else if ((sender.state == UIGestureRecognizerStateEnded) && self.panTargetButtonBegan) {

		self.targetButton.center = point;
		NSString *identifier = nil;
		if ([self point:point isInFrame:self.treeImage.frame]) {
			 
			identifier = @"Reach";

		} else if ([self point:point isInFrame:self.castleImage.frame]) {
			identifier = @"Germany";
			
		} else if ([self point:point isInFrame:self.cellphoneImage.frame]) {
			identifier = @"Fixmo";
			
		} else if ([self point:point isInFrame:self.computerImage.frame]) {
			identifier = @"CL";
			
		} else if ([self point:point isInFrame:self.houseImage.frame]) {
			identifier = @"Montessori";
			
		} else if ([self point:point isInFrame:self.graduationCapImage.frame]) {
			identifier = @"UofT";
			
		} else if ([self point:point isInFrame:self.squirrelImage.frame]) {
			identifier = @"Katimavik";
			
		} else if ([self point:point isInFrame:self.languagesImage.frame]) {
			identifier = @"Languages";
			
		} else {
		}
		
		if (identifier) {
			OptionViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:identifier];
		
			if (controller) {
				[self.navigationController pushViewController:controller animated:NO];
			}
		}
		
		self.panTargetButtonBegan = NO;
	}
}

-(BOOL) point:(CGPoint)point isInFrame:(CGRect)frame
{
	if ( (point.x >= frame.origin.x)
		&& (point.y >= frame.origin.y)
		&& (point.x <= frame.origin.x + frame.size.width)
		&& (point.y <= frame.origin.y + frame.size.height)) {
		return YES;
	}
	return NO;
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	if ([touches count] == 2) {
		//[self handleTap]
	}
}

@end
