Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E56A457C4
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Jun 2019 10:41:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726490AbfFNIlZ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 14 Jun 2019 04:41:25 -0400
Received: from mail-eopbgr150095.outbound.protection.outlook.com ([40.107.15.95]:25248
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726255AbfFNIlZ (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 14 Jun 2019 04:41:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.se;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l/XnEsRw+q639kFXEt1+2HpcSnmLzlpQdK+wVyoquTg=;
 b=n1dXLHicgzlYPgru4H6Z4N3wHuZaR3vEbU8oSVZ2H9QZG8d1G5q/ktesNy/ATEP6v07fNa/5a3iLx0HNJgdKX5fcQU1SuY1bgcaqo8aAISTeLpn50Q9EnZAd/3HMHWTlUu9t9WTWfqAO9cfEdtrzssUoK2tcIhGzXyxQyHMLZN8=
Received: from VI1PR10MB2639.EURPRD10.PROD.OUTLOOK.COM (20.178.126.80) by
 VI1PR10MB2063.EURPRD10.PROD.OUTLOOK.COM (52.134.28.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.12; Fri, 14 Jun 2019 08:41:21 +0000
Received: from VI1PR10MB2639.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::8844:426d:816b:f5d5]) by VI1PR10MB2639.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::8844:426d:816b:f5d5%6]) with mapi id 15.20.1987.010; Fri, 14 Jun 2019
 08:41:20 +0000
From:   Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Esben Haabendal <esben@haabendal.dk>,
        Jerry Hoemann <jerry.hoemann@hpe.com>,
        Rasmus Villemoes <Rasmus.Villemoes@prevas.se>
Subject: Re: [PATCH v10 3/3] watchdog: make the device time out at
 open_deadline when open_timeout is used
Thread-Topic: [PATCH v10 3/3] watchdog: make the device time out at
 open_deadline when open_timeout is used
Thread-Index: AQHVG6fowaQY4GjN3k2RR2MpldVesqaQiRSAgApZeYA=
Date:   Fri, 14 Jun 2019 08:41:20 +0000
Message-ID: <56280052-9437-9813-a24e-125abb876762@prevas.dk>
References: <20190605140628.618-1-rasmus.villemoes@prevas.dk>
 <20190605140628.618-4-rasmus.villemoes@prevas.dk>
 <20190607183827.GA32475@roeck-us.net>
In-Reply-To: <20190607183827.GA32475@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR0502CA0022.eurprd05.prod.outlook.com
 (2603:10a6:3:e3::32) To VI1PR10MB2639.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:e1::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Rasmus.Villemoes@prevas.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [81.216.59.226]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e629911a-ef23-460f-ca3c-08d6f0a412f7
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:VI1PR10MB2063;
x-ms-traffictypediagnostic: VI1PR10MB2063:
x-microsoft-antispam-prvs: <VI1PR10MB20634B11852C2D47958B8B318AEE0@VI1PR10MB2063.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0068C7E410
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(396003)(346002)(136003)(366004)(39850400004)(189003)(199004)(68736007)(26005)(31686004)(2906002)(6486002)(5660300002)(54906003)(186003)(4744005)(478600001)(6436002)(8936002)(7736002)(72206003)(74482002)(8976002)(6512007)(25786009)(14454004)(229853002)(486006)(14444005)(44832011)(66556008)(64756008)(66446008)(66946007)(66476007)(6916009)(73956011)(256004)(53936002)(446003)(2616005)(476003)(11346002)(3846002)(6116002)(71190400001)(71200400001)(76176011)(316002)(296002)(6506007)(386003)(305945005)(4326008)(99286004)(81166006)(31696002)(8676002)(81156014)(102836004)(42882007)(66066001)(52116002)(36756003)(6246003)(107886003);DIR:OUT;SFP:1102;SCL:1;SRVR:VI1PR10MB2063;H:VI1PR10MB2639.EURPRD10.PROD.OUTLOOK.COM;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: prevas.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ZKnVIpAUzFX8ZV1TUQWKlpc8OGSceaDpeFh1TSwHdJieuuapGVHdCVhEjS92yztNydi+P7HRqBtLRGoV4LGWBYiibm4Qg7rlkWW1qs74jf5nVJX3/LMn2LWIlsrWsNAYun8O+lMlHnuWtvrxy8uomAkv08R4OTYZpPaxPrRRrUI9EQeIzP3R9HPJRDhVj/Lhzm0Qb+5BRGxkZvpd4tOxRSIbdaeOzEOOcpaQkZQJjCbLRsXRvgw4Z/TDkQJi0TKIRIYCjx3QoZxPBw9TYgxlDFTAQDqt7jXP7b/k2OFk1P8UTmllYsxIC82dhEgEKsjc66imLfYjEVwIrt6B0UPnX2j59P+82ku9TugDbrjeg4aN26vi9Qqcnls6aNXB5NfxyyhVWWMxtzOerXKsvQLNvsThqZHMfRvu/zyoGjnU37s=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C7FBBE264731A14A83C7DEA4737F5C7F@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: e629911a-ef23-460f-ca3c-08d6f0a412f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2019 08:41:20.5374
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rasmus.Villemoes@prevas.dk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB2063
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

