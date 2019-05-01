Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F028610578
	for <lists+linux-watchdog@lfdr.de>; Wed,  1 May 2019 08:32:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726004AbfEAGcJ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 1 May 2019 02:32:09 -0400
Received: from mail-eopbgr20100.outbound.protection.outlook.com ([40.107.2.100]:31200
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725776AbfEAGcJ (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 1 May 2019 02:32:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.se;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zzb9vUd4d1YkAInqZkuXsKBS405lJk3GCp+bez9xrEA=;
 b=mwGfmt1HW2reSS1KLLQQfBv0f2nm+RPNXY/f4y5/3jj5b6GVFVh175QoqbYrJbkDxA1XIQg0rEOBj46UONC6mIKsSauUfOXUbRiGc3US7zrdNrJ4NkcLMAo2HcMJOstCjjs39utePIvWP6Aj35rl8Btjisa0IaTmPp/AtTrZzHg=
Received: from VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM (20.178.126.212) by
 VI1PR10MB2445.EURPRD10.PROD.OUTLOOK.COM (20.177.62.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.16; Wed, 1 May 2019 06:32:02 +0000
Received: from VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::48b8:9cff:182:f3d8]) by VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::48b8:9cff:182:f3d8%2]) with mapi id 15.20.1856.008; Wed, 1 May 2019
 06:32:02 +0000
From:   Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To:     "Jerry.Hoemann@hpe.com" <Jerry.Hoemann@hpe.com>
CC:     "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Esben Haabendal <esben@haabendal.dk>,
        "martin@hundeboll.net" <martin@hundeboll.net>,
        Rasmus Villemoes <Rasmus.Villemoes@prevas.se>
Subject: Re: [PATCH v9 0/3] watchdog: allow setting deadline for opening
 /dev/watchdogN
Thread-Topic: [PATCH v9 0/3] watchdog: allow setting deadline for opening
 /dev/watchdogN
Thread-Index: AQHUscpDmplMI0yNIE6bua5CvRNO/KZV/4GAgABsEQA=
Date:   Wed, 1 May 2019 06:32:02 +0000
Message-ID: <31d75b51-6cd6-9029-40a5-fec631e110bf@prevas.dk>
References: <20190116121432.26732-1-rasmus.villemoes@prevas.dk>
 <20190121204527.5548-1-rasmus.villemoes@prevas.dk>
 <20190501000511.GA25050@anatevka>
In-Reply-To: <20190501000511.GA25050@anatevka>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR09CA0071.eurprd09.prod.outlook.com
 (2603:10a6:7:3d::15) To VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:e3::20)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Rasmus.Villemoes@prevas.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [81.216.59.226]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 89c97c9b-046f-43b6-5648-08d6cdfeb86e
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:VI1PR10MB2445;
x-ms-traffictypediagnostic: VI1PR10MB2445:
x-microsoft-antispam-prvs: <VI1PR10MB244502683A17A360EB99954B8A3B0@VI1PR10MB2445.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 00246AB517
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(376002)(136003)(39850400004)(396003)(346002)(199004)(189003)(66446008)(2906002)(476003)(66066001)(81166006)(64756008)(81156014)(6246003)(4326008)(66556008)(107886003)(2501003)(66946007)(25786009)(6512007)(6486002)(36756003)(66476007)(6916009)(6116002)(8676002)(73956011)(53936002)(8976002)(52116002)(256004)(229853002)(8936002)(3846002)(68736007)(5640700003)(6436002)(74482002)(71190400001)(2351001)(7736002)(305945005)(42882007)(11346002)(486006)(446003)(26005)(14454004)(71200400001)(72206003)(186003)(478600001)(99286004)(31686004)(6506007)(386003)(5660300002)(102836004)(316002)(76176011)(44832011)(54906003)(31696002)(2616005);DIR:OUT;SFP:1102;SCL:1;SRVR:VI1PR10MB2445;H:VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: prevas.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 9gFa7ZrD39oH2fEoRwnEh2Z+vgAsLsMb6WWIdR6j7GSAUNQlaEvVsbyTQWaLlgz5kCNPE7cq5RdKDYF+UJfLnezHV5mSqAVIx/WbGLA1tdnX3O0zpXEiKDfmIUUKsSUfU0Imq7fSajchzPajiurlya4Gk9kE/V8NOr9dFssN0FtC66e7fNWVWG6BQtgIg58sf0BnO1TgU0wO6gRnzrOnxfr3HNrOblNlQDRbFv9ozVLvnPUUFvKGmvpZn/0DTPS4kXZIwbRm90q0b2Ui+ZRZfgPOcoolwpqg+kdhvwcGK4Icuhwm9Do39dQflHmslvtcwWOKB96693tfIE6C85XfPuaEbjP8VmHTdr5xrBfwbPasV5ZlXbE5IVzh2SgkE4kpQI+xxBkhjhA3ET7OmjK7IjnhaZw0bToC+2rEgHnf6cs=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FB086433BD17BF4893190A6BD32355D2@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 89c97c9b-046f-43b6-5648-08d6cdfeb86e
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 May 2019 06:32:02.1901
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB2445
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

