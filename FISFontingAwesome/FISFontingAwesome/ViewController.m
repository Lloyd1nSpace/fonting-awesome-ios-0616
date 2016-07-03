//
//  ViewController.m
//  FISFontingAwesome
//
//  Created by Lloyd W. Sykes on 6/30/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

#import "ViewController.h"
#import "FontAwesomeKit/FontAwesomeKit.h"
#import "CWStatusBarNotification.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *logoButton;
@property (strong, nonatomic) FAKFoundationIcons *bookmarkIcon;
@property (strong, nonatomic) FAKZocial *twitterIcon;

@property (strong, nonatomic) CWStatusBarNotification *notification;
// These unique objects are from the Cocoapods.

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.notification = [CWStatusBarNotification new];
    self.notification.notificationStyle = CWNotificationStyleNavigationBarNotification;
    self.notification.notificationAnimationInStyle = CWNotificationAnimationStyleTop;
    self.notification.notificationAnimationOutStyle = CWNotificationAnimationStyleTop;
    self.notification.notificationLabelBackgroundColor = [UIColor purpleColor];
    self.notification.notificationLabelTextColor = [UIColor whiteColor];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonTapped:(id)sender {
    
    if ([self.logoButton.currentAttributedTitle isEqual: [self.bookmarkIcon attributedString]]) {
        [self.notification dismissNotification];
        self.twitterIcon = [FAKZocial twitterIconWithSize:100];
        [self.twitterIcon addAttribute:NSForegroundColorAttributeName value:[UIColor purpleColor]];
        [self.logoButton setAttributedTitle:[self.twitterIcon attributedString] forState:UIControlStateNormal];
        
        
    } else {
        
        [self.notification displayNotificationWithMessage:@"Bookmark saved!" completion:nil];
        self.bookmarkIcon = [FAKFoundationIcons bookmarkIconWithSize:100];
        [self.bookmarkIcon addAttribute:NSForegroundColorAttributeName value:[UIColor purpleColor]];
        [self.logoButton setAttributedTitle:[self.bookmarkIcon attributedString] forState:UIControlStateNormal];
        
    }
    
}

@end
