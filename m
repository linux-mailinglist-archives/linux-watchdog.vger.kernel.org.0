Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B2FF54688F
	for <lists+linux-watchdog@lfdr.de>; Fri, 10 Jun 2022 16:41:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229662AbiFJOlz (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 10 Jun 2022 10:41:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229920AbiFJOlx (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 10 Jun 2022 10:41:53 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2120.outbound.protection.outlook.com [40.107.113.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80DEF2DF124;
        Fri, 10 Jun 2022 07:41:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mM3x6ooHb8IJk1/OBU+kpRlZclMBQHf8lmqPWmq720qrcD7yItkBN/O8S+qj5rDln2j2EgQpQGU0C9vK0eNbbK51c2mkAU87h8vWo+FgdRIgKB7WtoMLAbU4N6DymIYCjzgyv50xWjT9D3YFKJ3BmQA1rcCEmobQx+Vl+wQAIbYT5k74buyXX3cwjlPseeYcECBZ+vEKrJ0ahy5DGcW0p/+UXtRzE/GF0+rTDdtrHzFqh1lgFo+B8i1WgL5YTouvuD1xJoD7I5ZiEAFyckPmRs9LdXIejRXPdsJGO3RRVGrIQA4m5UFfzyKCdLkkZC8XJ9n9+t0wuhoaciIkuJf5jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f+8QPIzeUGzSLJvgodnIkNhzmO27yyHq0xmIgOnmqME=;
 b=ii8uD1Zu5GHt2EFcYUbh0IOcYKYaiNp94wWaT1JvU9gHy83mE2taUwGg5OJ3funtIbnFPmtnfQbwVAaYrPDRBOpxrl0ZKVvZMUGGiFtTaYdSVs2M+o553JNX1T8wgphu50KYDMzmsaPXavPlcCjrnKWhQOaq9reEZuzyAly8Be8bl++bDRNDkv/41rwUUu/NQdiLO1OyqUTDcN4mV5SU5z8bXx9VFEaWtOX6yFQmreFd6++5CUtly1eTBBZ8Aw0sLd+AHBQrx2OXTev4Lv+J23pH6CBg0qyWVGuARNcKGdYyEl4ZvL8unHtCsiygCL7thNLRxQF1b5FZejGY6OYu6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f+8QPIzeUGzSLJvgodnIkNhzmO27yyHq0xmIgOnmqME=;
 b=KJatdPFJ6E6UXmYKAHfT1graet/j9CbuAnNh/c98pFoAMkvSp5ulZ0rB0qUce7C+9WnchnCFFbJP4yTCnlP6wfzsAA0m2p66UkYUrnSgP/kAvMVEkAhiOF5iNb3K5Elnl4YZU7zqgx0gRCJjcr+yJ082o51Ww3gjvpS33lolKYE=
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com (2603:1096:400:de::11)
 by TYAPR01MB6201.jpnprd01.prod.outlook.com (2603:1096:400:85::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Fri, 10 Jun
 2022 14:41:50 +0000
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::e180:5c8b:8ddf:7244]) by TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::e180:5c8b:8ddf:7244%6]) with mapi id 15.20.5332.015; Fri, 10 Jun 2022
 14:41:50 +0000
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: RE: [PATCH 1/2] dt-bindings: watchdog: renesas,wdt: Add r9a09g011
 (RZ/V2M) support
Thread-Topic: [PATCH 1/2] dt-bindings: watchdog: renesas,wdt: Add r9a09g011
 (RZ/V2M) support
Thread-Index: AQHYenZtlRgjZcOPoEW6UK7rCK4W+a1FVr2AgANeLUCAAAXbQA==
Date:   Fri, 10 Jun 2022 14:41:50 +0000
Message-ID: <TYYPR01MB7086617456CBDB2E596E82CEF5A69@TYYPR01MB7086.jpnprd01.prod.outlook.com>
References: <20220607135619.174110-1-phil.edworthy@renesas.com>
 <20220607135619.174110-2-phil.edworthy@renesas.com>
 <83a8fb86-3311-87fe-c4ca-ab8e6d0cf784@linaro.org>
 <TYYPR01MB7086EFE64F1DF8C6141E8719F5A69@TYYPR01MB7086.jpnprd01.prod.outlook.com>
