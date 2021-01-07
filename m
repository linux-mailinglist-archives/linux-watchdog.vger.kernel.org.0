Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B3262ED68A
	for <lists+linux-watchdog@lfdr.de>; Thu,  7 Jan 2021 19:17:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726650AbhAGSQ2 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 7 Jan 2021 13:16:28 -0500
Received: from mail-eopbgr60043.outbound.protection.outlook.com ([40.107.6.43]:65411
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728066AbhAGSQ1 (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 7 Jan 2021 13:16:27 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fzBvD2NYMQSoaFRw4c78TJv0SFqsbxTNopLlATdNfwTCJy6c/et8t73AN9I1cfGqW5VFYm3szNLMNKzFE0coBzF31gpx6j6uv0DQCufwBHI9Bkg/ilHj178TZ+cFADKTtIbJjGNdrrt7lQG/5GqwJo+bNOCfI6TuUEuxqfByfoiQw0TF7eyd+DFB1s/Zq4VlMf5u28XmMwD9MAOfPan0PPeMsXvBwe0KBJbXpzns4/TrvJAyJIB5Kium1+lgFdnX5QVifL3fJsVgnxNOkFct+iMs69ASebnbVyXYq92iofy0HOcdfzd8bNYoPsQxlyZuliVfnaEftgG3CvBakBGUXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y6eIMptboYMkuJlav0LNVSMSeZvj8HyjYi7WhiFsFHg=;
 b=azJzrxBxx/1Q8m6Pgr5Yflq/TbSprtwvTTy+mtp/XPY2i7CywZexIZbLpw4muyb0eo9MhLg/fpkHhDNAClRtwq4XqCMUTt1KL12jYp7G5kEPHjvLpZ34GpATBSE24oIIzAzxxhuHCWKCcaA9UCnyt0oIvHD1OfiFb5EnF+5qIkoWxZ3jNe9yiWfzSKBKIRdXRt6Raf24KqQWT0/ItnjSlTWaxEH7eyOyhEd+O20rfyea7Tp+EYGWhqg6WsJ0Aw4UYzOB6u/zEEezGFVLN9nz9lOuWSf3tZ3IxyGNaB8qjxa4Vsp0von2HPzwPK3x7d06mEf9P+JH/TasAkZiBXSIyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y6eIMptboYMkuJlav0LNVSMSeZvj8HyjYi7WhiFsFHg=;
 b=eB8kpOngi/UkpZV6nptHwDwopm0SDmxmStu4ohrrb7N4KvLZh8X7BcVts2pQpHk/T5fFTBgH/pxctmZRthgQAdCNFHBvozZZ1YKAnSHL2fprCgNcdry94RVT8wWzbCAQS6yPkxDfE9rY/XogOc+xmXuPH3GGrqicWz19dBWGUMg=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR0301MB2395.eurprd03.prod.outlook.com (2603:10a6:3:6d::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6; Thu, 7 Jan 2021 18:15:37 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::6558:57bb:5293:f3d3]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::6558:57bb:5293:f3d3%3]) with mapi id 15.20.3721.024; Thu, 7 Jan 2021
 18:15:37 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "linux@roeck-us.net" <linux@roeck-us.net>
CC:     "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
Subject: Re: [PATCH 1/2] watchdog: bd70528: don't crash if WDG is confiured
 with BD71828
Thread-Topic: [PATCH 1/2] watchdog: bd70528: don't crash if WDG is confiured
 with BD71828
Thread-Index: AQHW5L+IrHihOUehfkywMzhn459XW6ocRXKAgAAzOAA=
Date:   Thu, 7 Jan 2021 18:15:36 +0000
Message-ID: <35ba5bcd48d4e027c0e5c839a856751519ee4dd1.camel@fi.rohmeurope.com>
References: <671ac57ad53ab1614da7fe9a3d0f78bdb5b51fda.1610001365.git.matti.vaittinen@fi.rohmeurope.com>
         <20210107151211.GA13040@roeck-us.net>
