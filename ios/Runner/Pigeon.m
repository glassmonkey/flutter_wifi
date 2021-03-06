// Autogenerated from Pigeon (v0.1.15), do not edit directly.
// See also: https://pub.dev/packages/pigeon
#import "Pigeon.h"
#import <Flutter/Flutter.h>

#if !__has_feature(objc_arc)
#error File requires ARC to be enabled.
#endif

static NSDictionary* wrapResult(NSDictionary *result, FlutterError *error) {
  NSDictionary *errorDict = (NSDictionary *)[NSNull null];
  if (error) {
    errorDict = [NSDictionary dictionaryWithObjectsAndKeys:
        (error.code ? error.code : [NSNull null]), @"code",
        (error.message ? error.message : [NSNull null]), @"message",
        (error.details ? error.details : [NSNull null]), @"details",
        nil];
  }
  return [NSDictionary dictionaryWithObjectsAndKeys:
      (result ? result : [NSNull null]), @"result",
      errorDict, @"error",
      nil];
}

@interface FlutterWifiResponse ()
+(FlutterWifiResponse*)fromMap:(NSDictionary*)dict;
-(NSDictionary*)toMap;
@end
@interface FlutterWifiRequest ()
+(FlutterWifiRequest*)fromMap:(NSDictionary*)dict;
-(NSDictionary*)toMap;
@end

@implementation FlutterWifiResponse
+(FlutterWifiResponse*)fromMap:(NSDictionary*)dict {
  FlutterWifiResponse* result = [[FlutterWifiResponse alloc] init];
  result.availableDetect = dict[@"availableDetect"];
  if ((NSNull *)result.availableDetect == [NSNull null]) {
    result.availableDetect = nil;
  }
  result.availableWifi = dict[@"availableWifi"];
  if ((NSNull *)result.availableWifi == [NSNull null]) {
    result.availableWifi = nil;
  }
  result.availableMobile = dict[@"availableMobile"];
  if ((NSNull *)result.availableMobile == [NSNull null]) {
    result.availableMobile = nil;
  }
  return result;
}
-(NSDictionary*)toMap {
  return [NSDictionary dictionaryWithObjectsAndKeys:(self.availableDetect ? self.availableDetect : [NSNull null]), @"availableDetect", (self.availableWifi ? self.availableWifi : [NSNull null]), @"availableWifi", (self.availableMobile ? self.availableMobile : [NSNull null]), @"availableMobile", nil];
}
@end

@implementation FlutterWifiRequest
+(FlutterWifiRequest*)fromMap:(NSDictionary*)dict {
  FlutterWifiRequest* result = [[FlutterWifiRequest alloc] init];
  result.isDetect = dict[@"isDetect"];
  if ((NSNull *)result.isDetect == [NSNull null]) {
    result.isDetect = nil;
  }
  return result;
}
-(NSDictionary*)toMap {
  return [NSDictionary dictionaryWithObjectsAndKeys:(self.isDetect ? self.isDetect : [NSNull null]), @"isDetect", nil];
}
@end

@interface FlutterCallbackApi ()
@property (nonatomic, strong) NSObject<FlutterBinaryMessenger>* binaryMessenger;
@end

@implementation FlutterCallbackApi
- (instancetype)initWithBinaryMessenger:(NSObject<FlutterBinaryMessenger>*)binaryMessenger {
  self = [super init];
  if (self) {
    self.binaryMessenger = binaryMessenger;
  }
  return self;
}

- (void)apply:(FlutterWifiResponse*)input completion:(void(^)(NSError* _Nullable))completion {
  FlutterBasicMessageChannel *channel =
    [FlutterBasicMessageChannel
      messageChannelWithName:@"dev.flutter.pigeon.CallbackApi.apply"
      binaryMessenger:self.binaryMessenger];
  NSDictionary* inputMap = [input toMap];
  [channel sendMessage:inputMap reply:^(id reply) {
    completion(nil);
  }];
}
@end
void FlutterApiSetup(id<FlutterBinaryMessenger> binaryMessenger, id<FlutterApi> api) {
  {
    FlutterBasicMessageChannel *channel =
      [FlutterBasicMessageChannel
        messageChannelWithName:@"dev.flutter.pigeon.Api.call"
        binaryMessenger:binaryMessenger];
    if (api) {
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        FlutterError *error;
        FlutterWifiRequest *input = [FlutterWifiRequest fromMap:message];
        FlutterWifiResponse *output = [api call:input error:&error];
        callback(wrapResult([output toMap], error));
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
}
