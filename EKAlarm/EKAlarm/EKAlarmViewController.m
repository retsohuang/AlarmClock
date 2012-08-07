//
//  EKAlarmViewController.m
//  EKAlarm
//
//  Created by Retso Huang on 8/1/12.
//
//

#import "EKAlarmViewController.h"
#import <EventKit/EventKit.h>

#import <CommonCrypto/CommonDigest.h>

@interface EKAlarmViewController ()

@end

@implementation EKAlarmViewController
@synthesize dataPicker = _dataPicker;

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.dataPicker.date = [NSDate date];
  // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
  [self setDataPicker:nil];
  [super viewDidUnload];
  // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
      return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
  } else {
      return YES;
  }
}
- (IBAction)alarmSetButtonTapped {
  NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
  [dateFormatter setTimeZone:[NSTimeZone defaultTimeZone]];
  [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
  [dateFormatter setDateStyle:NSDateFormatterShortStyle];
  [dateFormatter setLocale:[NSLocale systemLocale]];
  
  NSString *dateTimeString = [dateFormatter stringFromDate:self.dataPicker.date];
  
  NSLog(@"Alarm Set Button Tapped : %@", dateTimeString);

  [self scheduleLocalNotificationWithDate:self.dataPicker.date];
  
  [self presentMessage:@"Alarm set!!"];
}
- (IBAction)alarmCancelButtonTapped {
  
  [[UIApplication sharedApplication] cancelAllLocalNotifications];
  [self presentMessage:@"Alarm cancelled"];
}
- (void)presentMessage:(NSString *)message {
  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alarm Clock"
                                                  message:message
                                                 delegate:nil
                                        cancelButtonTitle:@"OK"
                                        otherButtonTitles:nil];
  [alert show];
}
- (void)scheduleLocalNotificationWithDate:(NSDate *)fireDate {
  UILocalNotification *localNotification = [[UILocalNotification alloc] init];
  
  [localNotification setFireDate:fireDate];
  [localNotification setAlertBody:@"Time to wake up!"];
  [localNotification setSoundName:@"Thunder Song.m4r"];
  
  [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
}
@end