T24gMDcvMDYvMjAxOSAyMC4zOCwgR3VlbnRlciBSb2VjayB3cm90ZToNCj4gT24gV2VkLCBKdW4g
MDUsIDIwMTkgYXQgMDI6MDY6NDRQTSArMDAwMCwgUmFzbXVzIFZpbGxlbW9lcyB3cm90ZToNCj4+
IFdoZW4gdGhlIHdhdGNoZG9nIGRldmljZSBpcyBub3Qgb3BlbiBieSB1c2Vyc3BhY2UsIHRoZSBr
ZXJuZWwgdGFrZXMNCj4+IGNhcmUgb2YgcGluZ2luZyBpdC4gV2hlbiB0aGUgb3Blbl90aW1lb3V0
IGZlYXR1cmUgaXMgaW4gdXNlLCB3ZSBzaG91bGQNCj4+IGVuc3VyZSB0aGF0IHRoZSBoYXJkd2Fy
ZSBmaXJlcyBjbG9zZSB0byBvcGVuX3RpbWVvdXQgc2Vjb25kcyBhZnRlciB0aGUNCj4+IGtlcm5l
bCBoYXMgYXNzdW1lZCByZXNwb25zaWJpbGl0eSBmb3IgdGhlIGRldmljZS4NCj4+DQo+PiBUbyBk
byB0aGlzLCBzaW1wbHkgcmV1c2UgdGhlIGxvZ2ljIHRoYXQgaXMgYWxyZWFkeSBpbiBwbGFjZSBm
b3INCj4+IGVuc3VyaW5nIHRoZSBzYW1lIHRoaW5nIHdoZW4gdXNlcnNwYWNlIGlzIHJlc3BvbnNp
YmxlIGZvciByZWd1bGFybHkNCj4+IHBpbmdpbmcgdGhlIGRldmljZToNCj4+DQo+PiAtIFdoZW4g
d2F0Y2hkb2dfYWN0aXZlKHdkZCksIHRoaXMgcGF0Y2ggZG9lc24ndCBjaGFuZ2UgYW55dGhpbmcu
DQo+Pg0KPj4gLSBXaGVuICF3YXRjaGRvY19hY3RpdmUod2RkKSwgdGhlICJ2aXJ0dWFsIHRpbWVv
dXQiIHNob3VsZCBiZSB0YWtlbiB0bw0KPiANCj4gcy93YXRjaGRvY19hY3RpdmUvd2F0Y2hkb2df
YWN0aXZlLw0KPiANCj4gb3RoZXJ3aXNlDQo+IA0KPiBSZXZpZXdlZC1ieTogR3VlbnRlciBSb2Vj
ayA8bGludXhAcm9lY2stdXMubmV0Pg0KDQpUaGFua3MhIFdpbSwgY2FuIHlvdSBmaXggdXAgaWYv
d2hlbiBhcHBseWluZywgb3IgZG8geW91IHByZWZlciBJIHJlc2VuZD8NCg0KUmFzbXVzDQo=
