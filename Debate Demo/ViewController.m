//
//  ViewController.m
//  Debate Demo
//
//  Created by Elliott, Brian on 8/11/15.
//  Copyright © 2015 Focus on the Family. All rights reserved.
//

#import "ViewController.h"
#define CUSTOM_BUTTON_ID 100

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *shareButton;
- (IBAction)sharePicked:(id)sender;
@end

@implementation ViewController {
    AAShareBubbles *shareBubbles;
    float radius;
    float bubbleRadius;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    radius = 130;
    bubbleRadius = 30;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sharePicked:(id)sender {
    
    if(shareBubbles) {
        shareBubbles = nil;
    }
    shareBubbles = [[AAShareBubbles alloc] initWithPoint:self.shareButton.center radius:radius inView:self.view];
    shareBubbles.delegate = self;
    shareBubbles.bubbleRadius = bubbleRadius;
    shareBubbles.showFacebookBubble = YES;
    shareBubbles.showTwitterBubble = YES;
    shareBubbles.showGooglePlusBubble = YES;
    shareBubbles.showTumblrBubble = YES;
    shareBubbles.showVkBubble = YES;
    shareBubbles.showLinkedInBubble = YES;
    shareBubbles.showYoutubeBubble = YES;
    shareBubbles.showVimeoBubble = YES;
    shareBubbles.showRedditBubble = YES;
    shareBubbles.showPinterestBubble = YES;
    shareBubbles.showInstagramBubble = YES;
    shareBubbles.showWhatsappBubble = YES;
    
    [shareBubbles addCustomButtonWithIcon:[UIImage imageNamed:@"custom-vine-icon"]
                          backgroundColor:[UIColor colorWithRed:0.0 green:164.0/255.0 blue:120.0/255.0 alpha:1.0]
                              andButtonId:CUSTOM_BUTTON_ID];
    
    [shareBubbles show];


}

-(void)aaShareBubbles:(AAShareBubbles *)shareBubbles tappedBubbleWithType:(int)bubbleType
{
    switch (bubbleType) {
        case AAShareBubbleTypeFacebook:
            NSLog(@"Facebook");
            break;
        case AAShareBubbleTypeTwitter:
            NSLog(@"Twitter");
            break;
        case AAShareBubbleTypeGooglePlus:
            NSLog(@"Google+");
            break;
        case AAShareBubbleTypeTumblr:
            NSLog(@"Tumblr");
            break;
        case AAShareBubbleTypeVk:
            NSLog(@"Vkontakte (vk.com)");
            break;
        case AAShareBubbleTypeLinkedIn:
            NSLog(@"LinkedIn");
            break;
        case AAShareBubbleTypeYoutube:
            NSLog(@"Youtube");
            break;
        case AAShareBubbleTypeVimeo:
            NSLog(@"Vimeo");
            break;
        case AAShareBubbleTypeReddit:
            NSLog(@"Reddit");
            break;
        case CUSTOM_BUTTON_ID:
            NSLog(@"Custom Button With Type %d", bubbleType);
            break;
        default:
            break;
    }
}

@end