T24gMDEvMDUvMjAxOSAwMi4wNSwgSmVycnkgSG9lbWFubiB3cm90ZToNCj4gT24gTW9uLCBKYW4g
MjEsIDIwMTkgYXQgMDg6NDU6MzhQTSArMDAwMCwgUmFzbXVzIFZpbGxlbW9lcyB3cm90ZToNCj4+
DQo+PiBUaGVzZSBwYXRjaGVzIGFsbG93IG9uZSB0byBzZXQgYSBtYXhpbXVtIHRpbWUgZm9yIHdo
aWNoIHRoZSBrZXJuZWwNCj4+IHdpbGwgZmVlZCB0aGUgd2F0Y2hkb2csDQo+IA0KPiBSYXNtdXMs
DQo+IA0KPiBTb3JyeSBpZiBJIG1pc3NlZCBpdCwgYnV0IGFyZSB5b3Ugc3RpbGwgbG9va2luZyBp
bnRvIGFkZGluZw0KPiB0aGlzIGZlYXR1cmU/IA0KDQpJIGFtLCBhbmQgc3RpbGwgaW50ZW5kIHRv
IGdldCBhcm91bmQgdG8gaXQgd2hlbiBJIGdldCBzb21lIGlkbGUgY3ljbGVzLg0KDQpJIHdhcyB0
aGlua2luZyBpdCBtaWdodCBhbHNvIGJlIHVzZWZ1bCB3aXRoDQo+IGtkdW1wIHdoZW4gYSB3YXRj
aGRvZyB3YXMgcnVubmluZyBpbiB0aGUgZmlyc3Qga2VybmVsLg0KPiANCj4gQWZ0ZXIgYSBwYW5p
YyBpZiBrZHVtcCBpcyBjb25maWd1cmVkLCB0aGUgc3lzdGVtIHdpbGwgYm9vdCB0aGUNCj4gY3Jh
c2gga2VybmVsLiAgSWYgYSB3YXRjaGRvZyB3YXMgcnVubmluZyBpbiB0aGUgZmlyc3Qga2VybmVs
DQo+IGl0IHdvdWxkIHN0aWxsIHJ1bm5pbmcgaW4gdGhlIGNyYXNoIGtlcm5lbCBlbnZpcm9ubWVu
dC4NCj4gDQo+IFNvbWUgb2YgdGhlIGRyaXZlcnMgb24gSFBFIHN5c3RlbXMgdGFrZSBhIG5vbi10
cml2aWFsIGFtb3VudCBvZiB0aW1lDQo+IHRvIHJlc2V0IGR1cmluZyB0aGUgY3Jhc2gga2VybmVs
IGJvb3QsIHNvIGl0IHdvdWxkIGJlIGdvb2QgdG8gaGF2ZQ0KPiB0aGUgY29yZSBwZXQgdGhlIHdh
dGNoZG9nIHVudGlsIHVzZXIgc3BhY2UgaXMgcmVhZHkuICBCdXQgYXMgdGhlDQo+IGNyYXNoIGtl
cm5lbCBlbnZpcm9ubWVudCBoYXMgaXRzIGlzc3VlcywgIHdlIHJlYWxseSBkb24ndCB3YW50DQo+
IHRoZSBjb3JlIHRvIHBpbmcgdGhlIHdhdGNoZG9nIGluZGVmaW5pdGVseS4NCg0KVGhhbmtzLCBp
dCdzIGdyZWF0IHRvIGhlYXIgdGhhdCBvdGhlcnMgd291bGQgYWxzbyBiZSBpbnRlcmVzdGVkIGlu
IHRoaXMuDQpUaGlzIHdpbGwgbW92ZSBpdCB1cCBhIGZldyBwbGFjZXMgb24gbXkgdG9kbyBsaXN0
LiBJJ2xsIHRyeSB0byByZW1lbWJlcg0KdG8gYWRkIHlvdSB0byB0aGUgY2MgbGlzdC4NCg0KVGhh
bmtzLA0KUmFzbXVzDQo=
