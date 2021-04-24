Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3B8236A152
	for <lists+linux-watchdog@lfdr.de>; Sat, 24 Apr 2021 15:04:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232867AbhDXNFa (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 24 Apr 2021 09:05:30 -0400
Received: from mx08-001d1705.pphosted.com ([185.183.30.70]:18894 "EHLO
        mx08-001d1705.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232709AbhDXNF2 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 24 Apr 2021 09:05:28 -0400
Received: from pps.filterd (m0209322.ppops.net [127.0.0.1])
        by mx08-001d1705.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 13OD4RPV032525;
        Sat, 24 Apr 2021 13:04:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=S1;
 bh=/8r+zlLP87NJpmGb09b/OgJIQ/2BGSfVmEiqq/WN5i0=;
 b=iDuWwpWzIPcXvyi2OkcY3z4tpXtku3BgQrDGuA2clkGQH0fUlbM/W5o0T/aa0IajeeH3
 507hcoC+Unz6uCfcnPPC389MvRjV4AXLRcNNdiZGz3ieMoxFu4igxF0qq26kpOvDrjgA
 zom3ecHxkS8KCOV7G8EfWMyGyFA1jL4CGxnPX9GE7RlZ0m54h4rrye/vtZDiQpm+cgWf
 PgIlyDJzeJMCLbjyZKbDRLorRGAc8qQR0Fc/Sr4xqLg/27SuIm4FJy11zmpsbdCUFY8N
 mhGxZvrNUtv+lLKTb7xBOnX/GkkI8FSyER+wRqBjorDBrzdxbgQEVZuRAi64aBo1TA8k Iw== 
Received: from eur03-am5-obe.outbound.protection.outlook.com (mail-am5eur03lp2051.outbound.protection.outlook.com [104.47.8.51])
        by mx08-001d1705.pphosted.com with ESMTP id 384a49gf21-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 24 Apr 2021 13:04:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BUN7QyrfTUSOyQlLvlvvkFh+bhYnZ4oP4NKgGsyLqGSdNYLMFJKESmSveaZcgOjCS0ri2hnJPSylfxIVFihL7hXn68i2C3o8SbDIoF6iF/elRlIdGRj0Y+PpbPEEjbwCAR1xlSJCe/vnBPQ4vysF0vPv69y9yhKssXNCvUhDrWUE5BDzywjmISa6tv9YB77nM32Sa7mQbrxleGKgxq0rfUyjcgrCfPJJUBpkH5XAywNKmCl6W/VM/3TRKIVnzDEPWmHBUV2JxqvQBAWB6Lj0Dl6SFvuaXwER85y0nsW6SVbtMHaIblskwNCOdUWvVShoK0o6HRQGjOjAJnCKcLpQ1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/8r+zlLP87NJpmGb09b/OgJIQ/2BGSfVmEiqq/WN5i0=;
 b=ZncDbxW20QxJMGOGzhbaUWVL/A86Wu70iwkUyanbirqrLahS9U/l0d3jW5bakk2rdnbgZisIDW0P3XMA/LYSBe88Po1QOYVx8WjjcPcr/elmucBsFv5N0A63nbxFpVsnyhQyj6VRXKb5Ux9EVY2lT4zbepsk3nIW5Nz+qE4zuGKWNdlYKOss4tRPyfvupSHFsGLEMvMZcSzPnHgBagS3i1XdF7bOVdO/fDY4ndlaOPgOHWOPmPo1JaFkq+sCuU3WCA2Ie8dp9lPQGPKOz9jSSUUFtjLCs58z16EKrBWOWOpyz8vmTHr5aWpXfsJEsXEgrLNJ9ibcJjOoup2uPU3hMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from AM9P193MB1491.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:306::20)
 by AM9P193MB1080.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:1fc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.23; Sat, 24 Apr
 2021 13:04:14 +0000
Received: from AM9P193MB1491.EURP193.PROD.OUTLOOK.COM
 ([fe80::35b3:3e5e:6533:84e0]) by AM9P193MB1491.EURP193.PROD.OUTLOOK.COM
 ([fe80::35b3:3e5e:6533:84e0%5]) with mapi id 15.20.4065.025; Sat, 24 Apr 2021
 13:04:13 +0000
From:   <Peter.Enderborg@sony.com>
To:     <christophe.leroy@csgroup.eu>, <wim@linux-watchdog.org>,
        <linux@roeck-us.net>, <akpm@linux-foundation.org>,
        <linux-watchdog@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-mm@kvack.org>, <shakeelb@google.com>
Subject: Re: [RFC PATCH] watchdog: Adding softwatchdog
Thread-Topic: [RFC PATCH] watchdog: Adding softwatchdog
Thread-Index: AQHXOPRHJMESqgFAQEC7n9VkV8fdEqrDlraAgAAL/AA=
Date:   Sat, 24 Apr 2021 13:04:13 +0000
Message-ID: <d5db6789-78a6-3e48-6383-190c4696e682@sony.com>
References: <20210424102555.28203-1-peter.enderborg@sony.com>
 <20210424102555.28203-2-peter.enderborg@sony.com>
 <ac949d08-72ff-edf6-6526-fdc9ad602631@csgroup.eu>
In-Reply-To: <ac949d08-72ff-edf6-6526-fdc9ad602631@csgroup.eu>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: csgroup.eu; dkim=none (message not signed)
 header.d=none;csgroup.eu; dmarc=none action=none header.from=sony.com;
x-originating-ip: [37.139.156.40]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3b8d3319-d505-4058-cc00-08d907217563
x-ms-traffictypediagnostic: AM9P193MB1080:
x-microsoft-antispam-prvs: <AM9P193MB1080762779D6B8AE1B07B05986449@AM9P193MB1080.EURP193.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: S5xX9CSEb+m5Kx7Q3NWDm/KJDwN0WkB0rDRa8/seE5bx/nrllNzHvnHVuabNUtAySavJXH4ocH4n/b0neNRlBarpmZq86lE39ziIiVIImaEN75rnwVJhJG98koWfUud/kIH5Bz3WD+Q1ahTVUEtzcezaAZPgWEC1MCpv5wLeS7H/5eUReKhg3SFOdXhMQNMXO8qtivXGaiEwYCvGKDRdCzvbzt+lEQjF7IG2LvAlPM93WT2TYZJqM8YZQx51WcGtWgIiuLFlmEhmhT3Tklr6tmtapRVWdFN83cDvtBkgIKIR0PDgTs60j3c89K7XZ1AML7Dz2pWPggaPoGycfb8+TwdsbiEuCeWMcu0uBz5ABK7HW/f1sxJOD5kFIZAuJlfzwiecPHVxJp3fpUw33G3MP+FBteNjjfqnaLgTMqntFOaKXFFpHz3p+76ICyM/4tBAGtYpmdVhIZcASjbbhIVch50PQ2MNoQW3j6blGoFPZLD1BK6MXGfpN2O7yBlDIqqbT4s5PuExKthZkgJRd9dFZV3c72VAdoV9QOySe7JdAKJTqE9SrQ4uCsjom4m5Wg0AuzrpZRUSLSFDFqIyfYv4Ft3q+PZwpGeAhl1Wwgny1voyx3JWZXOhgVXMv1Y4T9kXUL0y0lsPciBep6mL4c2tDPevcZoeAUEkjmKNMszq1wN7qMPrLZwmxlE1cfENwecZMm5QINiN+veBhnpX5dk4krVzw2CdFl4QLNZg1vt7idYV4inYQIP/E4vY+N0pPfCpKa6TGwZyoeiCDCaV8tIIgw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P193MB1491.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(39830400003)(346002)(376002)(366004)(396003)(136003)(6512007)(2906002)(2616005)(6486002)(186003)(26005)(36756003)(86362001)(31696002)(31686004)(38100700002)(122000001)(53546011)(6506007)(83380400001)(316002)(66574015)(5660300002)(66446008)(66946007)(71200400001)(91956017)(64756008)(76116006)(66476007)(478600001)(66556008)(966005)(8676002)(110136005)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?UkR3UkhGOUhiOTd5YkluczBBNElBT0IySFdxdGwxdjNINGwvdWo2TTdXdGVS?=
 =?utf-8?B?RmtEeUN2cWlkSGZUaWNqZVlVK3ZMVUJrUTlrdGoxUkRSTndlMXh3LzVJa3l0?=
 =?utf-8?B?MXlDRUFJTHR5MTVEdSt0NjRnUnZ0TEt2VW91ZmY2U3Rtc0xMTHloeUxoR0JX?=
 =?utf-8?B?NWQvMndKQlVUbEg4UytFVUxSeGl2aTF2TEdRUlJLZWl2aVRjNkFMK1BaMUFL?=
 =?utf-8?B?WitIK0R2V204RXVEamRBRzRja0FUdmExSFloSkZTS0ttNUFZMnYrQzVKMUJv?=
 =?utf-8?B?UHArRTdkUWIxamUrUWpzTDJDc3JLd1AxTjNFN3ROVzZsT29jQlFXRjVEMXkr?=
 =?utf-8?B?ZDByb3pEY2RoRnpVdFdIWGEzTHhQT2ZLd3NPcXFjSnYvWUlOcUhndnR4bEpk?=
 =?utf-8?B?NStWNGNBNTJtN2duTVl4eE5zR1VaR0pvc3I1em40OW1RZFBEWFZlNXRVMzZZ?=
 =?utf-8?B?SFpYUFFsSTZuaGtwQlYyaHFqMGRDMXZsVTdYUC9seGZ5enJrZGZGL1VRL1pX?=
 =?utf-8?B?MU1aVU5BN1pJcUdDb2RUeDdXZ2FRYU5Wd0srZ2hpaHJnWUlVQk1Ub2pUL0cr?=
 =?utf-8?B?cGJsT2haN0ZXR3h3eUlxYURId255bVlDQlNRbVRSUCs3UGN2SWIxb0xsRTFG?=
 =?utf-8?B?SDI3OEhsNVNSdmZsSnpRaXRiRVZRZHhWbXJZVEw3dlZrSGoraVFjSjFPWFl6?=
 =?utf-8?B?NTVvT3pid1QzK3BJaUdEMXlIQTY4bjAydWR0QU9BSXVqQmpVd3VhMUQzRi95?=
 =?utf-8?B?emV6MFpBOXdMTU41aXp0QU1OUnhMM1NJWGd5U1AxS0VUSnZTbk1OQS9RMGI3?=
 =?utf-8?B?UmV2ay9lNm1IZEV4THdkYlM2S2xCVUxoRCsvRnZRWmMrTWZXcE96MmsxMmtN?=
 =?utf-8?B?WXNIUmp0a0tueVpUL3VvdjR3ZzZkV3l1eS9OUEVERWNKcC94ZThUNHNWTGdk?=
 =?utf-8?B?dkkzd1pIcS9xOTFsUzlPT0pRa3M0RGsxNE5CbGNDZllWY0JJQTExQnBrK3Zp?=
 =?utf-8?B?dXM5WkFOd0RmTHZOUU83MzJFNG1kcXp5Zjh4dmg4R2N6MmVUeTkxTStyMHdq?=
 =?utf-8?B?WHBtbHg2eWM3amg2QXhOMXpYbWRnOUE3VzduQ2xVNUc1RXl4UTg1V1c2ZE82?=
 =?utf-8?B?U0pzV1FOMGxLTXFjbXJ5T0I5SnZCbG50a09ZOUwrenA4MnM2ckZkdkIvcExn?=
 =?utf-8?B?dmRtcnh6Um1wS283dDBmM3VyU0hJVFNITGVDaGg2WVNVdXdsZ1JGYmFibzdU?=
 =?utf-8?B?K1ZiSitlK2wxOXhMQzNLSHFHdWhUSlVtZFh0YnJ0V0ErRHZtTERXdjNVM2tE?=
 =?utf-8?B?ckRJZmZpYUJBdDhvZFZqcUVEKzdRY3V5aE1OekMrQnpHUFZHdGt1azNFSDFP?=
 =?utf-8?B?UU4rRk1UaHoxYTNDelhmek4zenNKOXFMNVFlV0M4dHdRL1RoajlZVFVDNlZ5?=
 =?utf-8?B?UndSL0VuVHFrNFBRQytGNkFRKzRrK2JRZFJHYWhnNVZKNzlWYWNDT04xc0JJ?=
 =?utf-8?B?V3JuclR1VFl5M24rcG1QeGtHd2tndVBBMVJyeksxRGlONkpkNm1OenFZT1pP?=
 =?utf-8?B?K3JzRkJUMGhwRkNWTmNUejBSVnkwbXhqQXRicnVmdStQL2hFaXE0eXlVTjhF?=
 =?utf-8?B?T0RCL292SDFvNE9PejQrbDlLOWJ1dmN2WWdXSUxtb0FWK0NxL1RQaXcxY3N3?=
 =?utf-8?B?MlVHMHhSOVVJTHo0K2JQbUpVTC9yMmtuNEdZdjFDblk5ZE1JMGhhZVh1ZUNC?=
 =?utf-8?Q?Vxieg2Gc5zb/jtsnP4Qif/cl/FFPwL6V2l6kSgo?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <53E90CEB69C2864A880EA437246695DB@EURP193.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9P193MB1491.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b8d3319-d505-4058-cc00-08d907217563
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2021 13:04:13.3449
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Wl0MXUMNUc1JJCA9tERv+f974ILnCQ3RjZShAnuS1hHwpbxfaOFXmqFQnwK89qBjmQX+tsRO6OPoR0Yc5UUJICcnqitm3xRkSYlABx8ZnW8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9P193MB1080
X-Proofpoint-GUID: gflXZfrTtk6URc_obxEZp42KE9mUkIyU
X-Proofpoint-ORIG-GUID: gflXZfrTtk6URc_obxEZp42KE9mUkIyU
X-Sony-Outbound-GUID: gflXZfrTtk6URc_obxEZp42KE9mUkIyU
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-04-24_04:2021-04-23,2021-04-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 mlxlogscore=999
 spamscore=0 phishscore=0 adultscore=0 suspectscore=0 bulkscore=0
 mlxscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104240095
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

T24gNC8yNC8yMSAyOjIxIFBNLCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOg0KPg0KPg0KPiBMZSAy
NC8wNC8yMDIxIMOgIDEyOjI1LCBQZXRlciBFbmRlcmJvcmcgYSDDqWNyaXTCoDoNCj4+IFRoaXMg
aXMgbm90IGEgcmVib290aW5nIHdhdGNoZG9nLiBJdCdzIGZ1bmN0aW9uIGlzIHRvIHRha2Ugb3Ro
ZXINCj4+IGFjdGlvbnMgdGhhbiBhIGhhcmQgcmVib290LiBPbiBtYW55IGNvbXBsZXggc3lzdGVt
IHRoZXJlIGlzIHNvbWUNCj4+IGtpbmQgb2YgbWFuYWdlciB0aGF0IG1vbml0b3IgYW5kIHRha2Ug
YWN0aW9uIG9uIHNsb3cgc3lzdGVtcy4NCj4+IEFuZHJvaWQgaGFzIGl0J3MgbG93bWVtb3J5a2ls
bGVyIChsbWtkKSwgZGVza3RvcHMgaGFzIGVhcmx5b29tLg0KPj4gVGhpcyB3YXRjaGRvZyBjYW4g
YmUgdXNlZCB0byBoZWxwIG1vbml0b3IgdG8gcHJlZm9ybSBzb21lIGJhc2ljDQo+PiBhY3Rpb24g
dG8ga2VlcCB0aGUgbW9uaXRvciBydW5uaW5nLg0KPj4NCj4+IEl0IGNhbiBhbHNvIGJlIHVzZWQg
c3RhbmRhbG9uZS4gVGhpcyBhZGQgYSBwb2xpY3kgdGhhdCBpcw0KPj4ga2lsbGluZyB0aGUgcHJv
Y2VzcyB3aXRoIGhpZ2hlc3Qgb29tX3Njb3JlX2FkaiBhbmQgdXNpbmcNCj4+IG9vbSBmdW5jdGlv
bnMgdG8gaXQgcXVpY2tseS4gSSB0aGluayBpdCBpcyBhIGdvb2QgdXNlY2FzZQ0KPj4gZm9yIHRo
ZSBwYXRjaC4gTWVtb3J5IHNpdWF0aW9ucyBjYW4gYmUgcHJvYmxlbWF0aWMgZm9yDQo+PiBzb2Z0
d2FyZSB0aGF0IG1vbml0b3Igc3lzdGVtLCBidXQgb3RoZXIgcHJvbGljeXMgY2FuDQo+PiBzaG91
bGQgYWxzbyBiZSBwb3NzaWJsZS4gTGlrZSBwaWNraW5nIHRhc2tzIGZyb20gYSBtZW1jZywgb3IN
Cj4+IHNwZWNpZmljIFVJRCdzIG9yIHdoYXQgZXZlciBpcyBsb3cgcHJpb3JpdHkuDQo+DQo+DQo+
IEknbSBub3JlIHN1cmUgSSB1bmRlcnN0YW5kIHRoZSByZWFzb25pbmcgYmVoaW5kIHRoZSBjaG9p
Y2Ugb2Ygb29tIGxvZ2ljIHRvIGRlY2lkZSB3aGljaCB0YXNrIHRvIGtpbGwuDQo+DQpUaGlzIGlz
IG5vdCB1c2luZyBvb20gbG9naWMgdG8gcGljayBhIHRhc2sgdG8ga2lsbCwgaXQgaXMgdXNpbmcg
b29tIGZ1bmN0aW9ucyB0byBmcmVlIHJlc291cmNlcyBmYXN0Lg0KDQpUaGUgb29tIGlzIGFsc28g
dG8gc2xvdy4gU28gdGhlcmUgYXJlIHVzZXJzcGFjZSBzb2x1dGlvbnMgdG8gc3RhcnQgcmVtb3Zp
bmcgcHJvY2Vzc2VzIGJlZm9yZSBpdCBzdGFydHMgdG8gc2xvdyBkb3duLg0KDQpJbiBmb3IgZXhh
bXBsZSBVYnVudHUgYW5kIEZlZG9yYSBhIHByb2Nlc3MgY2FsbGVkIGVhcmx5b29tIGlzIHJ1bm5p
bmcuIE9uIEFuZHJvaWQgdGhlcmUgaXMgbG1rZC4gSG93ZXZlcg0KYWxsb2NhdGlvbiBjYW4gYmUg
aHVnZSBmYXN0LiBGb3IgZXhhbXBsZSBzdGFydGluZyBhIGNhbWVyYS4gU28gd2hhdCB0aGVuIGNh
biBoYXBwZW4gaXMgdGhhdCB0aGUgc2VydmljZSB0aGF0DQppcyB0aGVyZSB0byByZW1vdmUgYXBw
bGljYXRpb25zIHRoYXQgaXMgbm90IG5lZWRlZCBjYW4gZ2V0IHN0YXJ2ZWQuIFRoZXkgZG8gYSBs
b3Qgb2Ygb3BlcmF0aW9ucyB0byB0aGF0IG5lZWRzDQptZW1vcnkgYW5kIGJ5IHRoaXMgdGhleSBh
bHNvIGdldCBzbG93LsKgIEluIHdvcnN0IGNhc2UgaXQgY2FuIGNhdXNlIGEgb29tLiBPb20ga2ls
bHMgdGhpbmdzIHJhbmRvbWx5IGFuZA0KaXQgd2lsbCBjYXVzZSBhIGFuZHJvaWQgcGhvbmUgdG8g
cmVib290IGlmIGl0IGtpbGxzIHdyb25nIHRoaW5ncy4gV2hlbiBpdCBnZXQgc2xvdyBpdCBjYW4n
dCBraWNrIHRoZSB3ZCBhbmQNCndlIGNhbiBmcmVlIHVwIHJlc291cmNlcyBmcm9tIHdpdGhpbiBr
ZXJuZWwuIFRvIGdldCBjdXJyZW50IHZlcnNpb24gdG8gd29yayB0aGVyZSBpcyB2ZXJ5IGhpZ2gg
bWFyZ2lucyB3YXN0aW5nDQphIGxvdCBvZiBtZW1vcnkgdG8gYmUgInNhZmUiLg0KDQoNCj4gVXN1
YWxseSBhIHdhdGNoZG9nIHdpbGwgZGV0ZWN0IGlmIGEgdGFzayBpcyB1c2luZyAxMDAlIG9mIHRo
ZSBDUFUgdGltZS4gSWYgc3VjaCBhIHRhc2sgZXhpc3RzLCBpdCBpcyB0aGUgb25lIHJ1bm5pbmcs
IG5vdCBhbm90aGVyIG9uZSB0aGF0IGhhcyBodWdlIGFtb3VudCBvZiBtZW1vcnkgYWxsb2NhdGVk
IGJ5IHNwZW5kcyBsaWtlIDElIG9mIENQVSB0aW1lLg0KPg0KV2F0Y2hkb2dzIGRldGVjdHMgdGhh
dCB5b3UgZG9lcyBub3QgZmVlZCBpdC7CoA0KPiBTbyBpZiB0aGVyZSBpcyBhIHRhc2sgdG8ga2ls
bCBieSBhIHdhdGNoZG9nLCBJIHdvdWxkIHNheSBpdCBpcyB0aGUgY3VycmVudCB0YXNrLg0KDQoN
CkN1cnJlbnQgdGFzaz/CoCBXZSB1c3VhbGx5IGhhdmUgbWFueSBjcHUncy4gQnV0IHRoZSBpZGVh
IGlzIHRoYXQgeW91IHNob3VsZCBlYXNpbHkgd3JpdGUgYSBwb2xpY3kgZm9yIHRoYXQgaWYgdGhh
dCBpcyB3aGF0IHlvdSB3YW50Lg0KDQoNCj4NCj4NCj4NCj4gQW5vdGhlciByZW1hcms6IHlvdSBh
cmUgdXNpbmcgcmVndWxhciB0aW1lcnMgYXMgZmFyIGFzIEkgdW5kZXJzdGFuZC4gSSByZW1lbWJl
ciBoYXZpbmcgcHJvYmxlbXMgd2l0aCB0aGF0IGluIHRoZSBwYXN0LCBpdCByZXF1aXJlZCB0aGUg
dXNlIG9mIGhydGltZXJzLiBJIGNhbid0IHJlbWVtYmVyIHRoZSBkZXRhaWxzIGV4YWN0bHkgYnV0
IHlvdSBjYW4gbG9vayBhdA0KPiBjb21taXQgaHR0cHM6Ly9naXRodWIuY29tL2xpbnV4cHBjL2xp
bnV4L2NvbW1pdC8xZmY2ODgyMDkNCg0KDQpUaGF0IEkgZGVmaW5pdGVseSBuZWVkIHRvIGxvb2sg
aW4gdG8uDQoNCg0KPiBDaHJpc3RvcGhlDQoNCg==
