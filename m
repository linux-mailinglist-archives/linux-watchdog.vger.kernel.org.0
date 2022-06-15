Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F82854CBBD
	for <lists+linux-watchdog@lfdr.de>; Wed, 15 Jun 2022 16:52:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237373AbiFOOwI (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 15 Jun 2022 10:52:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235863AbiFOOwH (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 15 Jun 2022 10:52:07 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2122.outbound.protection.outlook.com [40.107.113.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74E7547057;
        Wed, 15 Jun 2022 07:52:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lU1mWhcshzmZjzOKjrN2kX5K/goJBBLEHZQZaahJs/BXkmpfePdZo710kjdkn9ZLZUL8svX+3aZEWGVoxivcC+yqSEWslN7dQ3m4wqiYQ8JL97C+hmEHOcldL4m5csQnxednRmi5AZmya2S8w96kKhHMFsxZiY3EwylCVmx94kNV7yi9DbvID/W/rnVBK4EC3xB3Y7faEg8PUNEqboW7ncilyKnQ5RE0FTAzXliznmohCJNZHcYXWNyWWjNso+o25Y9K/b7WAVg/E6SmXVC6Hur/q6Cy7U12ccL5GMN0laXu0wYcdJRCQi9YbQoTB75MK2Wqw3lzBz1Rkpse8DhaOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7O3/8qYmX0l52Xz72rWtFCI5gKlb99uslEQY7QO6lrw=;
 b=cAyDIFY9Bv6qHSdKiSIsuga0feCjZNapJXxOYyylE5l6VakYxJJqov5+Z79034DzyYxixuWU6kN1++IhP6S+cyt4D+DV26PT+Y0IKOOajE1eH7VwdGvWQtBL794qRrllll7iW5/YS+BvpBurWlMJ0sKdVPh4afTnC9xEdQLPZBObplU4NRiCFCfmMADZB9kGkVwV4MlB5Uv4SyNtECol0PxjUz/9mcwiHmG9ulGlEq1204yNudCf3pAvSb66z0JQ8iYolaAlM0771jwmR4wXxaMqiNBSeMpt0uLC8G7vuXns3rgbUiMJRD99uLtzSoTK7zyIxTihft1dt3yb/8if9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7O3/8qYmX0l52Xz72rWtFCI5gKlb99uslEQY7QO6lrw=;
 b=gRQxG3uLEviyNxZEn+IfKpFy0bMk0EPBa69MuJyKUCEGiSV/q9OwM2lpZxVEPirEm0LgIkwwkGQGUmURg800YsmpRv4ilCzAY9qyBC+wUoaP9k+SQEDM4AOnN0HIb3+FId/RlQOW0Sk9Y3lG0ZudHRXr/psaszl1xL7qGuIYgXg=
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com (2603:1096:400:de::11)
 by TYAPR01MB3967.jpnprd01.prod.outlook.com (2603:1096:404:c9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Wed, 15 Jun
 2022 14:52:04 +0000
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::e180:5c8b:8ddf:7244]) by TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::e180:5c8b:8ddf:7244%7]) with mapi id 15.20.5353.014; Wed, 15 Jun 2022
 14:52:04 +0000
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: RE: [PATCH v2 2/2] watchdog: rzg2l_wdt: Add rzv2m support
Thread-Topic: [PATCH v2 2/2] watchdog: rzg2l_wdt: Add rzv2m support
Thread-Index: AQHYfzckiD7LTixQXUa9ezjzZMuhQ61QOY4AgAALjXCAAEj3AIAAAbIw
Date:   Wed, 15 Jun 2022 14:52:04 +0000
Message-ID: <TYYPR01MB7086CD959B83D7F6649A22B8F5AD9@TYYPR01MB7086.jpnprd01.prod.outlook.com>
References: <20220613150550.70334-1-phil.edworthy@renesas.com>
 <20220613150550.70334-3-phil.edworthy@renesas.com>
 <CAMuHMdWhj8puZBBDS9256tW91z8Oh8-z_O_jbTgBsNtgeaS-pg@mail.gmail.com>
 <TYYPR01MB7086A4D1B42A213937EB6229F5AD9@TYYPR01MB7086.jpnprd01.prod.outlook.com>
 <CAMuHMdXLz5=0XfBQcQnVTkkhCxYJ-fQz0qu-cTAgs=G5jbJrpQ@mail.gmail.com>
