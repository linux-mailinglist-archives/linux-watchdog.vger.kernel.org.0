Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 959F6347168
	for <lists+linux-watchdog@lfdr.de>; Wed, 24 Mar 2021 07:07:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235479AbhCXGHI (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 24 Mar 2021 02:07:08 -0400
Received: from mail-bn8nam11on2078.outbound.protection.outlook.com ([40.107.236.78]:39457
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232833AbhCXGGw (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 24 Mar 2021 02:06:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mLoRh0Le0SmobaT/NqDfLpSh9iY/HduEdGCB8oz10ZY0pJrJIZ5fxDdf7vC4jnKs0u1J9B+Om3TNbaWX6KUfrbnD3ahx+eFyRgF3MNtEataCRptcii0Tclt1nS1dHi62fk1Yl+B5ul8d2WEDzBtyoQL7trDI/2sQ5ynegoCdhlb2Y+BPOWwa2Ipcq/GB1YT9Se2a5o0twi8+h1ng4RcT88zqd/4YQAG0rJ7MDSViOleGAxWrpT9e017yOwumlXuHPCbWPQtHFBLnS2q/WJ73PRiks7pMnBMziOBKdnLQhifkh0q/D88XpVEE9KIAnPDb738gPYUU3TugruST0YcGUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B3tY25yj+JoxKXRb6w+O/dpmPvXJvbERajnF9aW3Q+E=;
 b=QIRO9t0SaXkSSQmTyYk1St3Xqo3l3wIRTVgHsMaCP85n2+NGIPDKl8kQ+BhKc0Qs9vPHWgJj86GREaPGncT4hg/g4+Fj+WXH3fUSMhZ28saOg5Zo5pziekc/AHbz1uUC6lbSCBEpWI+HAH6s6OfQKWGK3W0e74YIU4h6fWc1kMmq5TTQWuV/IHeYaHB21YbG6bFfwAMfNWdVg99/rUDKJ1lUG1z2GGPrS3e+/pv9U4cSaKXiooQ3KrFGYXrH5sCXqVK3PNOdss5/O74AESHulaDq5si3eG4Y6ScwYEywTynn7/+YmhAbRB7FLsHZ9zk1uPXfLTojNr/a2g9OKAHCBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B3tY25yj+JoxKXRb6w+O/dpmPvXJvbERajnF9aW3Q+E=;
 b=s7e9qi9mRlCiwl6Kmui7R3KlP/cqgwTGhY/nr9DM5GjobhjsLnaTxEDRo1XzY+fLbQxCGheNqJW2bsWyxSy1lV3bRJADiO19poLyEGBjF6QATk3UoWHQaOOPZP7pfI9rf1mLRQc1xMDXaD/ap75xkR+fq2THSZ3affa6/h4YlwU=
Received: from DM6PR02MB5386.namprd02.prod.outlook.com (2603:10b6:5:75::25) by
 DM5PR02MB3813.namprd02.prod.outlook.com (2603:10b6:4:af::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.30; Wed, 24 Mar 2021 06:06:47 +0000
Received: from DM6PR02MB5386.namprd02.prod.outlook.com
 ([fe80::bdf8:e364:ff76:5a5a]) by DM6PR02MB5386.namprd02.prod.outlook.com
 ([fe80::bdf8:e364:ff76:5a5a%7]) with mapi id 15.20.3977.024; Wed, 24 Mar 2021
 06:06:47 +0000
From:   Srinivas Neeli <sneeli@xilinx.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Michal Simek <michals@xilinx.com>,
        Shubhrajyoti Datta <shubhraj@xilinx.com>,
        Srinivas Goud <sgoud@xilinx.com>
CC:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        git <git@xilinx.com>, Srinivas Goud <sgoud@xilinx.com>
Subject: RE: [PATCH 2/9] watchdog: of_xilinx_wdt: Used BIT macro
Thread-Topic: [PATCH 2/9] watchdog: of_xilinx_wdt: Used BIT macro
Thread-Index: AQHXGYiU4LDFPsvrI0yyhMMRk36T+qqF45mAgAzQ8iA=
Date:   Wed, 24 Mar 2021 06:06:47 +0000
Message-ID: <DM6PR02MB5386436F15C3855EA9697299AF639@DM6PR02MB5386.namprd02.prod.outlook.com>
References: <1615805214-24857-1-git-send-email-srinivas.neeli@xilinx.com>
 <1615805214-24857-3-git-send-email-srinivas.neeli@xilinx.com>
 <911ea811-9b9d-f2e1-bd0b-74432e652c04@roeck-us.net>
In-Reply-To: <911ea811-9b9d-f2e1-bd0b-74432e652c04@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [103.200.40.46]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e1f953c6-cfe2-4ebd-418d-08d8ee8b0252
x-ms-traffictypediagnostic: DM5PR02MB3813:
x-ld-processed: 657af505-d5df-48d0-8300-c31994686c5c,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR02MB38138959D9F59648E825ACF9AF639@DM5PR02MB3813.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:345;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Mb6fzyXTdB2hsLvYC8tPHlStYUx+AvKAiMYr1C5HcKed8e4aqsWYn7hbyaozEl9+y+3ak5Znvksct8c287RVOo6FATQxWEMhIZMys2RBIH57S15fVqxQLPlENGEhGf6loXkNCbG81yfydYoK9oRGZ8smgU3JXVxr5AY9d3TwDyMI3cqQxGB04q1QY+roQk9a2LDNtS9dpVE82vueF81yFyqI8Md8YCXiOtuZAhg7Qfjz2FFceaA/8OQd0tl6eG6SZ502jL0ul3z6EjFXcq3phawSl3aIADS0QOiEuY/HCQVWdkKEpDms7iikIEYg8gY+aMTcMv7PLH8SPZZoMS9IMkhH6anyC5Fwvy6GoPqoQ4jILLGhL8PAmEfvzU5L9udN1Xm4l+C/CP1Wkq9Gecc9uUX9XSXxu9hoUKZXk3EGAiAxrE3m8d2C5f9YCBe9o3qI+ubMwyG+8LXdYc8QtYyI6DQpL+I/ZEEyjq6sQQ6ToTsWiBVd69KCzLT7q47CzS/NTFDeIqvV8GE9ovhYk/Ps/aQvM+SPAJbZ85zpiu+GBsgZLp9H5IZRNx1bgDlRAUIPCcU24ckTtgUA8mtCS5hJOQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR02MB5386.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(396003)(366004)(39860400002)(71200400001)(38100700001)(66476007)(26005)(83380400001)(64756008)(53546011)(66946007)(86362001)(66556008)(4326008)(33656002)(55016002)(2906002)(316002)(8936002)(107886003)(66446008)(5660300002)(6636002)(52536014)(478600001)(110136005)(6506007)(9686003)(76116006)(186003)(54906003)(7696005)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?N0xYQXVjekpIOTYrYml3cFZFK0xBakdGTllrbU9QYktYR1dBZVphekV5dmNi?=
 =?utf-8?B?UnlTeXY4bFVNVU1oZzd3VVhIZ2hiWVN2c3pnU1hyVXZXWVRUU2JmTk5aemZs?=
 =?utf-8?B?TWhpS1hkbmtkblpzeGZzRzlRRXNSbHJrNUd2Y1lYd01LYmpmbFJlaUJNNkhh?=
 =?utf-8?B?NTlsbVJOWVFvMlNaSEtZUHo5Y3lxUXM5K2Fhc3prdXk2WHJpTlkxMVE3d2pG?=
 =?utf-8?B?Q0pRbkFZQXA0Y1FDRVEvL1BSS095SXh4a1ZLNlFsOUJ3WG9aZ1VYR3dTNEpQ?=
 =?utf-8?B?bXZEc0dEZlVqWThBQ2tKVjBsdlpDbzg3dGlGSjVRaDJVNFZQaURtL0I1elNC?=
 =?utf-8?B?UHViM3ZodnpUWURsc01Bc2tTS1dMSXdqM1l4QVRCbUJYQ3dacFAzZXJESWN6?=
 =?utf-8?B?bWdONkw5ejN4c2xSL2tLSDQ5R2t3WVR6UjQ5eC91MGdWNUpnY293c1Q3YmVn?=
 =?utf-8?B?Rml2a1pxbzZjZytzWHY3UFlKa3lKVGY4dWhPMVNPV2R2dVVOQUQ0b203ZGNO?=
 =?utf-8?B?VmErZnRkTzNFeDFyeStkTEVXOTRBQWZVdklvTW9sTWxaTVlLc1FUY3o2YmJi?=
 =?utf-8?B?dGxEYlZhKzRUdWV3NS9Ud3JnNkpiNUtHSDAxeHBXV0tpRXRIR3BvSXdxMHZ1?=
 =?utf-8?B?WTBJaFd2dFdHdkpuQWt0a0o2QlFzQWg3VzFobW1ab1BPRWMyT2VnYXdSVEtz?=
 =?utf-8?B?Z3I1MVhTRG9nN0xqd3ZVdTVsSUg2VVJ0bnB0REppWUZ2SnlwSW9XUTM5c2Fv?=
 =?utf-8?B?NDdIeVoxVHdHdUEyVjQ1VDFjeVQ4cU1vUml5YXJtN1JwVUpNS1BCRUpIbXpw?=
 =?utf-8?B?MHArNmNUNFcvdmJOZ1F2cVFGbHBRZ3BSOHZVc044LzhmTHVaREZrbWtlWTI3?=
 =?utf-8?B?WHFVR0lxM1RPdkg1bmF3UG1mdmg4ZmI0SUtNWEpzNHRrN0xaSGVaZVdLSXYw?=
 =?utf-8?B?RnVha28vWHBJNkV5RFZweCtuck9NZFNlOW9xaDRzOGpDSFI1THR1d2dzNHRZ?=
 =?utf-8?B?TUh5QnpoV1hGVFpySWxBVmhSVko3Q2FQRGJQVjkrOGNMUGI3am4vVzBzVU1P?=
 =?utf-8?B?RWFaS0dKRjhmMjdyQ2tveFJoWnNQYkQralJYczRqQzk5UmJhbHhVUmcxU1dN?=
 =?utf-8?B?M1UwbG4yejNpRW5sR2dKQlF4OUN1czNTbUpSZDhHR1cwQ0E2eXRMSTd4VlhC?=
 =?utf-8?B?bCtIV0NpSTlxSDRpNXNVQzVaQjg5YTEzNkFxTUxpOXBxQ0NXMzBXc3l5b3Mr?=
 =?utf-8?B?YkdVcU5aT3JHbldzTE92azloOGFhN3lucGNFRUppVFNWY095MERMTFFCNFd0?=
 =?utf-8?B?bFRwcVhyR1g1WVVnVHhNSFV2S0FpZE45cmwxVGV4MURHSkIrSnQ5VFVjbWx3?=
 =?utf-8?B?bzdOdlJXYkcxdU1WTENaVDBOVlg5ZW1kR1RlbmdXaFJIbW9QQVJQN2EwOWdB?=
 =?utf-8?B?emN6Wis3c3NEMnphNlZVL3ZpYm8wZ2F5MmE4OUpUVzdqbEtGQ292WkNIdUZ0?=
 =?utf-8?B?WFZtMEY2Vkd0NVNIZlZYTzlDbzVKVG5QbnkyMXBMWTREQ2dncUxLTWMra3dC?=
 =?utf-8?B?VjdKcEZMT00xWkZQNitMVVNTR3M5NGkwZEw2VnFFOHFaNmkycG9iVXNxbGMz?=
 =?utf-8?B?UGkrN2crVk9IaVhGSmNWaFJnT0VuK3k1aCtmNDI4enZ6a29iUVZyclpNNlFK?=
 =?utf-8?B?OVlZYmpGM1ZkNjZjZmtGYXovK3ZZSHN4cjN6MkFoUFdOQzJ3cTloNXlLdGVl?=
 =?utf-8?Q?JaKrLUyA9M2JJ3AoLTuUiu+xIPuX50sMpvDz7+h?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR02MB5386.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1f953c6-cfe2-4ebd-418d-08d8ee8b0252
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2021 06:06:47.9165
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u/1LQFIAMe3qpFuBfSOesAXta77083IbqEYY9+wqwWwJpsh2YYWPeueU3GPlXQrARWemeIHx/qjXUkl4fnZWLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB3813
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

SGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR3VlbnRlciBSb2Vj
ayA8Z3JvZWNrN0BnbWFpbC5jb20+IE9uIEJlaGFsZiBPZiBHdWVudGVyIFJvZWNrDQo+IFNlbnQ6
IFR1ZXNkYXksIE1hcmNoIDE2LCAyMDIxIDc6NTMgQU0NCj4gVG86IFNyaW5pdmFzIE5lZWxpIDxz
bmVlbGlAeGlsaW54LmNvbT47IE1pY2hhbCBTaW1layA8bWljaGFsc0B4aWxpbnguY29tPjsNCj4g
U2h1YmhyYWp5b3RpIERhdHRhIDxzaHViaHJhakB4aWxpbnguY29tPjsgU3Jpbml2YXMgR291ZA0K
PiA8c2dvdWRAeGlsaW54LmNvbT4NCj4gQ2M6IHdpbUBsaW51eC13YXRjaGRvZy5vcmc7IGxpbnV4
LXdhdGNoZG9nQHZnZXIua2VybmVsLm9yZzsgbGludXgtYXJtLQ0KPiBrZXJuZWxAbGlzdHMuaW5m
cmFkZWFkLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgZ2l0DQo+IDxnaXRAeGls
aW54LmNvbT47IFNyaW5pdmFzIEdvdWQgPHNnb3VkQHhpbGlueC5jb20+DQo+IFN1YmplY3Q6IFJl
OiBbUEFUQ0ggMi85XSB3YXRjaGRvZzogb2ZfeGlsaW54X3dkdDogVXNlZCBCSVQgbWFjcm8NCj4g
DQo+IE9uIDMvMTUvMjEgMzo0NiBBTSwgU3Jpbml2YXMgTmVlbGkgd3JvdGU6DQo+ID4gRnJvbTog
U3Jpbml2YXMgR291ZCA8c3Jpbml2YXMuZ291ZEB4aWxpbnguY29tPg0KPiA+DQo+ID4gVXNlZCBC
SVQgbWFjcm8gaW5zdGVhZCBvZiBtYXNrIHZhbHVlLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTog
U3Jpbml2YXMgR291ZCA8c3Jpbml2YXMuZ291ZEB4aWxpbnguY29tPg0KPiA+IFNpZ25lZC1vZmYt
Ynk6IE1pY2hhbCBTaW1layA8bWljaGFsLnNpbWVrQHhpbGlueC5jb20+DQo+ID4gU2lnbmVkLW9m
Zi1ieTogU3Jpbml2YXMgTmVlbGkgPHNyaW5pdmFzLm5lZWxpQHhpbGlueC5jb20+DQo+ID4gLS0t
DQo+ID4gIGRyaXZlcnMvd2F0Y2hkb2cvb2ZfeGlsaW54X3dkdC5jIHwgOCArKysrLS0tLQ0KPiA+
ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiA+DQo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvd2F0Y2hkb2cvb2ZfeGlsaW54X3dkdC5jDQo+ID4gYi9k
cml2ZXJzL3dhdGNoZG9nL29mX3hpbGlueF93ZHQuYw0KPiA+IGluZGV4IDAwNTQ5MTY0YjNkNy4u
MGQ3ZGYyMzcwZGI3IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvd2F0Y2hkb2cvb2ZfeGlsaW54
X3dkdC5jDQo+ID4gKysrIGIvZHJpdmVycy93YXRjaGRvZy9vZl94aWxpbnhfd2R0LmMNCj4gPiBA
QCAtMjQsMTIgKzI0LDEyIEBADQo+ID4gICNkZWZpbmUgWFdUX1RCUl9PRkZTRVQgICAgICAweDgg
LyogVGltZWJhc2UgUmVnaXN0ZXIgT2Zmc2V0ICovDQo+ID4NCj4gPiAgLyogQ29udHJvbC9TdGF0
dXMgUmVnaXN0ZXIgTWFza3MgICovDQo+ID4gLSNkZWZpbmUgWFdUX0NTUjBfV1JTX01BU0sgICAw
eDAwMDAwMDA4IC8qIFJlc2V0IHN0YXR1cyAqLw0KPiA+IC0jZGVmaW5lIFhXVF9DU1IwX1dEU19N
QVNLICAgMHgwMDAwMDAwNCAvKiBUaW1lciBzdGF0ZSAgKi8NCj4gPiAtI2RlZmluZSBYV1RfQ1NS
MF9FV0RUMV9NQVNLIDB4MDAwMDAwMDIgLyogRW5hYmxlIGJpdCAxICovDQo+ID4gKyNkZWZpbmUg
WFdUX0NTUjBfV1JTX01BU0sJQklUKDMpIC8qIFJlc2V0IHN0YXR1cyAqLw0KPiA+ICsjZGVmaW5l
IFhXVF9DU1IwX1dEU19NQVNLCUJJVCgyKSAvKiBUaW1lciBzdGF0ZSAgKi8NCj4gPiArI2RlZmlu
ZSBYV1RfQ1NSMF9FV0RUMV9NQVNLCUJJVCgxKSAvKiBFbmFibGUgYml0IDEgKi8NCj4gPg0KPiA+
ICAvKiBDb250cm9sL1N0YXR1cyBSZWdpc3RlciAwLzEgYml0cyAgKi8gLSNkZWZpbmUgWFdUX0NT
UlhfRVdEVDJfTUFTSw0KPiA+IDB4MDAwMDAwMDEgLyogRW5hYmxlIGJpdCAyICovDQo+ID4gKyNk
ZWZpbmUgWFdUX0NTUlhfRVdEVDJfTUFTSwlCSVQoMCkgLyogRW5hYmxlIGJpdCAyICovDQo+ID4N
Cj4gDQo+IFJlcXVpcmVzICNpbmNsdWRlIDxsaW51eC9iaXRzLmg+DQoNCldpbGwgdXBkYXRlIGlu
IFYyIHNlcmllcy4NCg0KPiANCj4gPiAgLyogU2VsZlRlc3QgY29uc3RhbnRzICovDQo+ID4gICNk
ZWZpbmUgWFdUX01BWF9TRUxGVEVTVF9MT09QX0NPVU5UIDB4MDAwMTAwMDANCj4gPg0KDQo=
