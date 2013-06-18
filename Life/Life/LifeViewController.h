//
//  LifeViewController.h
//  Life
//
//  Created by Magali Boizot-Roche on 13-04-29.
//  Copyright (c) 2013 Magali Boizot-Roche. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LifeViewController : UIViewController <UIGestureRecognizerDelegate>
- (IBAction)targetButtonClicked:(id)sender;

-(BOOL) point:(CGPoint)point isInFrame:(CGRect)frame;
@end