In-Reply-To: <TYYPR01MB7086EFE64F1DF8C6141E8719F5A69@TYYPR01MB7086.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f17e4f27-b810-436d-74e9-08da4aef5aa7
x-ms-traffictypediagnostic: TYAPR01MB6201:EE_
x-microsoft-antispam-prvs: <TYAPR01MB620103DDC24F5ADB41917D75F5A69@TYAPR01MB6201.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tqOGncQlm5Y16yJRWtYr7uvO+6jQ/wWp2nWzOamouDFmdjYYsq+Hv4BwR6obqYU3Je4YP6aqxCKodZ7gAS455pAABGDImXYaTCmtu/0vPrls2JhR8e6/sfgqQtbddSqTtVVoH2Fu84RR8KmTQ0eWa0eNHtkbZY+tm3/PU+rNG27Lza3BW0euYkqVTzQ/WXTgHTB6ik27stW0NicNmOoPCD/r926CjFT+ey7eaWWdqa8I17kxScYDz9Cur+8S6uVCoDZaJhG+vAMhDNrmbLwb8acLMaffwYxt9nNRFVrTA4e7DfQIWhyXezo2l70tRxXIp1ZHfqg2zz/aazWTnN/22qW8u/5Q2bkgE24Xg5NF5cnH2j8MnSnMdgiSAWGLic7s6D9Lbwq4MI49OOx1B41/RTWfesYQ4aXlEzR5DZRnuuR/ZpArUhe7ZqSPn3hF16kRftrKlpMgp5dOaRBTVL7BK3l4VyprAdzOTDJWccgfww7AOE/gcvMmFyItqiTxZ7z+0/z0qqNCqjP4L5AjviQz9KD/YCdnUxvWw+0nqM4gFov1th63j3NkQ1I+oqUUrr2us0P+STODt1CCRDukvBZBxVui9RKYE+HPg1KmLgvaWC5mVAnjEyYxn6BPn4qiyH+yk733CR4vvPyfervRlBg/ZW9r8F4m/bfzbpDVd6btI/OBlYBUoBSeJ1fspDss2pPtoFhq9hZKbmW14RM1tfmu+Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7086.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2940100002)(4326008)(8676002)(71200400001)(26005)(2906002)(7416002)(5660300002)(508600001)(33656002)(38100700002)(44832011)(9686003)(6506007)(7696005)(86362001)(53546011)(64756008)(38070700005)(83380400001)(66446008)(186003)(52536014)(66476007)(8936002)(316002)(66946007)(107886003)(76116006)(54906003)(66556008)(110136005)(55016003)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c3R3K1BpV3B5blN2WWMrN2IvRFIzdjFqNW8yT1JuSGkrclRrNUt3VzRyaHM5?=
 =?utf-8?B?TjVjQ3puKzM2VVVPREVpM1ZENS8vNThlYm1rcXFqUnlJYWFXZzE3MXd1REEw?=
 =?utf-8?B?RXJ1NnFHQmpHNnIxSWtvSXRRbmdYSkdHMTBuWVo4elpLREFKZVc4UmwzOUVF?=
 =?utf-8?B?dUpSS0hLVTdXbW9HVy9XL3lWRUhqQ3pYMFNwdTJBWDZVc2lKYkhZVU9vd0hj?=
 =?utf-8?B?UkxEWk5CYzZ6TEM4SEkwakV1cC91aDViWlRXS0xnbEcvK1ZkZ0lNM2tNMWpH?=
 =?utf-8?B?ME8ySnZQcGdkbUF3dVN4T3pyeHhMNmJwVTdzMEdZSlZ4SjBpQnduNTJkdDJJ?=
 =?utf-8?B?WGNwWXByTCs1ZmlubXBzSWtvSWg0aVp4b0RCU0ZzZlJLUDJkdS9NenlXVTNr?=
 =?utf-8?B?MDlFaEgvbkpzZG9JUDY2dkw3clYxOThBMWs0RlltVy9UeUcrbXRyVFVlOGkr?=
 =?utf-8?B?Nnk3QlRIazFTcVV5S3pLbDdEdkhHQ2xDSXdWVmNZSzlXa3FQRUwxZTFCTTFa?=
 =?utf-8?B?LzFRMTZYckJsQnFhYVMxeG1pYmszYnZuQ0Q5YVp0Y0lqenE3NEppU1FEK3RN?=
 =?utf-8?B?bi9VWnFxTTFkR09obk5ldkplWGpud1BjalJDejRpRVJTZ3pWYkI3ZERjM3ds?=
 =?utf-8?B?d004RVU0bFlmNGtZZkZGOTBmbWZ0THRtUDNlbUpBdXYrcnUvbjBFNklGbjVJ?=
 =?utf-8?B?OTBMZ1pRbUI4eitOeWFtTjFyc3A2ZnpyOUhzM0pjeTNOcnVOcTlsTTVvb0Y4?=
 =?utf-8?B?eFV4TXErL1FBRGI4eEc1ZHhMV2lmd1V5dUFrQVNkVFJ1MURFRVZVT0RoT1oy?=
 =?utf-8?B?dGsyUWd4dTZhRko1aUNvYU9Gek1CNUI0TG5qeGJpTHdTaGlvZzBBa3NRMjdJ?=
 =?utf-8?B?dFlMekVXR20zcnliQ1NuZVdIVE9wd2xYM3FYSEJGVGFNdW5ONk9jeDc1QkFZ?=
 =?utf-8?B?ZEpDQ0wzeXYvUXZTYjYvZlE5cG00QnFwNFNFeHgxN2dDenVYLzBxSlhnTElr?=
 =?utf-8?B?OUpFMFZxNXYwOFU3QTVkWTh0ajdSamZPTGNYQmtiK3BVeWNpZ2VYK3czY2JW?=
 =?utf-8?B?dm0zQTV4UHR0dFp6ZmluY0FWZDZqbTlERlFIVXF5cTh4UVg0K0F1UkZaaElk?=
 =?utf-8?B?bXpKa0ZvRE1QNVV2SUVsOFdYUTQzOVBJUFgyVnMrOTdwNGk4MEdxdE5yNUhN?=
 =?utf-8?B?WDVMOTlaM256NCtmQkhhMStOMlNMczJ6M0VtZy9qcDNNdnJnRlVQcmlNTExn?=
 =?utf-8?B?ZjBjUlg0empTRGJhR1kycm5JUWJYWGFnQS90UXgzRy9UajB5YXdRdUtMZGx6?=
 =?utf-8?B?a0xrakJ6d3hDT1VvelN4UUNuVXNCR3lJM1hBcVViUkxGczlEVmg4Sm85Zkdt?=
 =?utf-8?B?aWZMTHFDUHh0anhIcGFqS3F1TE9mYjJGazAwU3g5QlhTa0MzTkNiMTBLL1FB?=
 =?utf-8?B?cXJHT3Vpc2V0eGZPTnJsVjF1dmxmNTdRUFlOY0t0NGJBSXMxUzZ6c08xTjdn?=
 =?utf-8?B?NzFYR2pZYXdwNjJMNjdCQ1dYanl0YmxMSy9XZTU3SU1hZE56ZzllR1hVRi91?=
 =?utf-8?B?ZC84ME1pSUd4US9MRmx5b1BLRG1haUUwMXNZL00xd3lmdnlmaVRjQ1FqcThN?=
 =?utf-8?B?S2RPSmdubW9YeGIrZWdRYmtpZlZ6TUhIWFFuSG40blFzbFg0M0VSTXVZdDZH?=
 =?utf-8?B?SGdqRVNHZ2Y0WG5PK2ZHRFcxZ2k3T0ExdU41aUpoVXdCUkdIdjdoRnA5Vk1k?=
 =?utf-8?B?bFJHRnhXaVM3elllVUFDY01UOTRxZDJUd2hhR3cvMDJCYlZkRW9YWFBoWlBW?=
 =?utf-8?B?Qk5TSjJDWHZ5RDFVUzhiSXVTUlZUem5GVDNnbmVGV2ErTXR4SExkd0w5K3Zk?=
 =?utf-8?B?UlpjUVRoMmdVZFZ4aW5OendPbG5BcklqUjVtM3V3Q2l3QktVTFBoSmd1VWNs?=
 =?utf-8?B?RVo5WkxuK1NvM2dlVk1GVHhuL1FtVWV2MnphVTN5bWd5aUJXdEdTak4yU3Np?=
 =?utf-8?B?TkoxV3M3OXpLRjhsbnZGZ1hKdkd3ZEcySitUSzVaSkhMTExhRFRhMlVIcVZO?=
 =?utf-8?B?ZFNMd3M4SGl0TjhlVkVoYmlGNkhFMDZrNjBvSi9oK3I5QVhnWGJ2M1kwT0tB?=
 =?utf-8?B?M2hRamhJd29wdld2ZXdiODkyZU01WDFTc213VlprZVpQQXVoa2k0OWpMOTR4?=
 =?utf-8?B?dE5xclNYMDZJQ2djWGVjRyt5U25uODZISlo4blBkb2N6STVINFNrcFdCdVdI?=
 =?utf-8?B?MWlSaWsrY1JESWhhQkVkUUpERUNlVkg1STc4UytuK3Q4aWloOEN1RkNpV0R6?=
 =?utf-8?B?SC9wbERLV1VMM081RGhzWTdIS1VvYmN5NkdhU09XY2w1eDljdjBCa2IvN2ZR?=
 =?utf-8?Q?jqsil44rV9uK3aj8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7086.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f17e4f27-b810-436d-74e9-08da4aef5aa7
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2022 14:41:50.4284
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aXIg/jYhlhaNSL7+eyqVMyUupiWVAuuIkU6WrdUtHahLCNhRBzA2HxfLG1YMEbCr8XKsEX/W8qGWaIqMR23OrxjjOGBbWZ/xTy8ql2h/46M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6201
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

