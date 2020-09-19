Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E500C270DAC
	for <lists+linux-watchdog@lfdr.de>; Sat, 19 Sep 2020 13:46:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726111AbgISLq2 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 19 Sep 2020 07:46:28 -0400
Received: from mail-eopbgr80072.outbound.protection.outlook.com ([40.107.8.72]:41758
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726097AbgISLq2 (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 19 Sep 2020 07:46:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c8QPDlBEMxf0gcz5/ICiuAOwMURl8bWdGhB3x074DsPWnbOIy0i1rqwqyeqxSp8FZxxUETR6rBt/ljgwCV/xbSXLXm7JuqTdTeR0fCUbHLDUGoAdXHfTGWY39C0kbszR3MtYuLlEKqZ3MpY7KqFakTGe6zmxEuAYK+JdDq3D9r/T8738pLeRlUKknzVysmNVyt7qgACaNfFXfai/+sw/eUp2A+dc1Q1pvmDUEhG7w+E6mSfJD3Q4Fg88X6y9/yhPO8ajpF/MQl7pEqOWhyntLUYrB85URxw5rxnz4d3PIpTQ9cjKlO3jnAJd6kWeaFEBxH/ZNWvymJ1It6m/cveOWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jow8ee1xZbl2U9fKyS5XlIFC/QjjsKEVkviMpU2UCec=;
 b=CmkDzi51Yw9Iab356C3MzgBRAKCqq+gGJi6XFXh9DXeReW09Zx4ipRykJYBSvDCzoMfqxm5B1S+18QnZsxHQ7uI9Gy6kPNyJK0aAQtakwT8MVyAhZvwz0cbjaCO4Va+HYvynPqbGef+vATArUsUc0UWp/l5RqCfDG399g0Owjxbt+t2jgTxYXMsn5jOo8lHT47l9F9e0hVj0NcmaepLdzKGqato9XQu1S8BDj/IM9c1hc0gYY3AQhsvquriQmev7qTUj3EHq4Q0v2B45FCvGemImuXrFN6c7i6ZfYILeGzRIYqXGDVT19IWp4Dzq/tCIa7TkDahw354YjYY7uSQPHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jow8ee1xZbl2U9fKyS5XlIFC/QjjsKEVkviMpU2UCec=;
 b=WaJXU+u9A5F3krJ7H01wSRI60eaNavCVo/7HEel/MtbxFGP7Ioali01EM5l5hdrvKDyAQkC+AvSpSRmlWgNkyl6JpJ3sm7WJlh2CndshLhgHxIhGl+0I8vpFBoOnmct+LYVx76OgkNVY6qMnpsr9k0d0FIek9EgXoPYhKNjoUYY=
Received: from DB6PR03MB3160.eurprd03.prod.outlook.com (2603:10a6:6:37::21) by
 DB3PR0302MB3323.eurprd03.prod.outlook.com (2603:10a6:8:a::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3391.19; Sat, 19 Sep 2020 11:46:21 +0000
Received: from DB6PR03MB3160.eurprd03.prod.outlook.com
 ([fe80::3c50:c4c8:c54e:19e3]) by DB6PR03MB3160.eurprd03.prod.outlook.com
 ([fe80::3c50:c4c8:c54e:19e3%2]) with mapi id 15.20.3391.014; Sat, 19 Sep 2020
 11:46:21 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "robh@kernel.org" <robh@kernel.org>
CC:     "linux@roeck-us.net" <linux@roeck-us.net>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
Subject: Re: [PATCH v1 1/6] dt_bindings: mfd: Add ROHM BD9576MUF and BD9573MUF
 PMICs
Thread-Topic: [PATCH v1 1/6] dt_bindings: mfd: Add ROHM BD9576MUF and
 BD9573MUF PMICs
Thread-Index: AQHWjMjU7MMEh5w2yk6ePDUVLvRJkaluqLMAgAEysIA=
Date:   Sat, 19 Sep 2020 11:46:21 +0000
Message-ID: <06961c1a52e7ed08b970745a64705df83bceeb31.camel@fi.rohmeurope.com>
References: <cover.1600329307.git.matti.vaittinen@fi.rohmeurope.com>
         <434579d4cddf891f8fa0f50a152c098b113fa2fb.1600329307.git.matti.vaittinen@fi.rohmeurope.com>
         <20200918172834.GA3819336@bogus>
In-Reply-To: <20200918172834.GA3819336@bogus>
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
x-ms-office365-filtering-correlation-id: 06414791-e695-445d-8cc0-08d85c91a144
x-ms-traffictypediagnostic: DB3PR0302MB3323:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB3PR0302MB3323AAD3908AB107695C53D4AD3C0@DB3PR0302MB3323.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3BQ8bEUUtg8y6EoFExnwjztfmltfiAelp1t/+aNcbBjAkcdwaPi3mWNHhX2XKi6FBJ7Hnlwje75x6xKoBGfjNBWGJv6GWi09gnylrOR9IQx4RxxrYzbComNjSIthy3fBMaoC/Joj7us1pcTS5xtTT7VR+znTPItBsnthACpIYOW2uwge7Acgbn8lL7VmuaEL+jCkidY1F2tQ42ll5HCIoItWw0nIF3zhOlUilSEP+8eozX161Ds0w3iT5o6ohZ1l03zHES8XJEyWhw1sHcCOzBWBL4201PbAwokSUx5dDEyXp5jTxb8IOTXsUuWWYZOVycNau2T/JPyavc2c8NrbanevbLSZlU241M1JML6ufR0U9ecERtYBbItUKn6s871U3ie4f1ZgB7V14xyQrnGSog==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR03MB3160.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(366004)(54906003)(508600001)(6506007)(2616005)(26005)(186003)(2906002)(8676002)(7416002)(3450700001)(966005)(8936002)(6486002)(4326008)(6916009)(66946007)(6512007)(91956017)(5660300002)(66446008)(64756008)(66476007)(76116006)(86362001)(66556008)(83380400001)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: DulU5LvIIysLNVnv1w4Afm6af8s0RF7PJJZ09eIWgF6UruNMc+rlmWRnRYaaKTwZ4+SW9JXN3o0MMbjySQYja0wQSHSphsRm4av+OyRGU1PTyWDHzCj2vKg/UBsdQWBbm9MacrP2By96HfAzzOmgefcN4U2/sOWTNK/snNhxp8YPndTlkaNlO+Ec9H+ZY+4plTdNzRConEMmbiLWpHQIXjTN5JuGv9eboqjQ0G0kyMQqhtQkZaQuKgcx/gNAIaw/vlh33yH7oPUEJJJcwUggJOvJEcLSpYGsbPBnNW0iup1MIn+AJwv2Qb2MSFNvorDNysHKk1L7hjcOynRstHFJsx4Hg99umFmwdAEhq6JFzMGVWcgAcjl0rp+YXO5mspLiEp3jfMXrZIHhuvzBZSv+dl6IewxKxP2TXFZtrpb3U7VbeziW6WYyVnbWinp/E/L8wpbWDsxQMk/A8tBxb/hUqT56wpibzj2JhhYoOhbjERtraWqwBKcooPaMuBOA2VSS8ubBi5C665yyfwft+xR99wpd1OF9yhrfSZ/khs6QzWulWCeii/kphbEJjQHofRBTDA82NDSWC7PDczVRnD2MOBW/RAJUXd7DUTgfCK5s5fLJGxU1MJlL92RjpSTSpMTbV8yTNRFWi284TyzX8HfqAQ==
Content-Type: text/plain; charset="utf-8"
Content-ID: <0D99DDB22241A047B1ED072B7D7458A2@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR03MB3160.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06414791-e695-445d-8cc0-08d85c91a144
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2020 11:46:21.7493
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iNrNzp3LHJ6f5gDSamwARX2Hxbl8UenCZTHBOlO4s9yA+5zBxlWWjV6rSeZRdutI0kW/wt7PxHY2gXQr4g/n8sG3lOP+NSsqgUGgkzITNMG0Iwwpvd3Exd5VJ84DEv9+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0302MB3323
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

VGhhbmtzIFJvYiBmb3IgdGFraW5nIGEgbG9vayBhdCB0aGlzIQ0KDQpPbiBGcmksIDIwMjAtMDkt
MTggYXQgMTE6MjggLTA2MDAsIFJvYiBIZXJyaW5nIHdyb3RlOg0KPiBPbiBUaHUsIFNlcCAxNywg
MjAyMCBhdCAxMTowMTo1MkFNICswMzAwLCBNYXR0aSBWYWl0dGluZW4gd3JvdGU6DQo+ID4gQWRk
IGJpbmRpbmdzIGZvciBST0hNIEJEOTU3Nk1VRiBhbmQgQkQ5NTczTVVGIFBNSUNzLiBUaGVzZQ0K
PiA+IFBNSUNzIGFyZSBwcmltYXJpbHkgaW50ZW5kZWQgdG8gYmUgdXNlZCB0byBwb3dlciB0aGUg
Ui1DYXIgc2VyaWVzDQo+ID4gcHJvY2Vzc29ycy4gVGhleSBwcm92aWRlIDYgcG93ZXIgb3V0cHV0
cywgc2FmZXR5IGZlYXR1cmVzIGFuZCBhDQo+ID4gd2F0Y2hkb2cgd2l0aCB0d28gZnVuY3Rpb25h
bCBtb2Rlcy4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aSBWYWl0dGluZW4gPG1hdHRp
LnZhaXR0aW5lbkBmaS5yb2htZXVyb3BlLmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4uL2JpbmRpbmdz
L21mZC9yb2htLGJkOTU3Ni1wbWljLnlhbWwgICAgICAgIHwgMTI5DQo+ID4gKysrKysrKysrKysr
KysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMjkgaW5zZXJ0aW9ucygrKQ0KPiA+ICBjcmVh
dGUgbW9kZSAxMDA2NDQNCj4gPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZk
L3JvaG0sYmQ5NTc2LXBtaWMueWFtbA0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL3JvaG0sYmQ5NTc2LQ0KPiA+IHBtaWMueWFtbCBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvcm9obSxiZDk1NzYtDQo+ID4g
cG1pYy55YW1sDQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAw
MDAuLmYxN2Q0ZDYyMTU4NQ0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL3JvaG0sYmQ5NTc2LXBtaWMueWFtbA0KPiA+IEBA
IC0wLDAgKzEsMTI5IEBADQo+ID4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAt
b25seSBPUiBCU0QtMi1DbGF1c2UNCj4gPiArJVlBTUwgMS4yDQo+ID4gKy0tLQ0KPiA+ICskaWQ6
IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL21mZC9yb2htLGJkOTU3Ni1wbWljLnlhbWwj
DQo+ID4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55
YW1sIw0KPiA+ICsNCj4gPiArdGl0bGU6IFJPSE0gQkQ5NTc2TVVGIGFuZCBCRDk1NzNNVUYgUG93
ZXIgTWFuYWdlbWVudCBJbnRlZ3JhdGVkDQo+ID4gQ2lyY3VpdCBiaW5kaW5ncw0KPiA+ICsNCj4g
PiArbWFpbnRhaW5lcnM6DQo+ID4gKyAgLSBNYXR0aSBWYWl0dGluZW4gPG1hdHRpLnZhaXR0aW5l
bkBmaS5yb2htZXVyb3BlLmNvbT4NCj4gPiArDQo+ID4gK2Rlc2NyaXB0aW9uOiB8DQo+ID4gKyAg
QkQ5NTc2TVVGIGFuZCBCRDk1NzNNVUYgYXJlIHBvd2VyIG1hbmFnZW1lbnQgSUNzIHByaW1hcmls
eQ0KPiA+IGludGVuZGVkIGZvcg0KPiA+ICsgIHBvd2VyaW5nIHRoZSBSLUNhciBzZXJpZXMgcHJv
Y2Vzc29ycy4NCj4gPiArICBUaGUgSUMgcHJvdmlkZXMgNiBwb3dlciBvdXRwdXRzIHdpdGggY29u
ZmlndXJhYmxlIHNlcXVlbmNpbmcgYW5kDQo+ID4gc2FmZXR5DQo+ID4gKyAgbW9uaXRvcmluZy4g
QSB3YXRjaGRvZyBsb2dpYyB3aXRoIHNsb3cgcGluZy93aW5kb3dlZCBtb2RlcyBpcw0KPiA+IGFs
c28gaW5jbHVkZWQuDQo+ID4gKw0KPiA+ICtwcm9wZXJ0aWVzOg0KPiA+ICsgIGNvbXBhdGlibGU6
DQo+ID4gKyAgICBlbnVtOg0KPiA+ICsgICAgICAtIHJvaG0sYmQ5NTc2DQo+ID4gKyAgICAgIC0g
cm9obSxiZDk1NzMNCj4gPiArDQo+ID4gKyAgcmVnOg0KPiA+ICsgICAgZGVzY3JpcHRpb246DQo+
ID4gKyAgICAgIEkyQyBzbGF2ZSBhZGRyZXNzLg0KPiA+ICsgICAgbWF4SXRlbXM6IDENCj4gPiAr
DQo+ID4gKyAgaW50ZXJydXB0czoNCj4gPiArICAgIG1heEl0ZW1zOiAxDQo+ID4gKw0KPiA+ICsg
IHJvaG0sdm91dDEtZW4tbG93Og0KPiA+ICsgICAgZGVzY3JpcHRpb246DQo+ID4gKyAgICAgIEJE
OTU3NiBhbmQgQkQ5NTczIFZPVVQxIHJlZ3VsYXRvciBlbmFibGUgc3RhdGUgY2FuIGJlDQo+ID4g
aW5kaXZpZHVhbGx5DQo+ID4gKyAgICAgIGNvbnRyb2xsZWQgYnkgYSBHUElPLiBUaGlzIGlzIGRp
Y3RhdGVkIGJ5IHN0YXRlIG9mIHZvdXQxLWVuDQo+ID4gcGluIGR1cmluZw0KPiA+ICsgICAgICB0
aGUgUE1JQyBzdGFydHVwLiBJZiB2b3V0MS1lbiBpcyBMT1cgZHVyaW5nIFBNSUMgc3RhcnR1cA0K
PiA+IHRoZW4gdGhlIFZPVVQxDQo+ID4gKyAgICAgIGVuYWJsZSBzYXRlIGlzIGNvbnRyb2xsZWQg
dmlhIHRoaXMgcGluLiBTZXQgdGhpcyBwcm9wZXJ0eSBpZg0KPiA+IHZvdXQxLWVuDQo+ID4gKyAg
ICAgIGlzIHdpcmVkIHRvIGJlIGRvd24gYXQgUE1JQyBzdGFydC11cC4NCj4gPiArICAgIHR5cGU6
IGJvb2xlYW4NCj4gPiArDQo+ID4gKyAgcm9obSx2b3V0MS1lbi1ncGlvczoNCj4gPiArICAgIGRl
c2NyaXB0aW9uOg0KPiA+ICsgICAgICBHUElPIHNwZWNpZmllciB0byBzcGVjaWZ5IHRoZSBHUElP
IGNvbm5lY3RlZCB0byB2b3V0MS1lbiBmb3INCj4gPiB2b3V0MSBPTi9PRkYNCj4gPiArICAgICAg
c3RhdGUgY29udHJvbC4NCj4gPiArICAgIG1heEl0ZW1zOiAxDQo+ID4gKw0KPiA+ICsgIHJvaG0s
ZGRyLXNlbC1sb3c6DQo+ID4gKyAgICBkZXNjcmlwdGlvbjoNCj4gPiArICAgICAgVGhlIEJEOTU3
NiBhbmQgQkQ5NTczIG91dHB1dCB2b2x0YWdlIGZvciBERFIgY2FuIGJlIHNlbGVjdGVkDQo+ID4g
Ynkgc2V0dGluZw0KPiA+ICsgICAgICB0aGUgZGRyLXNlbCBwaW4gbG93IG9yIGhpZ2guIFNldCB0
aGlzIHByb3BlcnR5IGlmIGRkci1zZWwgaXMNCj4gPiBncm91bmRlZC4NCj4gPiArICAgIHR5cGU6
IGJvb2xlYW4NCj4gPiArDQo+ID4gKyAgcm9obSx3YXRjaGRvZy1lbmFibGUtZ3Bpb3M6DQo+ID4g
KyAgICBkZXNjcmlwdGlvbjogVGhlIEdQSU8gbGluZSB1c2VkIHRvIGVuYWJsZSB0aGUgd2F0Y2hk
b2cuDQo+ID4gKyAgICBtYXhJdGVtczogMQ0KPiA+ICsNCj4gPiArICByb2htLHdhdGNoZG9nLXBp
bmctZ3Bpb3M6DQo+ID4gKyAgICBkZXNjcmlwdGlvbjogVGhlIEdQSU8gbGluZSB1c2VkIHRvIHBp
bmcgdGhlIHdhdGNoZG9nLg0KPiA+ICsgICAgbWF4SXRlbXM6IDENCj4gPiArDQo+ID4gKyAgaHdf
bWFyZ2luX21zOg0KPiANCj4gTmVlZHMgYSB2ZW5kb3IgcHJlZml4Lg0KPiANCj4gcy9fLy0vDQo+
IA0KPiA+ICsgICAgbWluaW11bTogNA0KPiA+ICsgICAgbWF4aW11bTogNDQxNg0KPiA+ICsgICAg
ZGVzY3JpcHRpb246IFdhdGNob2cgdGltZW91dCBpbiBtaWxsaXNlY29uZHMNCj4gDQo+IE1heWJl
IHRoZSB3b3JkcyBpbiB0aGUgZGVzY3JpcHRpb24gc2hvdWxkIGJlIGluIHRoZSBwcm9wZXJ0eSBu
YW1lIGFzIA0KPiBJIGRvbid0IHNlZSBob3cgJ2gvdyBtYXJnaW4nIHJlbGF0ZXMgdG8gJ3dhdGNo
ZG9nIHRpbWVvdXQnLg0KDQpUaGUgaHdfbWFyZ2luX21zIGlzIGFuIGV4aXN0aW5nIHByb3BlcnR5
LiBBcyBJIHdyb3RlIHRvIEd1ZW50ZXI6DQoiaHdfbWFyZ2luX21zIiBpcyBhbiBleGlzdGluZyBi
aW5kaW5nIGZvciBzcGVjaWZ5aW5nIHRoZSBtYXhpbXVtIFRNTyBpbg0KSFcgKGlmIEkgdW5kZXJz
dG9vZCBpdCBjb3JyZWN0bHkpLiAoSXQgaXMgdXNlZCBhdCBsZWFzdCBieSB0aGUgZ2VuZXJpZw0K
R1BJTyB3YXRjaGRvZykgSSB0aG91Z2h0IGl0J3MgYmV0dGVyIHRvIG5vdCBpbnZlbnQgYSBuZXcg
dmVuZG9yDQpzcGVjaWZpYyBiaW5kaW5nIHdoZW4gd2UgaGF2ZSBhIGdlbmVyaWMgb25lLg0KDQpo
dHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92NS45LXJjMi9zb3VyY2UvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3dhdGNoZG9nL2dwaW8td2R0LnR4dA0KDQo+IA0KPiBJ
cyB0aGlzIGEgbWF4IGFuZCBiZWxvdyBpcyB0aGUgbWluPzoNCj4gDQo+ID4gKw0KPiA+ICsgIHJv
aG0saHctbWFyZ2luLW1pbi1tczoNCj4gPiArICAgIG1pbmltdW06IDINCj4gPiArICAgIG1heGlt
dW06IDIyMA0KPiA+ICsgICAgZGVzY3JpcHRpb246DQo+ID4gKyAgICAgIFdhdGNoZG9nIG9uIHRo
ZXNlIElDcyBjYW4gYmUgY29uZmlndXJlZCBpbiBhIHdpbmRvdyBtb2RlDQo+ID4gd2hlcmUgdGhl
IHBpbmcNCj4gPiArICAgICAgbXVzdCBjb21lIHdpdGhpbiBjZXJ0YWluIHRpbWUtd2luZG93LiBF
Zy4gdG9vIHF1aWNrIHBpbmdpbmcNCj4gPiB3aWxsIGFsc28NCj4gPiArICAgICAgdHJpZ2dlciB0
aW1lb3V0LiBTcGVjaWZ5IHRoZSBtaW5pbXVtIGRlbGF5IGJldHdlZW4gcGluZ3MgaWYNCj4gPiB5
b3Ugd2lzaCB0bw0KPiA+ICsgICAgICB1c2UgdGhlIHdpbmRvdyBtb2RlLiBOb3RlLCB0aGUgbWF4
aW11bSBkZWxheSBpcyBpbnRlcm5hbGx5DQo+ID4gY29uZmlndXJlZCBhcw0KPiA+ICsgICAgICBh
IGNlcnRhaW4gbXVsdGlwbGUgb2YgdGhpcyB2YWx1ZSBzbyBtYXhpbXVtIGRlbGF5IGNhbiBiZQ0K
PiA+IG9ubHkgdXAgdG8gMTUNCj4gPiArICAgICAgdGltZXMgdGhpcyB2YWx1ZS4gRm9yIGV4YW1w
bGUgZm9yIDczIG1zIHNob3J0IHBpbmcgdmFsdWUgdGhlDQo+ID4gbWF4aW11bQ0KPiA+ICsgICAg
ICB0aW1lb3V0IHdpbGwgYmUgY2xvc2UgdG8gMSBzZWMuDQoNClllcy4gSSBkaWRuJ3QgZmluZCBl
eGlzdGluZyBwcm9wZXJ0eSBmb3IgIm1pbmltdW0gdGltZSB0byBwaW5nIFdERyINCmZyb20gZXhp
c3RpbmcgcHJvcGVydGllcy4gQW5kIEkgdGhpbmsgaXQgaXMgbm90IHNvIGNvbW1vbiB0byBoYXZl
IHN1Y2gNCiJwaW5nIHdpbmRvdyIgaW4gd2F0Y2hkb2cgSFcgdGhhdCBpdCB3b3VsZCB3YXJyYW50
IGdlbmVyaWMgbWluaW11bSB0bW8uDQpIZW5jZSB2ZW5kb3Igc3BlY2lmaWMgcHJvcGVydHkgZm9y
IG1pbmltdW0gdG1vLg0KDQpXb3VsZCB5b3Ugc3RpbGwgcHJlZmVyIG1lIHRvIGludHJvZHVjZSBh
IG5ldyB2ZW5kb3Igc3BlY2lmaWMgcHJvcGVydHkNCmZvciAibWF4IHRtbyI/DQoNCkJlc3QgUmVn
YXJkcw0KCU1hdHRpIFZhaXR0aW5lbg0K