In-Reply-To: <CAMuHMdXLz5=0XfBQcQnVTkkhCxYJ-fQz0qu-cTAgs=G5jbJrpQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 310709e5-ce99-4b63-8cd4-08da4ede9c75
x-ms-traffictypediagnostic: TYAPR01MB3967:EE_
x-microsoft-antispam-prvs: <TYAPR01MB3967DBA4715055E5E2B7304CF5AD9@TYAPR01MB3967.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8cAt9c3H0aGbrAX2mYpQqqokA7/kJxqWKSUO+d4o7wB6GaFUZJj0nHllxpw3NPYK5lORoApGKRvKEk4r+1EomO7rniR6KWF8x4xZRHPPBjibhL1Z0XoZcw/Azm2JA81OYntvLobCQM7I5asUDoK1MAeT495bCcvUzC1/FPgXUC9DIgQlJIZAx/rIbdcBcTU1thLrPd8IqSaXSGQ1oaBDhw3TzY0hJ5YTe4EKnV2NDVh9KDuIawqAJyvmI4zpOKTRlQAKIwU5Vncv8tB0PzoAEue1u+KeK5vY8+ah0/8rlBkMySgy3sEmUtckQCvo/PYTUVDQSe6K6tVAn9ibLiU5yGXTyn1hq9w9T+spfrgwVphTw/m0obzDBPazaFl1ZARYkgP3wH2j9bHiMxtXEKm/zc9KqQd/U6SvBh04oT99fv/r9ANc+iC8UNLqQ3KNoWBIh3+97Q9Zk4r9tyXggVRSDaMtUFeW06uqRDaRy8fy9r/mBVUAHh9NhGnYHIIkeZ89GSbHOn+Ojok1xa5A0fAff7Qo+ADolrAu3zfD7zI80DuhGnBSgy309Ij9j/NFE6X9VUhL12oi4Iyaug8jDQrcGB8oLg/iaYJc5yNzZIteo554Hxi3AYrhjJ7Kcjq5ohdWaioEkMjiXZxI0A0rXq+MMg3FWDUpYUIzrhERk4I9kRLW2FuUbZKTjihqPYDZpJSFIxNg5sucosqrjnx8tx13MA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7086.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(186003)(55236004)(53546011)(6506007)(107886003)(9686003)(122000001)(7696005)(38100700002)(26005)(86362001)(38070700005)(55016003)(52536014)(6916009)(44832011)(76116006)(66446008)(64756008)(8676002)(316002)(54906003)(71200400001)(66476007)(5660300002)(4326008)(8936002)(33656002)(508600001)(83380400001)(66556008)(2906002)(66946007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bkRiT1BUdlVhT3BFZno4cTRrMDVtSlpaNVJxVVk4MzdnclQ3R0Y0V2xsSGs4?=
 =?utf-8?B?S0M1ZzF4R2FKSEtFeWFOM0VhSFpxUzZRUkZCMDlFV0RMZk9hSmdXZXAyY095?=
 =?utf-8?B?MnZyR3pVYlNlRlRDSWI1ZGtXckYrQjJFdjVCZ05Ma1Nyb1FrZGMxL21VbFVa?=
 =?utf-8?B?T2JMNHppZkF0Y1NISnJnQUVuNGR5c09uVVphSThPVzJWdXdFNC9hS0tTckpK?=
 =?utf-8?B?Znk3eVQzdEsvdWhuV0FnVGo4ancwbXdXcnMxOVNlRExZa2I5b0VabTV3U0JK?=
 =?utf-8?B?UHdld0NIVTIwV1h0VHJPS2xlcUFkWGhJbnVRU0k2TWJYeStsbS92UFJQSE1O?=
 =?utf-8?B?WnlZT0t0N2tkMU1MQ1ZvQ1ZRUHBKUFJTdUg1aGhNSS9UUE1IR2F0ak14QkJL?=
 =?utf-8?B?QWdKeGJiekszNXRXcFFFT0VJN3RyZnpFMUhqdWFYUFZHY0wxQUFXcnE3NVdB?=
 =?utf-8?B?TkZXT2xMOXBCMDYzZXZzOEJIdlB3NnpVMnJIM1pIc0oybnNiVEpzVFoxR3Rr?=
 =?utf-8?B?TGxsN2c4VnArVjI2UFZ0dVVsbWZFQU5VRnNXV201VnpZQjdRNGJZVWQ3VktE?=
 =?utf-8?B?MjUwWkVKcGZMVlpRNHhJL0tiN3VvL2N0alRhTEpndjEzS3grQTBKREFzdDFF?=
 =?utf-8?B?eFR4NTF1ZWlHNUpUV2hOUUJEZGpyRUcvL1pGR0NrSE9tbFZVdDh5MjQ5Ritl?=
 =?utf-8?B?MHdGZWxHNHptZlVVMTFNY0NRemdPZWV2NDQzek5NMlFwOTgyaHpUcHdJcjBW?=
 =?utf-8?B?bkFpZnBzVEd0VEE1a1Q1Z3pCekVKVk1pSE1YQW5SbnlGMmJMUWpPcWVSVnlW?=
 =?utf-8?B?ZHZ5eTV2L002U1RKUnlpb3BIUXc0bGNMOFRKbWZtVllzTzdYaHNYUE1WYWRU?=
 =?utf-8?B?aGxtYjBvUkZmcFdYMHpqYlhtZHZSVkpZZ09EZktWVkRVajVYcjRaMnFOakFx?=
 =?utf-8?B?MEw4bjJkeVI4c2tNSzVQNHVCZHFGdTJzK0IwNVdUTDFQbWdlUmVuVlVZL2c1?=
 =?utf-8?B?c3lOcFBNa0w5dkFTa3lCcmRLcWQvdi8yMSt3YmRpN3JkN054ZHArS3RMMHJy?=
 =?utf-8?B?TExFb1NPM3k4dkRuNHB4Z2hNVkVvN2JKSDZkeC8xMU1qb3lGWlh4V1lpV09K?=
 =?utf-8?B?Vlk3Y1FPb0U4M2JUYUdncHRNM2hVbWd4ajFFWWdrSkluelZ3Szl3eWVFNkpZ?=
 =?utf-8?B?YURqR04zTDEwQ3h4ZlpiQTlIRG5WeTZrb2Q1U2wwNk1wNVErY1d1bEF1NXRt?=
 =?utf-8?B?R2FPeHJoWHlicHhqdzZPSWhsRGlad29FSy9MMVZRdks3MzJKK0h1YWtHQU5a?=
 =?utf-8?B?UDJZSkhRcWtlRnVXeHFZV05zbjdNc0VrQ2xSazdoQVpFZHBKY2tBVGRPK3pJ?=
 =?utf-8?B?YnBua3ZtcjFoMjY5eXJ1ZnIxWEdWSEVqWUxNTG9qbW1MbWY2dGF6OUhLSG41?=
 =?utf-8?B?N09oQStGdDgrd2dsdzRRN3o0bm10MlpkYnZxRE9rdUZmQmx3eGhrVGtIUmdI?=
 =?utf-8?B?R0QzcURtTWsrUXlGaUhiNVhnQ2Z2S2ZjRVZpb1VRQ1hWVHRSaGN4dnJmNWVj?=
 =?utf-8?B?YnVBMXkyZ2dSMHlsVUg1RjRiR0s3elROUEEvRDhlaHU0MEpvWE1wZk5HVDlG?=
 =?utf-8?B?UC9DUFU1R1JYMkFEbjk4UStQRFd0MXlvUGNQdFpoYTBhMEJvaW9mRkhVeTl6?=
 =?utf-8?B?NHR6OWJJLzlJMy9aM2dkc29GZlhiZk1EYVEzajl3MUhZenBnTXA0WG5XV0FF?=
 =?utf-8?B?eVBZZ25wQmN3WERkRkJXR24vRC9vMWZpczdVS1ZDKzJBM05VbGRMQndkVHl3?=
 =?utf-8?B?ak0wcXJXTXRvQnFIRVNnaGh6dDRoaHlOWW50TFkrN1c3OENLUWFZcm5tZ3pQ?=
 =?utf-8?B?eW8rbG4vZHllRDJPU2lBMHRkZTlKQWoya1BpZTVqYkd0NTB2S280bWVPS3Nn?=
 =?utf-8?B?YkRFRkY3MVhIdVlZTjhlcGpmdi9wR2FBNjVQcUtVUVdJSGUwVDkzaFcxck05?=
 =?utf-8?B?eU4vY01ucCtYWmc5bE9XVEE3Yi9yMHZ6WkxZYTkvRytoempIamRMVDhxcE5s?=
 =?utf-8?B?MmxUWXBjeVFyRmQ0ODBrR2h2Z1BCYnFCOUNJdUlMRkdKakVmMkdiUEhGaHpS?=
 =?utf-8?B?b2M4NnY4SG5OYUhzdjU3bGV6V3FOQlFSVnl2Zm12RTRMaVM0RHRLQ0xjN3cx?=
 =?utf-8?B?NS9NUzF2VUR1c2xZSk5JenZyQlJtSTNDdlNRaVpBblExdHBJNnp3SGdoN1M1?=
 =?utf-8?B?dGoyZlA2Wi9DYmtLay9pZ3dBTzBYT0w2emxGWTNuNHYwWWlKUUZFMnVzRWd3?=
 =?utf-8?B?OFc5dnJlU1BjUjdSSFQxTzBMdmo2YUNsbldKNkcwQ1hhNHhYanBRdVBIUm4z?=
 =?utf-8?Q?RYQKBntZhscHJxYA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7086.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 310709e5-ce99-4b63-8cd4-08da4ede9c75
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2022 14:52:04.0689
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4BQElqb4i3TWpNZJuls82ycQ9j4+En5Ei5P3uIfEZONXT+wzA8wVHYycv7amepgNUpTzGp9EhOZsTLQ/MhaSEBpoxCNV4wZCRDXzWWnm3wY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3967
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

SGkgR2VlcnQsDQoNCk9uIDE1IEp1bmUgMjAyMiAxNTo0MyBHZWVydCBVeXR0ZXJob2V2ZW4gd3Jv
dGU6DQo+IE9uIFdlZCwgSnVuIDE1LCAyMDIyIGF0IDQ6MzIgUE0gUGhpbCBFZHdvcnRoeSB3cm90
ZToNCj4gPiBPbiAxNSBKdW5lIDIwMjIgMTA6NDEgUGhpbCBFZHdvcnRoeSB3cm90ZToNCj4gPiA+
IE9uIE1vbiwgSnVuIDEzLCAyMDIyIGF0IDU6MDYgUE0gUGhpbCBFZHdvcnRoeSB3cm90ZToNCj4g
PiA+ID4gVGhlIFdEVCBvbiBSWi9WMk0gZGV2aWNlcyBpcyBiYXNpY2FsbHkgdGhlIHNhbWUgYXMg
UlovRzJMLCBidXQNCj4gd2l0aG91dA0KPiA+ID4gPiB0aGUgcGFyaXR5IGVycm9yIHJlZ2lzdGVy
cy4gVGhpcyBtZWFucyB0aGUgZHJpdmVyIGhhcyB0byByZXNldCB0aGUNCj4gPiA+ID4gaGFyZHdh
cmUgcGx1cyBzZXQgdGhlIG1pbmltdW0gdGltZW91dCBpbiBvcmRlciB0byBkbyBhIHJlc3RhcnQg
YW5kDQo+IGhhcw0KPiA+ID4gPiBhIHNpbmdsZSBpbnRlcnJ1cHQuDQo+ID4gPiA+DQo+ID4gPiA+
IFNpZ25lZC1vZmYtYnk6IFBoaWwgRWR3b3J0aHkgPHBoaWwuZWR3b3J0aHlAcmVuZXNhcy5jb20+
DQo+ID4gPiA+IFJldmlld2VkLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5j
b20+DQo+IA0KPiA+ID4gPiAtLS0gYS9kcml2ZXJzL3dhdGNoZG9nL3J6ZzJsX3dkdC5jDQo+ID4g
PiA+ICsrKyBiL2RyaXZlcnMvd2F0Y2hkb2cvcnpnMmxfd2R0LmMNCj4gPiA+DQo+ID4gPiA+IEBA
IC0xMzksMTQgKzE0NiwyNSBAQCBzdGF0aWMgaW50IHJ6ZzJsX3dkdF9yZXN0YXJ0KHN0cnVjdA0K
PiA+ID4gd2F0Y2hkb2dfZGV2aWNlICp3ZGV2LA0KPiA+ID4gPiAgew0KPiA+ID4gPiAgICAgICAg
IHN0cnVjdCByemcybF93ZHRfcHJpdiAqcHJpdiA9IHdhdGNoZG9nX2dldF9kcnZkYXRhKHdkZXYp
Ow0KPiA+ID4gPg0KPiA+ID4gPiAtICAgICAgIGNsa19wcmVwYXJlX2VuYWJsZShwcml2LT5wY2xr
KTsNCj4gPiA+ID4gLSAgICAgICBjbGtfcHJlcGFyZV9lbmFibGUocHJpdi0+b3NjX2Nsayk7DQo+
ID4gPiA+ICsgICAgICAgaWYgKHByaXYtPmRldnR5cGUgPT0gSTJDX1JaRzJMKSB7DQo+ID4gPiA+
ICsgICAgICAgICAgICAgICBjbGtfcHJlcGFyZV9lbmFibGUocHJpdi0+cGNsayk7DQo+ID4gPiA+
ICsgICAgICAgICAgICAgICBjbGtfcHJlcGFyZV9lbmFibGUocHJpdi0+b3NjX2Nsayk7DQo+ID4g
PiA+DQo+ID4gPiA+IC0gICAgICAgLyogR2VuZXJhdGUgUmVzZXQgKFdEVFJTVEIpIFNpZ25hbCBv
biBwYXJpdHkgZXJyb3IgKi8NCj4gPiA+ID4gLSAgICAgICByemcybF93ZHRfd3JpdGUocHJpdiwg
MCwgUEVDUik7DQo+ID4gPiA+ICsgICAgICAgICAgICAgICAvKiBHZW5lcmF0ZSBSZXNldCAoV0RU
UlNUQikgU2lnbmFsIG9uIHBhcml0eSBlcnJvcg0KPiAqLw0KPiA+ID4gPiArICAgICAgICAgICAg
ICAgcnpnMmxfd2R0X3dyaXRlKHByaXYsIDAsIFBFQ1IpOw0KPiA+ID4gPg0KPiA+ID4gPiAtICAg
ICAgIC8qIEZvcmNlIHBhcml0eSBlcnJvciAqLw0KPiA+ID4gPiAtICAgICAgIHJ6ZzJsX3dkdF93
cml0ZShwcml2LCBQRUVOX0ZPUkNFLCBQRUVOKTsNCj4gPiA+ID4gKyAgICAgICAgICAgICAgIC8q
IEZvcmNlIHBhcml0eSBlcnJvciAqLw0KPiA+ID4gPiArICAgICAgICAgICAgICAgcnpnMmxfd2R0
X3dyaXRlKHByaXYsIFBFRU5fRk9SQ0UsIFBFRU4pOw0KPiA+ID4gPiArICAgICAgIH0gZWxzZSB7
DQo+ID4gPiA+ICsgICAgICAgICAgICAgICAvKiBSWi9WMk0gZG9lc24ndCBoYXZlIHBhcml0eSBl
cnJvciByZWdpc3RlcnMgKi8NCj4gPiA+ID4gKw0KPiA+ID4gPiArICAgICAgICAgICAgICAgd2Rl
di0+dGltZW91dCA9IDA7DQo+ID4gPiA+ICsgICAgICAgICAgICAgICByemcybF93ZHRfc3RhcnQo
d2Rldik7DQo+ID4gPg0KPiA+ID4gVGhpcyB3aWxsIGNhbGwgcG1fcnVudGltZV9nZXRfc3luYygp
LCB3aGljaCBpcyBub3QgYWxsb3dlZCBpbiB0aGlzDQo+ID4gPiBjb250ZXh0LCBjZnIuIGNvbW1p
dCBlNGNmODk1OTZjMWYxZTMzICgid2F0Y2hkb2c6IHJ6ZzJsX3dkdDogRml4DQo+ID4gPiAnQlVH
OiBJbnZhbGlkIHdhaXQgY29udGV4dCciKS4NCj4gPiBPaywgSSBzZWUuIEkgaGF2ZW4ndCBiZWVu
IGFibGUgdG8gdHJpZ2dlciB0aGF0IGJ1ZyBvbiByei92Mm0uIEknbQ0KPiA+IE5vdCBzdXJlIHdo
YXQgSSBjYW4ndCB0cmlnZ2VyIGl0IHRob3VnaC4NCj4gPg0KPiA+ID4gV2hpbGUgeW91IGNhbiBj
YWxsIGNsa19wcmVwYXJlX2VuYWJsZSgpIGluc3RlYWQsIHRoYXQgY2FuIG9ubHkgYmUNCj4gPiA+
IHVzZWQgYXMgYSB0ZW1wb3Jhcnkgd29ya2Fyb3VuZCwgdW50aWwgeW91IGhhdmUgaW1wbGVtZW50
ZWQgUlovVjJNDQo+ID4gPiBwb3dlciBkb21haW4gc3VwcG9ydC4uLg0KPiA+IFNvcnJ5LCBteSBr
bm93bGVkZ2Ugb2YgcG93ZXIgZG9tYWluIGlzIHNvbWV3aGF0IGxhY2tpbmcuLi4NCj4gPg0KPiA+
IEkgZm9sbG93ZWQgdGhlIGNvZGUgaW50byBycG1fcmVzdW1lKCkgYW5kIHNlZSBmcm9tIHRoYXQg
Y29tbWl0IG1zZw0KPiA+IHRoYXQgdGhlIHByb2JsZW0gYXJpc2VzIGluIHJwbV9jYWxsYmFjaygp
Lg0KPiA+IExvb2tpbmcgYXQgdGhlIGNvZGUgaXMgYXBwZWFycyB0aGF0IGlmIHBvd2VyIGRvbWFp
biBkb2VzbuKAmXQgc2V0IGFueQ0KPiA+IGNhbGxiYWNrcyBpdCdzIGNvbnNpZGVyZWQgYSBzdWNj
ZXNzIGFuZCBzbyB3b27igJl0IGNhbGwgcnBtX2NhbGxiYWNrKCkuDQo+ID4NCj4gPiBJcyB0aGF0
IHdoeSBwb3dlciBkb21haW4gc3VwcG9ydCB3aWxsIGFsbG93IHRoZSBkcml2ZXIgdG8gY2FsbA0K
PiA+IHBtX3J1bnRpbWVfZ2V0X3N5bmMoKSB3aXRob3V0IGlzc3VlPw0KPiANCj4gTm90IHJlYWxs
eS4NCj4gDQo+IFlvdSBjYW5ub3QgY2FsbCBwbV9ydW50aW1lX2dldF9zeW5jKCkgZnJvbSBhIHJl
c3RhcnQgbm90aWZpZXIuDQo+IEhlbmNlIHRoZSBSWi9HMkwgcmVzdGFydCBjb2RlIHdvcmtzIGFy
b3VuZCB0aGF0IGJ5IGVuYWJsaW5nIHRoZQ0KPiBjbG9ja3MgbWFudWFsbHksIHdoaWNoIHdvcmtz
IGFzIHRoZSBQTSBEb21haW4gb24gUlovRzJMIGlzIG9ubHkgYQ0KPiBjbG9jayBkb21haW4uDQo+
IA0KPiBIb3dldmVyLCB1bmxpa2UgUlovRzJMLCBSVi9WMk0gYWxzbyBoYXMgcG93ZXIgYXJlYXNb
MV0uICBDdXJyZW50bHkNCj4gTGludXggZG9lcyBub3Qgc3VwcG9ydCB0aGUgUlovVjJNIHBvd2Vy
IGFyZWFzIHlldCwgc28geW91IGNhbiB1c2UNCj4gdGhlIHNhbWUgd29ya2Fyb3VuZCBhcyBvbiBS
Wi9HMkwsIGkuZS4gZW5hYmxlIHRoZSBjbG9ja3MgbWFudWFsbHkuDQo+IFdoZW4gc3VwcG9ydCBm
b3IgUlovVjJNIHBvd2VyIGFyZWFzIHdpbGwgYmUgYWRkZWQsIHlvdSB3aWxsIGhhdmUNCj4gYSBw
cm9ibGVtLCBhcyB5b3UgY2Fubm90IGVuYWJsZSBwb3dlciBhcmVhcyBtYW51YWxseSwgb25seSB0
aHJvdWdoDQo+IHBtX3J1bnRpbWVfZ2V0X3N5bmMoKS4NCk9rLCBtYWtlcyBzZW5zZSwgdGhhbmsg
eW91IGZvciBleHBsYWluaW5nIGl0Lg0KDQo+IERvZXMgUlovVjJNIHN1cHBvcnQgYWx0ZXJuYXRp
dmUgd2F5cyB0byByZWJvb3QsIGUuZy4gUFNDSSByZWJvb3Q/DQpObywgbm8gb3RoZXIgd2F5Lg0K
DQpUaGFua3MNClBoaWwNCg==
