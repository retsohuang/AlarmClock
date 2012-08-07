//
//  EKAlarmViewController.h
//  EKAlarm
//
//  Created by Retso Huang on 8/1/12.
//
//

#import <UIKit/UIKit.h>

@interface EKAlarmViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIDatePicker *dataPicker;

- (void)presentMessage:(NSString *)message;
- (void)scheduleLocalNotificationWithDate:(NSDate *)fireDate;
@end
