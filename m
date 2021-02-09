Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 534B931516B
	for <lists+linux-watchdog@lfdr.de>; Tue,  9 Feb 2021 15:20:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230285AbhBIOUk (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 9 Feb 2021 09:20:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230029AbhBIOUj (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 9 Feb 2021 09:20:39 -0500
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on0614.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0d::614])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D60FBC061786;
        Tue,  9 Feb 2021 06:19:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vwv7rZUwjAVjiNbBrQ4ahTFRFOEkJeFPIuI1YEWaaHyNPLv4PgB+sUQGTP15gbmPlfAMnoXVTCO9LxASwMKW8wA2G9o2tE5sqti/RKxCDUI797QfkUtsnrQOXoNGYlzJV0KpOaPzegggUkdHWXkSjOJS73NoZX16ZXDPxqS5ebVd4Wftpe8z1rLmHjj8aDICY2v+PWbsnkyx4RGjOeHGcdpSofTPvzDzvH7RuSq+gHN1X/61bvqrXAxqtTTVvV11GgsjKy+W0japR6Daunb1Ekn9xUKPTYGSHfveZZaHB3vxUaNbKhZXzpkS0JMrVbJvX6o2pOUam5zDLC+h+MNUaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zLyVzYFupTnTS5FZN7DFyYpqALEOpAHCDgZ/bQW0I7U=;
 b=beYYdLcETCL3i0y5sSWG1sLhpaJr74mXPqHxbYFmsgjzE0vMmP1pMWE3XmAeheMC3Hzt811rpdJmv8q6o/f7CTtcs06YaQDxRS8yQSm951kjdN51lqw0gfmZmoVF53mE0TLdY2uQjGrCC34jxxlh96smTYAdV1Wvdn9a5SuIkL5TLB8BlcQ5d9iqc41HLXBQumGwgWUyuxWJE4amJqznCxIfzYkOeGMsV6Zn1KQaJF1oe54fb1YJAhRK/5TwzNCSfy5qJOd2W7sV523e8wqO2hDOa9TosY9mqoGoZsiylbiWuTTBAgVtxiwqa8QQLF/cZguxdFQuQ7vjrkUqQecrCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zLyVzYFupTnTS5FZN7DFyYpqALEOpAHCDgZ/bQW0I7U=;
 b=TisBO7MVS+w5mbC0nhqo8dMUiE0ctYVgfmSZJa1W2IKHez+x1MN6v0OCrE6GYZhFntjMy/Pnp+d3KbKxrEvRXr004/4nyfs8cBoq9zdpG017ySOPXNRszHijsoJYxux19j+6UgUVGDYwpKO+I28U+2JUGPKSafWpRyPFREb+Q7M=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR0302MB2761.eurprd03.prod.outlook.com (2603:10a6:3:f0::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.29; Tue, 9 Feb 2021 14:19:31 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::c18c:4a01:ca24:78c1]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::c18c:4a01:ca24:78c1%5]) with mapi id 15.20.3825.030; Tue, 9 Feb 2021
 14:19:31 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "Mazziesaccount@gmail.com" <Mazziesaccount@gmail.com>,
        "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
CC:     linux-power <linux-power@fi.rohmeurope.com>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "geert+renesas@glider.be" <geert+renesas@glider.be>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "yoshihiro.shimoda.uh@renesas.com" <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH v7 0/6] Support ROHM BD9576MUF and BD9573MUF PMICs
Thread-Topic: [PATCH v7 0/6] Support ROHM BD9576MUF and BD9573MUF PMICs
Thread-Index: AQHW8MsqjUg9d5N2qUWs4Yp1tdSvQqpP+46A
Date:   Tue, 9 Feb 2021 14:19:30 +0000
Message-ID: <f2376878832deab2dad5c40e930b48467b5dde02.camel@fi.rohmeurope.com>
References: <cover.1611324968.git.matti.vaittinen@fi.rohmeurope.com>
In-Reply-To: <cover.1611324968.git.matti.vaittinen@fi.rohmeurope.com>
Reply-To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Accept-Language: fi-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4 (3.34.4-1.fc31) 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none
 header.from=fi.rohmeurope.com;