SGkgS3J6eXN6dG9mLA0KDQpPbiAxMCBKdW5lIDIwMjIgMTU6MzggUGhpbCBFZHdvcnRoeSB3cm90
ZToNCj4gT24gMDggSnVuZSAyMDIyIDExOjUyIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+
ID4gT24gMDcvMDYvMjAyMiAxNTo1NiwgUGhpbCBFZHdvcnRoeSB3cm90ZToNCj4gPiA+IEFkZCB0
aGUgZG9jdW1lbnRhdGlvbiBmb3IgdGhlIHI5YTA5ZzAxMSBTb0MsIGJ1dCBpbiBkb2luZyBzbyBh
bHNvDQo+ID4gPiByZW9yZ2FuaXNlIHRoZSBkb2MgdG8gbWFrZSBpdCBlYXNpZXIgdG8gcmVhZC4N
Cj4gPiA+IEFkZGl0aW9uYWxseSwgbWFrZSB0aGUgYmluZGluZyByZXF1aXJlIGFuIGludGVycnVw
dCB0byBiZSBzcGVjaWZpZWQuDQo+ID4gPiBXaGlsc3QgdGhlIGRyaXZlciBkb2VzIG5vdCBuZWVk
IGFuIGludGVycnVwdCwgYWxsIG9mIHRoZSBTb0NzIHRoYXQgdXNlDQo+ID4gPiB0aGlzIGJpbmRp
bmcgYWN0dWFsbHkgcHJvdmlkZSBvbmUuDQo+ID4gPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogUGhp
bCBFZHdvcnRoeSA8cGhpbC5lZHdvcnRoeUByZW5lc2FzLmNvbT4NCj4gPiA+IFJldmlld2VkLWJ5
OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gPiAtLS0NCj4gPiA+
ICAuLi4vYmluZGluZ3Mvd2F0Y2hkb2cvcmVuZXNhcyx3ZHQueWFtbCAgICAgICAgfCA2MyArKysr
KysrKysrKystLS0tLS0NCj4gLQ0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0MiBpbnNlcnRpb25z
KCspLCAyMSBkZWxldGlvbnMoLSkNCj4gPiA+DQo+ID4gPiBkaWZmIC0tZ2l0DQo+IGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3dhdGNoZG9nL3JlbmVzYXMsd2R0LnlhbWwNCj4g
PiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy93YXRjaGRvZy9yZW5lc2FzLHdk
dC55YW1sDQo+ID4gPiBpbmRleCBhOGQ3ZGRlNTI3MWIuLjY0NzM3MzQ5MjFlMyAxMDA2NDQNCj4g
PiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy93YXRjaGRvZy9yZW5l
c2FzLHdkdC55YW1sDQo+ID4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3Mvd2F0Y2hkb2cvcmVuZXNhcyx3ZHQueWFtbA0KPiA+ID4gQEAgLTMxLDYgKzMxLDExIEBAIHBy
b3BlcnRpZXM6DQo+ID4gPiAgICAgICAgICAgICAgICAtIHJlbmVzYXMscjlhMDdnMDU0LXdkdCAg
ICAjIFJaL1YyTA0KPiA+ID4gICAgICAgICAgICAtIGNvbnN0OiByZW5lc2FzLHJ6ZzJsLXdkdA0K
PiA+ID4NCj4gPiA+ICsgICAgICAtIGl0ZW1zOg0KPiA+ID4gKyAgICAgICAgICAtIGVudW06DQo+
ID4gPiArICAgICAgICAgICAgICAtIHJlbmVzYXMscjlhMDlnMDExLXdkdCAgICAjIFJaL1YyTQ0K
PiA+ID4gKyAgICAgICAgICAtIGNvbnN0OiByZW5lc2FzLHJ6djJtLXdkdCAgICAgIyBSWi9WMk0N
Cj4gPiA+ICsNCj4gPiA+ICAgICAgICAtIGl0ZW1zOg0KPiA+ID4gICAgICAgICAgICAtIGVudW06
DQo+ID4gPiAgICAgICAgICAgICAgICAtIHJlbmVzYXMscjhhNzc0Mi13ZHQgICAgICAjIFJaL0cx
SA0KPiA+ID4gQEAgLTcwLDEzICs3NSwyNyBAQCBwcm9wZXJ0aWVzOg0KPiA+ID4gICAgcmVnOg0K
PiA+ID4gICAgICBtYXhJdGVtczogMQ0KPiA+ID4NCj4gPiA+IC0gIGludGVycnVwdHM6IHRydWUN
Cj4gPiA+ICsgIGludGVycnVwdHM6DQo+ID4gPiArICAgIG1pbkl0ZW1zOiAxDQo+ID4gPiArICAg
IGl0ZW1zOg0KPiA+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IFRpbWVvdXQNCj4gPiA+ICsgICAg
ICAtIGRlc2NyaXB0aW9uOiBQYXJpdHkgZXJyb3INCj4gPiA+DQo+ID4gPiAtICBpbnRlcnJ1cHQt
bmFtZXM6IHRydWUNCj4gPiA+ICsgIGludGVycnVwdC1uYW1lczoNCj4gPg0KPiA+IFRoaXMgYWxz
byBuZWVkcyBtaW5JdGVtcw0KPiBJIGxlZnQgbWluSXRlbXMgb2ZmIGZvciBpbnRlcnJ1cHQtbmFt
ZXMgYW5kIGNsb2NrLW5hbWVzIG9uIHRoZSBiYXNpcyB0aGF0DQo+IHRoZXkgYXJlIG9ubHkgbmVl
ZGVkIGlmIHlvdSBoYXZlIG1vcmUgdGhhbiBvbmUgaW50ZXJydXB0IG9yIGNsb2NrLg0KPiANCj4g
QWZ0ZXIgYWRkaW5nIHRoZSBsaW5lcyB5b3Ugc3VnZ2VzdGVkIChtaW5JdGVtczogMSksIEkgZmlu
ZCB0aGF0DQo+ICdtYWtlIGR0YnNfY2hlY2snIHBhc3NlcyBldmVuIGlmIHRoZXJlIGFyZSBubyBp
bnRlcnJ1cHQtbmFtZXMgb3INCj4gY2xvY2stbmFtZXMgc3BlY2lmaWVkLiBJcyB0aGlzIGV4cGVj
dGVkPw0KPiANCj4gbWluSXRlbXM6IDAgbWFrZXMgbW9yZSBzZW5zZSB0byBtZSwgYnV0IGl0IGlz
IHJlcXVpcmVkIHRvIGJlIGdyZWF0ZXIgdGhhbg0KPiBvciBlcXVhbCAxDQoNCkltbWVkaWF0ZWx5
IGFmdGVyIHNlbmRpbmcgdGhpcyBJIHJlYWxpc2VkIHRoYXQgbWluSXRlbXM6IDEgaXMgY29ycmVj
dCBhcw0KaW50ZXJydXB0LW5hbWVzIGFuZCBjbG9jay1uYW1lcyBhcmUgX25vdF8gaW4gcmVxdWly
ZWQuIFNvIHdoZW4gdGhleSBhcmUNCnNwZWNpZmllZCwgdGhlIG1pbmltdW0gaXMgMS4NCg0KU29y
cnkgZm9yIHRoZSBub2lzZS4NClBoaWwNCg==
