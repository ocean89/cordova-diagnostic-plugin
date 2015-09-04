//
//  Diagnostic.m
//  Plugin diagnostic
//
//  Copyright (c) 2012 AVANTIC ESTUDIO DE INGENIEROS
//

#import "Diagnostic.h"
#import <CoreLocation/CoreLocation.h>

#import <arpa/inet.h> // For AF_INET, etc.
#import <ifaddrs.h> // For getifaddrs()
#import <net/if.h> // For IFF_LOOPBACK



@implementation Diagnostic

- (void)pluginInitialize {
    
    NSLog(@"Diagnostic Cordova Plugin");
    NSLog(@"(c)2013-2015 Don Coleman");
    
    [super pluginInitialize];
}

- (void) isLocationEnabled: (CDVInvokedUrlCommand*)command
{
    NSLog(@"Loading Location status...");
    CDVPluginResult* pluginResult;
    if([self isLocationEnabled] && [self isLocationAuthorized]) {   
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:1];   
    }
    else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:0];
                
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];

}

- (void) isLocationEnabledSetting: (CDVInvokedUrlCommand*)command
{
    NSLog(@"Loading Location status...");
    CDVPluginResult* pluginResult;
    if([self isLocationEnabled]) {
        
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:1];
        
    }
    else {
        
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:0];
        
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    
}

- (void) switchToLocationSettings: (CDVInvokedUrlCommand*)command
{
    NSLog(@"Switch To Location Settings not available...");
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:0];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}


- (void) isLocationAuthorized: (CDVInvokedUrlCommand*)command
{
    NSLog(@"Loading Location authentication...");
    CDVPluginResult* pluginResult;
    if([self isLocationAuthorized]) {
        
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:1];
        
    } else {
        
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:0];
        
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    
}

- (BOOL) isLocationEnabled
{

    if([CLLocationManager locationServicesEnabled]) {
        NSLog(@"Location is enabled.");
        return true;
    } else {
        NSLog(@"Location is disabled.");
        return false;
    }
    

}

- (BOOL) isLocationAuthorized
{

    if([CLLocationManager  authorizationStatus] != kCLAuthorizationStatusDenied) {
        NSLog(@"This app is authorized to use location.");
        return true;
    } else {
        NSLog(@"This app is not authorized to use location.");
        return false;
    }

}

@end