x-originating-ip: [62.78.225.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5705acbc-cd24-43c8-d1e7-08d8cd05b784
x-ms-traffictypediagnostic: HE1PR0302MB2761:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR0302MB2761BC6A46C7EE00B84B2DF6AD8E9@HE1PR0302MB2761.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BuJg2L8ubANgClR2pDkX9SRM9qSlOh7kN3X9dgKcSU2v3Vnj8MbG0c2TjBc2+ANHKV3mfPjWSMw+yypsNpDFaqsaiLVCU7C9g4yKfD4fAvNtEvXn8JD2Z0Fqt9t8T3Slt4cpbifsVPY0+cqCf0R2/7P15ZmFLH95CKlgN6WVg/mfMpNiP1uT2JlB1o+CzE5xpYx172SdRTbUdsW5p7ZE5A0voZMefm08tKSvhKXXw/aDxnGyJtyzruOWiMzSEfDHl7loWmCoXz6WK6uAYUyg+gTq9OMjpB7eRWRODY8y776tQ6vWH601vojccVcW0XDw3FKkQytcmHNBb3dWcNP49SLBaTMRMALiBTeRK6UmPgOQ8Lt0DMzSP5qf1vbx9rlFmbs7I4Twp/0BahL/Bjj2JXQV9aZ+0T4rUVi5t60RWDwhH+2+E48yssOL4QqvPOUF0HD+0EU08GDBNFnQKC0dgiigDPHBPbINqPcoxtqTso+3YqAIPhZIKC8C02KeNvuiuhRZ85OLcxzRXK+bdrTKv9LroO8ErZDr0KAJju5J9uLYPzUSTjj5SW5kea61/61GHIvocKkDHKHgJUDiVWH8qVMai9bac/V/i0u/8Yf9bsQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(346002)(376002)(39850400004)(396003)(316002)(3450700001)(2906002)(110136005)(54906003)(8676002)(83380400001)(186003)(71200400001)(2616005)(26005)(4326008)(6512007)(6486002)(6506007)(7416002)(86362001)(8936002)(5660300002)(66946007)(66446008)(66476007)(66556008)(64756008)(76116006)(478600001)(966005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?eXFSMUh1SXZDbEpwNXlabmpwSzUxb29lbVliSUt0T1NEd0xpRytMNVJaVmVs?=
 =?utf-8?B?b1ZiYS94QzUzVUI2NHdoNEpEdTZxSnd0Uk1FamdGUUxUS3pIWk5tTTBYaVJ0?=
 =?utf-8?B?dHJlRzFoRmRoUVdFUG5tUUYydWxOVSttQmRzMGI1ajRFUEU3SFhieU5nN3Vp?=
 =?utf-8?B?eEdTb0JiSGRFQjNMZE9yc1Q0UWVWdTd0SUlhTnlSdFczRHhGQVhIUHdDRzV5?=
 =?utf-8?B?N1JHREFTbVVPU2tCT2hmZXFISy9iVkx3NUlvSVFVSU4xVm81V05lNXZJbGdC?=
 =?utf-8?B?SjlGdlExaTJvdHl2cG04eU9sOXpNd25GOFMvZjFKb3JhOFhVUlJyTFF5aUho?=
 =?utf-8?B?M3h6KzcrcW54T05yYkcvbnk4QXJYcjNaVzVEUXBJbUp2eFNNR3JIYU9uengz?=
 =?utf-8?B?RTRleGZUcEZwaDVCRFdqZGpWQWszRmI2UHFXODRxbFh5WERFenlkaVd5RDla?=
 =?utf-8?B?SWNmV3ZZdTNDdDdiMUhlMHE3Ti9sbUlpZEN0a1Vpa0VCM2pBR0VjbFA0ekhK?=
 =?utf-8?B?RCsrbFFQZUdMQWpGVUcxVzlxclBMbFl4czNLT21mUmVmTytQa3oyRmd2Yllt?=
 =?utf-8?B?azdKNzR5WkdydWhwSDlFcEVFQThNQUxjNXpYUnVUWWkzTFVJVEJhV2hZM3BH?=
 =?utf-8?B?T0p0UFZ3b05oVjY3NUhMNVlRWDFkNkVLZGZKUWNRZ1U5Wmovc08vbUo2QUw4?=
 =?utf-8?B?bHYvR001ZjB1OTdab05jempnZ0lhcTdvOHpKWWZBVWpZbWRnSG44Uno1R3pK?=
 =?utf-8?B?eEtCQUdjc3BlTmM3WUNqM0x5Z0tYeGRXemhoU1lvUUxHd3FPOTRiQUF1cXhi?=
 =?utf-8?B?SlEwQ2NmM2RMcktwcndiVEtmdmNyTDNCVHcyUEtnLzNnK1BiRVdvRE8rMWNG?=
 =?utf-8?B?bUREKzM2YTU1azJtR1A5aDlqUnlUK1BRZTZoZk1HZlNwMldxMXdjSmRvaHhi?=
 =?utf-8?B?NW9XS2dRYzJKdEZYWlNrV0hyaTZjNE5qbW1FSjBMbDl2dmZLVUVVaWI0czh3?=
 =?utf-8?B?WDdGbFVQbkxVMEJRTTlDakdVOTMrK09FRm5Gdm9hWWxadmFSTkdmaU5TcTJo?=
 =?utf-8?B?cVZQVU9hbnZUMUwzZEhRb3lUTW4yWEM4ZkFnNkpDSkw3aElydVhQV04vZUdi?=
 =?utf-8?B?MzVkL1JUdzBSL1UzTlJuL1VGQWpNYWdpcUViM2t3K21OWHl6aU5SMUF2azFB?=
 =?utf-8?B?ZEpGZDY3aFhLbStDem9RbzhlMjBRRjE0bktPK1lKMmMxbWNQSng2a3lSR1U5?=
 =?utf-8?B?UHMwTlJtalppVkMyc1Q0bzFyUjNuNDZXS3h6REJYMXE4VS9tTTFRU01VREdM?=
 =?utf-8?B?SGdqQUx0ZHhlRDJZVGJFT1VDVGRYV3AwdFBVNHFvYUVRNVpidGFPc2o0RkJl?=
 =?utf-8?B?QWk0Mm5ObkJ3anBvektCMHRITHhHUVh3NDlEN3F0UVlUNGxPaHQrbnlxU3Z0?=
 =?utf-8?B?aDFwVis0RFJ4eTZSVUJLM0pTc3g0MXhvb1kydEtEOGNWbXFXSWdNZE82L3BL?=
 =?utf-8?B?VFZwdE1rVHkzZi9RVXZFQlFYdmw3dVUyS1F0NDhpdFJtYkpSbWpERTRHa2tn?=
 =?utf-8?B?YW5xekJsNVhmVUVGbEoxYnFjK2xyTmRxVEJOZ0tGOWh0ZGtOS2plRkFxYXR2?=
 =?utf-8?B?NmhDa01JZkFRTms0SnRLeEJ4N0lEQTF1RFM5eDh6NVBEUnZGN3l3TDg1WHAz?=
 =?utf-8?B?V0wxU1NOM1M5TkRlK1VTbUJqclpwTXJmdG9wWnVNeXFRQVJsWlpsTGpUS1Yy?=
 =?utf-8?Q?E5X6BT5r1X8SRoSaNp33tNpOUKYo1iYFfVqcSzJ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EC939CFE337AC74CB475250E8CCCDB99@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5705acbc-cd24-43c8-d1e7-08d8cd05b784
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2021 14:19:30.9771
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eBzvWfpHozbQq2GYMLNPjmEYOluMTJBEs2Ib65Lh9KAnq+rW8j6D/k2I3wSJboz1VFR8ua8b9oXT33Jwy59oXyESKJs+P2XvVQs5yZmnuHcV8LeKV43yo/1F6kQ2jvvb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0302MB2761
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

SGVsbG8gTGVlLCBNYXJrIEFsbCwNCg0KT24gRnJpLCAyMDIxLTAxLTIyIGF0IDE2OjMwICswMjAw
LCBNYXR0aSBWYWl0dGluZW4gd3JvdGU6DQo+IEluaXRpYWwgc3VwcG9ydCBmb3IgUk9ITSBCRDk1
NzZNVUYgYW5kIEJEOTU3M01VRiBQTUlDcy4NCj4gDQo+IFRoZXNlIFBNSUNzIGFyZSBwcmltYXJp
bHkgaW50ZW5kZWQgdG8gYmUgdXNlZCB0byBwb3dlciB0aGUgUi1DYXINCj4gZmFtaWx5DQo+IHBy
b2Nlc3NvcnMuIEJEOTU3Nk1VRiBpbmNsdWRlcyBzb21lIGFkZGl0aW9uYWwgc2FmZXR5IGZlYXR1
cmVzIHRoZQ0KPiBCRDk1NzNNVUYgZG9lcyBub3QgaGF2ZS4gVGhpcyBpbml0aWFsIHZlcnNpb24g
b2YgZHJpdmVycyBwcm92aWRlcw0KPiB0ZW1wZXJhdHVyZSwgb3ZlciB2b2x0YWdlIGFuZCB1bmRl
ciB2b2x0YWdlIHdhcm5pbmdzIGlzIElSUQ0KPiBpbmZvcm1hdGlvbg0KPiBpcyBwYXNzZWQgdmlh
IERULg0KPiANCj4gVGhpcyBwYXRjaCBzZXJpZXMgaW5jbHVkZXMgTUZEIGFuZCB3YXRjaGRvZyBk
cml2ZXJzLiBSZWd1bGF0b3IgcGFydA0KPiB3YXMNCj4gYWxyZWFkeSBhcHBsaWVkIGJ1dCB0aGlz
IHNlcmllcyBicmluZ3MgdGhlIG92ZXItL3VuZGVydm9sdGFnZSBhbmQNCj4gdGVtcGVyYXR1cmUg
ZXJyb3Igbm90aWZpY2F0aW9ucyB3aGljaCBjb25zdW1lciBkcml2ZXJzIGNhbiB1dGlsaXplLg0K
DQpJIGhhZCBzb21lIGRpc2N1c3Npb24gd2l0aCBNYXJrIGFuZCBBbmdlbG8gYWJvdXQgY3JlYXRp
bmcgYSBoZWxwZXIgZm9yDQpoYW5kbGluZyB0aGlzIGtpbmQgb2YgcmVndWxhdG9yIG5vdGlmaWNh
dGlvbiBJUlFzLg0KKEZvciBhbnlvbmUgaW50ZXJlc3RlZDogdGhlIGRpc2N1c3Npb24gY2FuIGJl
IHNlZW4gaGVyZToNCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvNjA0NjgzNmUyMmI4MjUy
OTgzZjA4ZDU2MjFjMzVlY2VjYjk3ODIwZC5jYW1lbEBmaS5yb2htZXVyb3BlLmNvbS8NCikNCg0K
SSd2ZSBub3cgZHJhZnRlZCBSRkN2MSBmb3IgdGhhdCBzdXBwb3J0IChub3Qgc2VudCBpdCB5ZXQp
LiBUaGUgUkZDDQpjb252ZXJ0cyB0aGUgQkQ5NTc2IHJlZ3VsYXRvciBkcml2ZXIgdG8gdXNlIHRo
ZSBuZXcgaGVscGVyIGFuZCBhZGRzDQpzb21lIG5ldyBkZWZpbml0aW9ucyB0byBNRkQgaGVhZGVy
cy4NCg0KV2hhdCB3b3VsZCBiZSB0aGUgbW9zdCBjb252ZW5pZW50IHdheSBvZiBoYW5kbGluZyB0
aGlzPyBTaG91bGQgSSBtZXJnZQ0KdGhpcyBzZXJpZXMgaW4gdGhlIFJGQyBhbmQgbWFrZSBpdCBq
dXN0IG9uZSBiaWcgc2VyaWVzPyBPciBzaG91bGQgSQ0Ka2VlcCB0aGVzZSBhcyB0d28gc2VwYXJh
dGVkIHNlcmllcz8gSWYgSSBrZWVwIHRoZXNlIGFzIHNlcGFyYXRlIHNlcmllcywNCnNob3VsZCBJ
IHRoZW4gb21pdCBhbGwgdGhlIE1GRCBwYXRjaGVzIGZyb20gUkZDIHNlcmllcyAtIGFuZCBhZGQN
CnBvdGVudGlhbCBNRkQgY2hhbmdlcyAobGlrZSBPVkQvVVZEIGNvbmZpZ3VyYXRpb24gcmVnaXN0
ZXJzKSBpbiB0aGlzDQpzZXJpZXMgKHdoaWNoIG1ha2VzIGJkOTU3NiByZWd1bGF0b3JzIG5vdCBj
b21waWxpbmcpIC0gb3Igc2hvdWxkIHRoZQ0KTUZEIHBhcnRzIGJlIGluY2x1ZGVkIGluIGJvdGgg
c2VyaWVzIC0gaW4gd2hpY2ggY2FzZSB3ZSBuZWVkIHRvIHNvbWVob3cNCnN0YXkgb24gdHJhY2sg
d2hhdCBwYXJ0cyBvZiBNRkQgaXMgcmV2aWV3ZWQuDQoNClNpbXBsZXN0IGZvciBtZSB3b3VsZCBi
ZSBpZiB3ZSBjb3VsZCBnZXQgdGhlIG9sZGVzdCBwYXRjaGVzIDEsMiw0IGFuZCA1DQpmcm9tIHRo
aXMgc2VyaWVzIGluLXRyZWUgKG9ubHkgTUZEIGlzIG5vdCBhY2tlZCkgLSBidXQgSSBndWVzcyBp
dCB3b24ndA0KaGFwcGVuIGF0IHRoaXMgcG9pbnQgb2YgdGhlIGRldmVsb3BtZW50IGN5Y2xlIC0g
YW5kIGJyaW5nIGluIHRoZSBJUlENCihwYXRjaCAzKSBhbmQgcmVndWxhdG9yIG5vdGlmaWNhdGlv
bnMgKHBhdGNoIDYpIHVzaW5nIHRoZSBSRkMgc2VyaWVzLg0KDQpIb3cgZG8geW91IHNlZSBpdD8g
U2hvdWxkIEkgbWVsZCB0aGlzIGluIHRoZSBSRkMgb3Iga2VlcCB0d28gc2VwYXJhdGUNCnNlcmll
cyAtIGluIHdoaWNoIGNhc2UsIGhvdyBzaG91bGQgSSBoYW5kbGUgdGhlIE1GRCBjaGFuZ2VzIGJy
b3VnaHQgYnkNCnRoZSBSRkMgc2VyaWVzPw0KDQpCZXN0IFJlZ2FyZHMNCglNYXR0aSBWYWl0dGlu
ZW4NCg==
