const amplifyconfig = '''{
    "UserAgent": "aws-amplify-cli/2.0",
    "Version": "1.0",
    "analytics": {
        "plugins": {
            "awsPinpointAnalyticsPlugin": {
                "pinpointAnalytics": {
                    "appId": "1714b36b48d1409394841607eb3d0e4a",
                    "region": "ap-southeast-2"
                },
                "pinpointTargeting": {
                    "region": "ap-southeast-2"
                }
            }
        }
    },
    "auth": {
        "plugins": {
            "awsCognitoAuthPlugin": {
                "UserAgent": "aws-amplify-cli/0.1.0",
                "Version": "0.1.0",
                "IdentityManager": {
                    "Default": {}
                },
                "CredentialsProvider": {
                    "CognitoIdentity": {
                        "Default": {
                            "PoolId": "ap-southeast-2:257dabaf-6467-46b6-beeb-1ad532aa1484",
                            "Region": "ap-southeast-2"
                        }
                    }
                },
                "CognitoUserPool": {
                    "Default": {
                        "PoolId": "ap-southeast-2_pPTjHtqsD",
                        "AppClientId": "6c9hphq5jiatfatm8g4jvse246",
                        "Region": "ap-southeast-2"
                    }
                },
                "Auth": {
                    "Default": {
                        "authenticationFlowType": "USER_SRP_AUTH",
                        "socialProviders": [],
                        "usernameAttributes": [],
                        "signupAttributes": [
                            "EMAIL"
                        ],
                        "passwordProtectionSettings": {
                            "passwordPolicyMinLength": 8,
                            "passwordPolicyCharacters": []
                        },
                        "mfaTypes": [
                            "SMS"
                        ],
                        "verificationMechanisms": [
                            "EMAIL"
                        ],
                        "mfaConfiguration": "OFF"
                    }
                },
                "PinpointAnalytics": {
                    "Default": {
                        "AppId": "1714b36b48d1409394841607eb3d0e4a",
                        "Region": "ap-southeast-2"
                    }
                },
                "PinpointTargeting": {
                    "Default": {
                        "Region": "ap-southeast-2"
                    }
                }
            }
        }
    }
}''';
