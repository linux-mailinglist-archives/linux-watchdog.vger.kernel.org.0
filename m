Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 920012768B4
	for <lists+linux-watchdog@lfdr.de>; Thu, 24 Sep 2020 08:12:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726847AbgIXGMl (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 24 Sep 2020 02:12:41 -0400
Received: from mail-eopbgr60075.outbound.protection.outlook.com ([40.107.6.75]:25134
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726683AbgIXGMl (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 24 Sep 2020 02:12:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K7zKjJnpSibqhERF1DfsU14ia8daPvYs/t9uanXAnhctkBDm6G6eNw42lCtXW6pqo0F0dQnjqn2J7rHO7tW+aCOxbm2I/EOkUDPHeaghfdfesyk9LX0nro6BqY6qr6o/+Vph3gR4psuAL1Rmc32OATa7cjcPYPxQJHGnR2Cdabyx7upwhyANS8/3BF8ov6gWaAWnEplIxgq2j0tdUpqzVjdlkWsoScayUK9yBSvDVWADjO50kI4SZ6dyR8mKvS6yDjh4BGMPUY9/MChnpVcmQcFT2VVXSab/LTfy27y03lxncs36MGvzcaqguTZEfKDLbAGJvJ+SUCBbUFfFMWzAcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sI/JM0ikbFVtHI7WT8jfmcFLrSxutLXBake8vVvomKA=;
 b=IIwhYqMIUw1ZvIOCV0Ic0YhwgHzGncmpvYnjxu9yDFIPX4ool8yVmzdhy7fDaByH2kM6nJttjrHO6f1224/VvOy1FPtslgWLwcsHD/vebWd+yb51OoNqpVuWbs2VJI+1m8f9VXNWwYfdQyankIfIdIkrFTaN/rzGzPG1Qbj/ryvVim4JMEMrWIyiohNE93SAqaj76Kn5jRG55rG6fQuDPpyMHHZSsYCDgOGNQXmJRwok090wYLbF9XVaeJ7E9jwx+Gg22b3qj+EKACrYwQhMBbSG2HHpvYyuOMvZ9x3GwGJcIwjlUfFg7108wE+YY+ulQ3U+Y0V8i52prIXDEhh7uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sI/JM0ikbFVtHI7WT8jfmcFLrSxutLXBake8vVvomKA=;
 b=cMUzIgT+q/zTVSDwZ7Rnd92VCD7fed7zeD1V4Y+92NKZyLDfF3TKkJVXqGyYrAMn9nF/Lm40DG+7SRf029iJT3nCeeajrx0J9w7/BToUHcQtC36yyT5JIr8WWL5fapRl64Kzo6f5gy0O6qZnOVm+J5eLmSxzMyASb593Yu7MeKA=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR03MB2988.eurprd03.prod.outlook.com (2603:10a6:7:5f::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3391.11; Thu, 24 Sep 2020 06:12:33 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::a453:11f5:60d4:4c7b]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::a453:11f5:60d4:4c7b%7]) with mapi id 15.20.3391.027; Thu, 24 Sep 2020
 06:12:33 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "robh@kernel.org" <robh@kernel.org>
CC:     "linux@roeck-us.net" <linux@roeck-us.net>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>
Subject: Re: [PATCH v1 1/6] dt_bindings: mfd: Add ROHM BD9576MUF and BD9573MUF
 PMICs
Thread-Topic: [PATCH v1 1/6] dt_bindings: mfd: Add ROHM BD9576MUF and
 BD9573MUF PMICs
Thread-Index: AQHWjMjU7MMEh5w2yk6ePDUVLvRJkaluqLMAgAEysICABnZKgIABCBwA
Date:   Thu, 24 Sep 2020 06:12:33 +0000
Message-ID: <e5a5f3cb4844af421101d04bcff8534d7758c254.camel@fi.rohmeurope.com>
References: <cover.1600329307.git.matti.vaittinen@fi.rohmeurope.com>
         <434579d4cddf891f8fa0f50a152c098b113fa2fb.1600329307.git.matti.vaittinen@fi.rohmeurope.com>
         <20200918172834.GA3819336@bogus>
         <06961c1a52e7ed08b970745a64705df83bceeb31.camel@fi.rohmeurope.com>
         <CAL_JsqLj-JqnfH7eh=sR0=izK5NRBusXmwGiuDmX89cn3KA2+A@mail.gmail.com>
In-Reply-To: <CAL_JsqLj-JqnfH7eh=sR0=izK5NRBusXmwGiuDmX89cn3KA2+A@mail.gmail.com>
Reply-To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Accept-Language: fi-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none
 header.from=fi.rohmeurope.com;
x-originating-ip: [62.78.225.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 80bcc17f-fa4c-468b-ce6e-08d86050d3b8
x-ms-traffictypediagnostic: HE1PR03MB2988:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR03MB29882F5C3B24BBCC58AD321DAD390@HE1PR03MB2988.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OpVz3yFyagahAwsryXLaCF+q8vm8Dc+mOm2TbL+hKLkVHp+kwQ2ocKIawe/EpoHeE92+L5kRdLVKZ8PIazRy9mwz1UpATP4WCjNdU0NsFGxF3XhggTHTsgQDmCB74DN3ZX3ZILGcslB5BhBy3NnU2I1M/goK12JI6LBCuL16UXvO7Tx+daGuvvVN+fmBKu6Vo9BICPjhNRk45+dwD+VDBEOd7j0YPRsQ2DAnyjvswhzBlFy4xDeM6KGkwunglNMKOKsZ/Oj2YyqL9r+xThvwyj7hzGQkEglcex0KtdegdsKsHz5yKHQ7SB+D+ttdwPeO4LcCc9HmHOe0hE8ILxVFsSGZ6kl+XGKokewGEUzLFCrpnJXjQGf7/Yz3lBWbztQEVmqFYiN49Up6znsPAFXRoyiLUyk0NJuA8jp+5DsYQkgfAQQS/8H2MhDgV3vKqYxci76h8sXkUEs2FEULPc2asQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(39840400004)(346002)(396003)(366004)(54906003)(6512007)(66446008)(478600001)(8676002)(2616005)(66946007)(5660300002)(186003)(26005)(76116006)(86362001)(8936002)(53546011)(66476007)(66556008)(6916009)(71200400001)(83380400001)(4326008)(6486002)(966005)(316002)(3450700001)(6506007)(64756008)(7416002)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: yYp8mUdWYTebXnRpOB19lR07bvC64TE1GcNPM5P6hGn0G9jCVXudkm5hNh8r2H2QVO+pFBOnFn80E/wykcbkzn3uwWdH1gCUlMXQ8LsZe+YiwOjtIPsMZyOVpoMRAE1DxbnrdOshxbqbrdblcXyjhvUD62GpC4JsQJVl1S7FrXYdEmS8gbjbScOvm9MG5Kms3g/jeNgTC6HaKAR+hdkeyxlN9F6RZnSPDvsqrLoDVZxqphKNmgVey4Kj06a+jMt5dVXEEYlYnF8b6KJEoYSZFkac4bKfqwCTG8qWgbP0kcoQp7gphHU7WCymT0+drI9z8HpakozXSKqAB4+LprENg9S3vfKObmsjVKrW3BfItUSaENjCYFxl7rjElJcgxGOHGc+rAf0aHD5FM0vQulhoYptb8dgbuYj6PAsO5R70ao8yq7ddHvdRAFNFjnWjZwT5bkQK3gG8TNNxVDgJiCGEXOgNFymNSPGLlKMKuQMF+5Q15ufB9Jv+JypViJifycpz06pfLk2KUSnctUplJGKw+6n+1IxbM2TP5bgT5PIrHJGlRjCyxyAODHQVkClJC0Kj0yhWXu1qQqTxFx9Zp/DtVB0kIMukY8XP+iCwP4eWG7M4ffP0/tzI0vnjIaA+0p3CYCnrjMBB7idYFIrMR7JLVQ==
Content-Type: text/plain; charset="utf-8"
Content-ID: <4B5B74CF8DD0D740A49AAE55C22FFF33@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80bcc17f-fa4c-468b-ce6e-08d86050d3b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2020 06:12:33.7450
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4MmBAbLsZrXPEGjOEjgbaue9NHLmRm9xUpZe68T+PK/zrcjMus5ztSJJEQ3Jm9HsD6e7KeQOF5JIz07MzuDGdZ9UHT6iD2J8CAjlhuJ5KQSw+Uc3zcmBeSjuQdU5GDM3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR03MB2988
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

DQpPbiBXZWQsIDIwMjAtMDktMjMgYXQgMDg6MjcgLTA2MDAsIFJvYiBIZXJyaW5nIHdyb3RlOg0K
PiBPbiBTYXQsIFNlcCAxOSwgMjAyMCBhdCA1OjQ2IEFNIFZhaXR0aW5lbiwgTWF0dGkNCj4gPE1h
dHRpLlZhaXR0aW5lbkBmaS5yb2htZXVyb3BlLmNvbT4gd3JvdGU6DQo+ID4gVGhhbmtzIFJvYiBm
b3IgdGFraW5nIGEgbG9vayBhdCB0aGlzIQ0KPiA+IA0KPiA+IE9uIEZyaSwgMjAyMC0wOS0xOCBh
dCAxMToyOCAtMDYwMCwgUm9iIEhlcnJpbmcgd3JvdGU6DQo+ID4gPiBPbiBUaHUsIFNlcCAxNywg
MjAyMCBhdCAxMTowMTo1MkFNICswMzAwLCBNYXR0aSBWYWl0dGluZW4gd3JvdGU6DQo+ID4gPiA+
IEFkZCBiaW5kaW5ncyBmb3IgUk9ITSBCRDk1NzZNVUYgYW5kIEJEOTU3M01VRiBQTUlDcy4gVGhl
c2UNCj4gPiA+ID4gUE1JQ3MgYXJlIHByaW1hcmlseSBpbnRlbmRlZCB0byBiZSB1c2VkIHRvIHBv
d2VyIHRoZSBSLUNhcg0KPiA+ID4gPiBzZXJpZXMNCj4gPiA+ID4gcHJvY2Vzc29ycy4gVGhleSBw
cm92aWRlIDYgcG93ZXIgb3V0cHV0cywgc2FmZXR5IGZlYXR1cmVzIGFuZCBhDQo+ID4gPiA+IHdh
dGNoZG9nIHdpdGggdHdvIGZ1bmN0aW9uYWwgbW9kZXMuDQo+ID4gPiA+IA0KPiA+ID4gPiBTaWdu
ZWQtb2ZmLWJ5OiBNYXR0aSBWYWl0dGluZW4gPA0KPiA+ID4gPiBtYXR0aS52YWl0dGluZW5AZmku
cm9obWV1cm9wZS5jb20+DQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiAgLi4uL2JpbmRpbmdzL21mZC9y
b2htLGJkOTU3Ni1wbWljLnlhbWwgICAgICAgIHwgMTI5DQo+ID4gPiA+ICsrKysrKysrKysrKysr
KysrKw0KPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDEyOSBpbnNlcnRpb25zKCspDQo+ID4gPiA+
ICBjcmVhdGUgbW9kZSAxMDA2NDQNCj4gPiA+ID4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL21mZC9yb2htLGJkOTU3Ni1wbWljLnlhbWwNCj4gPiA+ID4gDQo+ID4gPiA+IGRpZmYg
LS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL3JvaG0sYmQ5NTc2
LQ0KPiA+ID4gPiBwbWljLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bWZkL3JvaG0sYmQ5NTc2LQ0KPiA+ID4gPiBwbWljLnlhbWwNCj4gPiA+ID4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQNCj4gPiA+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi5mMTdkNGQ2MjE1ODUNCj4gPiA+
ID4gLS0tIC9kZXYvbnVsbA0KPiA+ID4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbWZkL3JvaG0sYmQ5NTc2LQ0KPiA+ID4gPiBwbWljLnlhbWwNCj4gPiA+ID4gQEAg
LTAsMCArMSwxMjkgQEANCj4gPiA+ID4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0y
LjAtb25seSBPUiBCU0QtMi1DbGF1c2UNCj4gPiA+ID4gKyVZQU1MIDEuMg0KPiA+ID4gPiArLS0t
DQo+ID4gPiA+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL21mZC9yb2htLGJk
OTU3Ni1wbWljLnlhbWwjDQo+ID4gPiA+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcv
bWV0YS1zY2hlbWFzL2NvcmUueWFtbCMNCj4gPiA+ID4gKw0KPiA+ID4gPiArdGl0bGU6IFJPSE0g
QkQ5NTc2TVVGIGFuZCBCRDk1NzNNVUYgUG93ZXIgTWFuYWdlbWVudA0KPiA+ID4gPiBJbnRlZ3Jh
dGVkDQo+ID4gPiA+IENpcmN1aXQgYmluZGluZ3MNCj4gPiA+ID4gKw0KPiA+ID4gPiArbWFpbnRh
aW5lcnM6DQo+ID4gPiA+ICsgIC0gTWF0dGkgVmFpdHRpbmVuIDxtYXR0aS52YWl0dGluZW5AZmku
cm9obWV1cm9wZS5jb20+DQo+ID4gPiA+ICsNCj4gPiA+ID4gK2Rlc2NyaXB0aW9uOiB8DQo+ID4g
PiA+ICsgIEJEOTU3Nk1VRiBhbmQgQkQ5NTczTVVGIGFyZSBwb3dlciBtYW5hZ2VtZW50IElDcyBw
cmltYXJpbHkNCj4gPiA+ID4gaW50ZW5kZWQgZm9yDQo+ID4gPiA+ICsgIHBvd2VyaW5nIHRoZSBS
LUNhciBzZXJpZXMgcHJvY2Vzc29ycy4NCj4gPiA+ID4gKyAgVGhlIElDIHByb3ZpZGVzIDYgcG93
ZXIgb3V0cHV0cyB3aXRoIGNvbmZpZ3VyYWJsZSBzZXF1ZW5jaW5nDQo+ID4gPiA+IGFuZA0KPiA+
ID4gPiBzYWZldHkNCj4gPiA+ID4gKyAgbW9uaXRvcmluZy4gQSB3YXRjaGRvZyBsb2dpYyB3aXRo
IHNsb3cgcGluZy93aW5kb3dlZCBtb2Rlcw0KPiA+ID4gPiBpcw0KPiA+ID4gPiBhbHNvIGluY2x1
ZGVkLg0KPiA+ID4gPiArDQo+ID4gPiA+ICtwcm9wZXJ0aWVzOg0KPiA+ID4gPiArICBjb21wYXRp
YmxlOg0KPiA+ID4gPiArICAgIGVudW06DQo+ID4gPiA+ICsgICAgICAtIHJvaG0sYmQ5NTc2DQo+
ID4gPiA+ICsgICAgICAtIHJvaG0sYmQ5NTczDQo+ID4gPiA+ICsNCj4gPiA+ID4gKyAgcmVnOg0K
PiA+ID4gPiArICAgIGRlc2NyaXB0aW9uOg0KPiA+ID4gPiArICAgICAgSTJDIHNsYXZlIGFkZHJl
c3MuDQo+ID4gPiA+ICsgICAgbWF4SXRlbXM6IDENCj4gPiA+ID4gKw0KPiA+ID4gPiArICBpbnRl
cnJ1cHRzOg0KPiA+ID4gPiArICAgIG1heEl0ZW1zOiAxDQo+ID4gPiA+ICsNCj4gPiA+ID4gKyAg
cm9obSx2b3V0MS1lbi1sb3c6DQo+ID4gPiA+ICsgICAgZGVzY3JpcHRpb246DQo+ID4gPiA+ICsg
ICAgICBCRDk1NzYgYW5kIEJEOTU3MyBWT1VUMSByZWd1bGF0b3IgZW5hYmxlIHN0YXRlIGNhbiBi
ZQ0KPiA+ID4gPiBpbmRpdmlkdWFsbHkNCj4gPiA+ID4gKyAgICAgIGNvbnRyb2xsZWQgYnkgYSBH
UElPLiBUaGlzIGlzIGRpY3RhdGVkIGJ5IHN0YXRlIG9mDQo+ID4gPiA+IHZvdXQxLWVuDQo+ID4g
PiA+IHBpbiBkdXJpbmcNCj4gPiA+ID4gKyAgICAgIHRoZSBQTUlDIHN0YXJ0dXAuIElmIHZvdXQx
LWVuIGlzIExPVyBkdXJpbmcgUE1JQyBzdGFydHVwDQo+ID4gPiA+IHRoZW4gdGhlIFZPVVQxDQo+
ID4gPiA+ICsgICAgICBlbmFibGUgc2F0ZSBpcyBjb250cm9sbGVkIHZpYSB0aGlzIHBpbi4gU2V0
IHRoaXMNCj4gPiA+ID4gcHJvcGVydHkgaWYNCj4gPiA+ID4gdm91dDEtZW4NCj4gPiA+ID4gKyAg
ICAgIGlzIHdpcmVkIHRvIGJlIGRvd24gYXQgUE1JQyBzdGFydC11cC4NCj4gPiA+ID4gKyAgICB0
eXBlOiBib29sZWFuDQo+ID4gPiA+ICsNCj4gPiA+ID4gKyAgcm9obSx2b3V0MS1lbi1ncGlvczoN
Cj4gPiA+ID4gKyAgICBkZXNjcmlwdGlvbjoNCj4gPiA+ID4gKyAgICAgIEdQSU8gc3BlY2lmaWVy
IHRvIHNwZWNpZnkgdGhlIEdQSU8gY29ubmVjdGVkIHRvIHZvdXQxLWVuIA0KPiA+ID4gPiBmb3IN
Cj4gPiA+ID4gdm91dDEgT04vT0ZGDQo+ID4gPiA+ICsgICAgICBzdGF0ZSBjb250cm9sLg0KPiA+
ID4gPiArICAgIG1heEl0ZW1zOiAxDQo+ID4gPiA+ICsNCj4gPiA+ID4gKyAgcm9obSxkZHItc2Vs
LWxvdzoNCj4gPiA+ID4gKyAgICBkZXNjcmlwdGlvbjoNCj4gPiA+ID4gKyAgICAgIFRoZSBCRDk1
NzYgYW5kIEJEOTU3MyBvdXRwdXQgdm9sdGFnZSBmb3IgRERSIGNhbiBiZQ0KPiA+ID4gPiBzZWxl
Y3RlZA0KPiA+ID4gPiBieSBzZXR0aW5nDQo+ID4gPiA+ICsgICAgICB0aGUgZGRyLXNlbCBwaW4g
bG93IG9yIGhpZ2guIFNldCB0aGlzIHByb3BlcnR5IGlmIGRkci0NCj4gPiA+ID4gc2VsIGlzDQo+
ID4gPiA+IGdyb3VuZGVkLg0KPiA+ID4gPiArICAgIHR5cGU6IGJvb2xlYW4NCj4gPiA+ID4gKw0K
PiA+ID4gPiArICByb2htLHdhdGNoZG9nLWVuYWJsZS1ncGlvczoNCj4gPiA+ID4gKyAgICBkZXNj
cmlwdGlvbjogVGhlIEdQSU8gbGluZSB1c2VkIHRvIGVuYWJsZSB0aGUgd2F0Y2hkb2cuDQo+ID4g
PiA+ICsgICAgbWF4SXRlbXM6IDENCj4gPiA+ID4gKw0KPiA+ID4gPiArICByb2htLHdhdGNoZG9n
LXBpbmctZ3Bpb3M6DQo+ID4gPiA+ICsgICAgZGVzY3JpcHRpb246IFRoZSBHUElPIGxpbmUgdXNl
ZCB0byBwaW5nIHRoZSB3YXRjaGRvZy4NCj4gPiA+ID4gKyAgICBtYXhJdGVtczogMQ0KPiA+ID4g
PiArDQo+ID4gPiA+ICsgIGh3X21hcmdpbl9tczoNCj4gPiA+IA0KPiA+ID4gTmVlZHMgYSB2ZW5k
b3IgcHJlZml4Lg0KPiA+ID4gDQo+ID4gPiBzL18vLS8NCj4gPiA+IA0KPiA+ID4gPiArICAgIG1p
bmltdW06IDQNCj4gPiA+ID4gKyAgICBtYXhpbXVtOiA0NDE2DQo+ID4gPiA+ICsgICAgZGVzY3Jp
cHRpb246IFdhdGNob2cgdGltZW91dCBpbiBtaWxsaXNlY29uZHMNCj4gPiA+IA0KPiA+ID4gTWF5
YmUgdGhlIHdvcmRzIGluIHRoZSBkZXNjcmlwdGlvbiBzaG91bGQgYmUgaW4gdGhlIHByb3BlcnR5
IG5hbWUNCj4gPiA+IGFzDQo+ID4gPiBJIGRvbid0IHNlZSBob3cgJ2gvdyBtYXJnaW4nIHJlbGF0
ZXMgdG8gJ3dhdGNoZG9nIHRpbWVvdXQnLg0KPiA+IA0KPiA+IFRoZSBod19tYXJnaW5fbXMgaXMg
YW4gZXhpc3RpbmcgcHJvcGVydHkuIEFzIEkgd3JvdGUgdG8gR3VlbnRlcjoNCj4gPiAiaHdfbWFy
Z2luX21zIiBpcyBhbiBleGlzdGluZyBiaW5kaW5nIGZvciBzcGVjaWZ5aW5nIHRoZSBtYXhpbXVt
DQo+ID4gVE1PIGluDQo+ID4gSFcgKGlmIEkgdW5kZXJzdG9vZCBpdCBjb3JyZWN0bHkpLiAoSXQg
aXMgdXNlZCBhdCBsZWFzdCBieSB0aGUNCj4gPiBnZW5lcmlnDQo+ID4gR1BJTyB3YXRjaGRvZykg
SSB0aG91Z2h0IGl0J3MgYmV0dGVyIHRvIG5vdCBpbnZlbnQgYSBuZXcgdmVuZG9yDQo+ID4gc3Bl
Y2lmaWMgYmluZGluZyB3aGVuIHdlIGhhdmUgYSBnZW5lcmljIG9uZS4NCj4gPiANCj4gPiBodHRw
czovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92NS45LXJjMi9zb3VyY2UvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3dhdGNoZG9nL2dwaW8td2R0LnR4dA0KPiANCj4gVGhhdCBv
bmUgaXMgb2RkIGFuZCBJIGhhdmVuJ3QgZm91bmQgYW4gYWN0dWFsIHVzZXIgb2YgaXQuIEl0IHdv
dWxkDQo+IG1ha2UgbW9yZSBzZW5zZSBhcyBhIGNvbGxlY3Rpb24gb2YgcHJvcGVydGllcyBkZXZp
Y2VzIGNvdWxkIHVzZQ0KPiByYXRoZXINCj4gdGhhbiBhIHZpcnR1YWwgZGV2aWNlLg0KPiANCj4g
SSB0aGluayBJJ2QgZG8gc29tZXRoaW5nIGxpa2UgJ3dhdGNoZG9nLXBpbmctdGltZS1tc2VjJyB0
aGF0IGNhbiBiZQ0KPiBlaXRoZXIgJzxtaW4+IDxtYXg+JyBvciAnPG1heD4nLg0KDQpZb3VyIHN1
Z2dlc3Rpb24gbG9va3MgZ29vZCB0byBtZS4gSWYgd2UgaW50cm9kdWNlIHN1Y2ggdGhlbiBpdCB3
b3VsZA0KbWFrZSBzZW5zZSB0byBhZGQgaGFuZGxpbmcgZm9yIHRoaXMgaW4gR1BJTyB3YXRjaGRv
ZyB0b28uDQoNCldoYXQgSSBkbyB3b25kZXIgaXMgaG93ICJod19tYXJnaW5fbXMiIGlzIHVudXNl
ZD8gSSBzZWUgaXQgaXMgYQ0KcmVxdWlyZWQgcHJvcGVydHkgZm9yIEdQSU8gd2F0Y2hkb2cuIFRo
ZSBHUElPIFdERyBwcm9iZSBzZWVtcyB0bw0KYWN0dWFsbHkgZXJyb3Igb3V0IGlmIHJlYWRpbmcg
dGhpcyBwcm9wZXJ0eSBmYWlscyB3aXRoIGFueSBlcnJvci4gSQ0Kd291bGQgYXNzdW1lIHRoZSBH
UElPIFdERyBpcyB1c2VkIHNvbWV3aGVyZT8gSGVuY2UgSSBhbSBhIGJpdCBhZnJhaWQgb2YNCnRv
dWNoaW5nIGl0LiBCcmVha2luZyBleGlzdGluZyBzZXR1cHMgd291bGQgbm90IGJlIG5pY2UuDQoN
Ckd1ZW50ZXIgLSBob3cgZG8geW91IHNlZSB0aGlzPyBTaG91bGQgd2UgbGVhdmUgR1BJTyBXREcg
YXMgaXQgaXMsDQpjb252ZXJ0IGl0IHRvIHVzZSB0aGlzIG5ldyBiaW5kaW5nIFJvYiBzdWdnZXN0
ZWQgLSBvciBzdXBwb3J0IGJvdGggdGhlDQpvbGQgYW5kIG5ldyAoYXQgbGVhc3QgZm9yIHNvbWUg
dGltZSkgaW4gdGhlIGRyaXZlciAtIGFuZCBwb3NzaWJseSBwcmludA0KYSB3YXJuaW5nIHdoZW4g
b2xkIGlzIHVzZWQ/DQoNCkJlc3QgUmVnYXJkcw0KCU1hdHRpIFZhaXR0aW5lbg0KDQo=