In-Reply-To: <20210107151211.GA13040@roeck-us.net>
Reply-To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Accept-Language: fi-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4 (3.34.4-1.fc31) 
authentication-results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none
 header.from=fi.rohmeurope.com;
x-originating-ip: [62.78.225.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 56dc1166-da1a-4fc1-c181-08d8b3383b77
x-ms-traffictypediagnostic: HE1PR0301MB2395:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR0301MB23954F6ADB6E9F74A602D8ACADAF0@HE1PR0301MB2395.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9ilifDqrZYeDyo50AmtfY1TEp3wNzpWfeDRgVmNDFwJqZKp5rjGBXXYSf2b9f4eakCtm0wFZ+MgM4AdE5YX8fnlG3FXl/HgvvEyTlJVSfeLy+1NY/kgHtUkZJ3JZYb+sIZwks3Gs4iKx/Lik+zEEcbQrxq5wCNIqF45FbKT9WAg9GAEgliBpnsD6MtXoxeVwbKKgEnJ79XWjibe+pwdV8kv4pd1DbFD+QF2TVpY9zrC0Jlsw6kbL6ug1WLFR8eY+p711P+4U6xz/nppExDEzGM+murcxydfxK+vg1xVkPgfZF2BjfLVHrLzuwXzY982YuzkFNHY4ASvI279qdQyJqGeyE6JoaHrBpyUro7iQ4nGFtgZbn14qgQUxevG9T2gzbFzogAm7IVpzHWuxbV0eyQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(39840400004)(396003)(366004)(8936002)(3450700001)(2906002)(2616005)(71200400001)(186003)(6506007)(5660300002)(26005)(316002)(66946007)(76116006)(64756008)(66556008)(4326008)(66476007)(66446008)(478600001)(6916009)(6486002)(6512007)(54906003)(8676002)(83380400001)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?SkRQcndEa3RIcjBaVWhvWE04d2ptWHRTaVZ1b1lxSWlCV0xmdnU2OWg0emxo?=
 =?utf-8?B?bjc2eStLems2WU1hZktOVVhBVXdKYThKaTNVaTNhakhEaVRDK1ZHdkZGbDNU?=
 =?utf-8?B?UVFzKzdKbXNBbFlLQ00yTTIvMUk4eVZIbGRTZ0Z6MUpkRVFRUmpxOU1Jcmw2?=
 =?utf-8?B?cGQ4c2xHZVBnUnpWbmo0YVhoc1lCR3UxbFpDVnd0VU41TU5tdDhrL2djc1kx?=
 =?utf-8?B?cGRPeU5Mb1pWMUJLRjRNdktMQ1QrM1h3NVVUaU5ZQnBkUC9UbHJNQVRKOFVL?=
 =?utf-8?B?b1dHaHIxZ1JhOTg1WHZ3R2p0T0VPaFhrOWpaeFowSHBOTVBEcjdNdC9WK3hX?=
 =?utf-8?B?VXU3V3BpNTZ6SHl3dDFyR2k4TjJEYlZUZmYvZkFuZ2JDZDk0d2FJTzIwUXQ2?=
 =?utf-8?B?WXVWUy9renNYNUo0OS9zRVQwTE4yVHB4bDlqVTlNNldOWGJtTkpPakphRVZw?=
 =?utf-8?B?WTdwQVNrWmV6MXhsRlBlQkZsRk5aZWtPNjMwOVF3M1ZVWnp5TWZUVWNMdEJK?=
 =?utf-8?B?Z3FEdzZzMW9XaHBVT3l4T29PTzdvbWtjNFVHTm4zRnhCWU9MajF2Y1g0c2li?=
 =?utf-8?B?RnFKRDJoUnF0dDdYZGl3ZDEyc0ltQnJENVFQdnhUZlZKR3B2TFdLWGZ5OU5F?=
 =?utf-8?B?VnZTTVhWanpKS04vQVRTOUhCVTVkdE1ITm9UUEVsN1JyTkRsbTQwUEZDWWRX?=
 =?utf-8?B?MzV3NlVPZDYzQXBCY294bUFnZytRMlFXaU4zQktmTU9lMmtmQTVhTzF3TTBW?=
 =?utf-8?B?K0Uwa2puZ2c4aVZ1QVlRTmtlN2FCak9XeDRPeTIzdlBUTFVjeWljZXhpUU1i?=
 =?utf-8?B?aVI2QnZadXo0bXVxZGRyQ1BQbS8vSy9JQWl4cE1WU1JNcVdvd21UU2pqb0tS?=
 =?utf-8?B?VEsrTUFtOUFwQnpTY0pCUUJlY2pLNTBCV29hVnVhSFFPVDVjZ24vdjdLeEJW?=
 =?utf-8?B?clVPSHZDYTREZEplVEFSZ1pRbTZCeHNZU0JJTjdnZ1FkcU01ZGFlTG8veU5N?=
 =?utf-8?B?S2VycnptWVViOUdaVTRaYXRodTVVdHpVNHNZekNKbUxOcmhyVWdpNzVVd1oy?=
 =?utf-8?B?c0ltL0UxWm1xeE5oOGp2K0hudW1nbTFNVW02elhLc2dyanRMeDRLM3hZM21K?=
 =?utf-8?B?RFRSOE83UzJDWUxiY2F1UVNYUkJ4NTQ3VmxwdkUvZWIzNi9mOXJjRTlxRFhr?=
 =?utf-8?B?TTdqOEpoaE9MSDJnR2t2K2gwWG1Vc1J2VS8wTUN1OFBIcmpzVjVkVGNmbmND?=
 =?utf-8?B?UUlQaDZZRjNHdDFPM3N2a2trM2U4amFyQWFSR0lJU2FTZ2xRVzlWMmVmTEd2?=
 =?utf-8?Q?ON8f61N7yFTyoCpAQGkEjgXMTVS5/KQj3d?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7CC0E0B626242D40B06F15A3024F4697@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56dc1166-da1a-4fc1-c181-08d8b3383b77
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2021 18:15:36.8590
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 740mi8KaJ8bv+nMPSnA3rutS6EwV50h4lvZZ3cCQYbXbMZqSEBYvKPVZhJc9JxqHX9BKMeD5WAyuBIao5w89eMFK3zgFDCBfDo3stgjrQnG3FLjBsWgcn2UyR0Ip7FUd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0301MB2395
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

VGhhbmtzIGEgbG90IGZvciB0YWtpbmcgYSBjYXJlZnVsIGxvb2sgYXQgdGhpcyBHdWVudGVyIQ0K
DQpPbiBUaHUsIDIwMjEtMDEtMDcgYXQgMDc6MTIgLTA4MDAsIEd1ZW50ZXIgUm9lY2sgd3JvdGU6
DQo+IE9uIFRodSwgSmFuIDA3LCAyMDIxIGF0IDA4OjM3OjAzQU0gKzAyMDAsIE1hdHRpIFZhaXR0
aW5lbiB3cm90ZToNCj4gPiBJZiBjb25maWcgZm9yIEJENzA1Mjggd2F0Y2hkb2cgaXMgZW5hYmxl
ZCB3aGVuIEJENzE4Mjggb3IgQkQ3MTgxNQ0KPiA+IGFyZSB1c2VkIHRoZSBSVEMgbW9kdWxlIHdp
bGwgaXNzdWUgY2FsbCB0byBCRDcwNTI4IHdhdGNoZG9nIHdpdGgNCj4gPiBOVUxMIGRhdGEuIEln
bm9yZSB0aGlzIGNhbGwgYW5kIGRvbid0IGNyYXNoLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6
IE1hdHRpIFZhaXR0aW5lbiA8bWF0dGkudmFpdHRpbmVuQGZpLnJvaG1ldXJvcGUuY29tPg0KPiAN
Cj4gSSByZWFsbHkgdGhpbmsgdGhpcyBzaG91bGQgYmUgaGFuZGxlZCBpbiB0aGUgY2FsbGluZyBj
b2RlLg0KPiBBbHNvLCBJIGFtIGN1cmlvdXMgaG93IHRoaXMgaXMgc3VwcG9zZWQgdG8gd29yay4N
Cj4gDQo+IFRoZSBjb2RlIGlzIGNhbGxlZCB3aXRoDQo+IA0KPiAJcmV0ID0gYmQ3MDUyOF93ZHRf
c2V0KHItPnBhcmVudCwgbmV3X3N0YXRlICYNCj4gQkQ3MDUyOF9XRFRfU1RBVEVfQklULA0KPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBvbGRfc3RhdGUpOw0KDQpNeSBicmFpbmZhcnQu
DQpUaGUgYmQ3MDUyOF93ZHRfc2V0IGlzIG5vdCBjYWxsZWQgYXMgaXQgaXMgcHJvdGVjdGVkIGlu
IFJUQyBieQ0KaGFzX3J0Y190aW1lcnMgZmxhZy4NCg0KSSBpbnNlcnRlZCB0aGlzIGNoZWNrIGlu
IHdyb25nIGZ1bmN0aW9uLiBUaGUgYmQ3MDUyOF93ZHRfbG9jaygpDQppcyB3aGVyZSB3ZSBtYXkg
aGl0IHRoZSBwcm9ibGVtIGFzIGl0IGlzIG5vdCBwcm90ZWN0ZWQuDQo+IA0KPiBmcm9tIGJkNzA1
Mjhfc2V0X3J0Y19iYXNlZF90aW1lcnMoKS4gVGhhdCBzYW1lIGZ1bmN0aW9uIHN1YnNlcXVlbnRs
eQ0KPiBjYWxscyBiZDcwNTI4X3NldF9lbGFwc2VkX3RtcigpIHdpdGggdGhlIHNhbWUgcGFyYW1l
dGVyLCBhbmQgdGhhdA0KPiBwYXJhbWV0ZXIgaXMgZGVyZWZlcmVuY2VkIGluIGJkNzA1Mjhfc2V0
X2VsYXBzZWRfdG1yKCkgd2l0aG91dA0KPiBjaGVja2luZy4NCj4gDQo+IENvbmNlcHR1YWxseSwg
aXQgc2hvdWxkIG5vdCBiZSBuZWNlc3NhcnkgdG8gZGV0ZXJtaW5lIGF0IGNvbXBpbGUtdGltZQ0K
PiB3aGljaCBvZiB0aGUgY2hpcHMgaXMgaW4gdGhlIHN5c3RlbS4gSXQgc2hvdWxkIGJlIHBvc2li
bGUgdG8gY29tcGlsZQ0KPiBhIHNpbmdsZSBrZXJuZWwgd2hpY2ggc3VwcG9ydHMgYWxsIGNoaXBz
Lg0KDQpJIGFncmVlLiBUaGUgaW5mb3JtYXRpb24gd2hldGhlciBXRFQgc2hvdWxkIGJlIGFjY2Vz
c2VkIHNob3VsZCBiZQ0KanVkZ2VkIGJ5IGR0LWNvbXBhdGlibGUuIE1GRCBoYXMgdGhpcyBrbm93
bGVkZ2UgYW5kIHBhc3NlcyBpdCB0byBSVEMuDQpTbyB5ZXMsIFJUQyBzaG91bGQgb21pdCB0aGUg
Y2FsbCBpZiBCRDcwNTI4IGlzIG5vdCB1c2VkLiBQbGVhc2UgaWdub3JlDQp0aGVzZSBwYXRjaGVz
LCBJJ2xsIGRvIGNoYW5nZXMgdG8gUlRDIGRyaXZlciA6KQ0KDQoNCkJlc3QgUmVnYXJkcw0KTWF0
dGkNCg0KDQo=
