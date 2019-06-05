Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A303B35EA0
	for <lists+linux-watchdog@lfdr.de>; Wed,  5 Jun 2019 16:06:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727883AbfFEOG4 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 5 Jun 2019 10:06:56 -0400
Received: from mail-eopbgr30099.outbound.protection.outlook.com ([40.107.3.99]:52096
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726442AbfFEOGz (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 5 Jun 2019 10:06:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.se;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ACVOhg70v0CTLXaEzDvN55EbCM307+bydDMczZZhx6Q=;
 b=AWYtaRLIX3LgFHMKrK/JvSTxDuYZ32h3OT7Rlxf4j2ekTpO+mfITR9YwnTVI+SH3gE9gKdvT8Cf2yzQTd7HAoxUDFnG3thg1I4vTyujAn8sbxmfxFjfEn5/zvn7qAo155ZNNsJ4PTXlor+PYa7WyVDKip/G0Y12FDqHdJP3bHrM=
Received: from VI1PR10MB2639.EURPRD10.PROD.OUTLOOK.COM (20.178.126.80) by
 VI1PR10MB2382.EURPRD10.PROD.OUTLOOK.COM (20.177.62.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Wed, 5 Jun 2019 14:06:40 +0000
Received: from VI1PR10MB2639.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::8844:426d:816b:f5d5]) by VI1PR10MB2639.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::8844:426d:816b:f5d5%6]) with mapi id 15.20.1965.011; Wed, 5 Jun 2019
 14:06:40 +0000
From:   Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To:     "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Jonathan Corbet <corbet@lwn.net>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Esben Haabendal <esben@haabendal.dk>,
        Jerry Hoemann <jerry.hoemann@hpe.com>,
        Rasmus Villemoes <Rasmus.Villemoes@prevas.se>
Subject: [PATCH v10 0/3] watchdog: allow setting deadline for opening
 /dev/watchdogN
Thread-Topic: [PATCH v10 0/3] watchdog: allow setting deadline for opening
 /dev/watchdogN
Thread-Index: AQHVG6flPtQuHkfnpUyBpSjztSqwZw==
Date:   Wed, 5 Jun 2019 14:06:40 +0000
Message-ID: <20190605140628.618-1-rasmus.villemoes@prevas.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR0202CA0034.eurprd02.prod.outlook.com
 (2603:10a6:3:e4::20) To VI1PR10MB2639.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:e1::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Rasmus.Villemoes@prevas.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [81.216.59.226]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f735bfee-cd42-4551-a4be-08d6e9bf081e
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:VI1PR10MB2382;
x-ms-traffictypediagnostic: VI1PR10MB2382:
x-microsoft-antispam-prvs: <VI1PR10MB2382EFAD777ACBE9F10BF2CA8A160@VI1PR10MB2382.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 00594E8DBA
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(366004)(39850400004)(346002)(396003)(136003)(189003)(199004)(6436002)(66066001)(5660300002)(52116002)(478600001)(107886003)(71200400001)(71190400001)(6486002)(74482002)(3846002)(6116002)(44832011)(72206003)(2501003)(6512007)(54906003)(486006)(2906002)(102836004)(73956011)(110136005)(8976002)(6506007)(99286004)(7736002)(386003)(53936002)(64756008)(316002)(476003)(66946007)(66556008)(81156014)(8676002)(81166006)(66446008)(66476007)(4326008)(14454004)(50226002)(25786009)(2616005)(305945005)(26005)(36756003)(68736007)(42882007)(186003)(256004)(8936002)(14444005)(1076003);DIR:OUT;SFP:1102;SCL:1;SRVR:VI1PR10MB2382;H:VI1PR10MB2639.EURPRD10.PROD.OUTLOOK.COM;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: prevas.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: LEI2nUOcTSd5ia2aOm+8StyfiYGTRnxugplWIlSMuvbZX5bXprytO8ZpVFMB307g1rUaU+tx6FTRIpMWznRHibw+fVnOBN5QxhL0I5CbBJmFdvpWdWc3LLOrNa1SG9R8zgoHrXn2ufyvqW5TEqlaxgI2DhGVnjfjSKnwasPilEMpZGtdmBG6xeN3VA6OSt6/90n0TH2vGfmXeW9P6AUPZsuGQ8WNj/y5xKo1fTcUDJaJGm9KTM+6h0Lv3FfoxBU1rZHLFfUj8wwCzmkK6mtOi/5yjnpCT7XxLZYEj6MO6vD3a/qj1frXoAEh3GxcMzp8JNb72b9+W1tNFLmObYLHiUuyhfb5pmVXq98ZS5zM7sY7jLbrEMWIyXiEJyx7ZrkBAaHhyaiGrZbauFdLQhF9YpFI075VRBzmVjMn30qRSh0=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: f735bfee-cd42-4551-a4be-08d6e9bf081e
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2019 14:06:40.7043
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rasmus.Villemoes@prevas.dk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB2382
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

SWYgYSB3YXRjaGRvZyBkcml2ZXIgdGVsbHMgdGhlIGZyYW1ld29yayB0aGF0IHRoZSBkZXZpY2Ug
aXMgcnVubmluZywNCnRoZSBmcmFtZXdvcmsgdGFrZXMgY2FyZSBvZiBmZWVkaW5nIHRoZSB3YXRj
aGRvZyB1bnRpbCB1c2Vyc3BhY2Ugb3BlbnMNCnRoZSBkZXZpY2UuIElmIHRoZSB1c2Vyc3BhY2Ug
YXBwbGljYXRpb24gd2hpY2ggaXMgc3VwcG9zZWQgdG8gZG8gdGhhdA0KbmV2ZXIgY29tZXMgdXAg
cHJvcGVybHksIHRoZSB3YXRjaGRvZyBpcyBmZWQgaW5kZWZpbml0ZWx5IGJ5IHRoZQ0Ka2VybmVs
LiBUaGlzIGNhbiBiZSBlc3BlY2lhbGx5IHByb2JsZW1hdGljIGZvciBlbWJlZGRlZCBkZXZpY2Vz
Lg0KDQpUaGUgZXhpc3RpbmcgaGFuZGxlX2Jvb3RfZW5hYmxlZCBjbWRsaW5lIHBhcmFtZXRlci9j
b25maWcgb3B0aW9uDQpwYXJ0aWFsbHkgc29sdmVzIHRoYXQsIGJ1dCB0aGF0IGlzIG9ubHkgdXNh
YmxlIGZvciB0aGUgc3Vic2V0IG9mDQpoYXJkd2FyZSB3YXRjaGRvZ3MgdGhhdCBoYXZlIChvciBj
YW4gYmUgY29uZmlndXJlZCBieSB0aGUgYm9vdGxvYWRlcg0KdG8gaGF2ZSkgYSB0aW1lb3V0IHRo
YXQgaXMgc3VmZmljaWVudCB0byBtYWtlIGl0IHJlYWxpc3RpYyBmb3INCnVzZXJzcGFjZSB0byBj
b21lIHVwLiBNYW55IGRldmljZXMgaGF2ZSB0aW1lb3V0cyBvZiBvbmx5IGEgZmV3DQpzZWNvbmRz
LCBvciBldmVuIGxlc3MsIG1ha2luZyBoYW5kbGVfYm9vdF9lbmFibGVkIGluc3VmZmljaWVudC4N
Cg0KVGhlc2UgcGF0Y2hlcyBhbGxvdyBvbmUgdG8gc2V0IGEgbWF4aW11bSB0aW1lIGZvciB3aGlj
aCB0aGUga2VybmVsDQp3aWxsIGZlZWQgdGhlIHdhdGNoZG9nLCB0aHVzIGVuc3VyaW5nIHRoYXQg
ZWl0aGVyIHVzZXJzcGFjZSBoYXMgY29tZQ0KdXAsIG9yIHRoZSBib2FyZCBnZXRzIHJlc2V0LiBU
aGlzIGFsbG93cyBmYWxsYmFjayBsb2dpYyBpbiB0aGUNCmJvb3Rsb2FkZXIgdG8gYXR0ZW1wdCBz
b21lIHJlY292ZXJ5IChmb3IgZXhhbXBsZSwgaWYgYW4gYXV0b21hdGljDQp1cGRhdGUgaXMgaW4g
cHJvZ3Jlc3MsIGl0IGNvdWxkIHJvbGwgYmFjayB0byB0aGUgcHJldmlvdXMgdmVyc2lvbikuDQoN
ClRoZSBwYXRjaGVzIGhhdmUgYmVlbiB0ZXN0ZWQgb24gYSBSYXNwYmVycnkgUGkgMiBhbmQgYSBX
YW5kYm9hcmQuDQoNCkNoYW5nZXMgaW4gdjEwOiBUaGUgb3Blbl90aW1lb3V0IG5vdyBvbmx5IGFw
cGxpZXMgdG8gdGhlIGZpcnN0IG9wZW4NCmZyb20gdXNlcnNwYWNlLiBJZiB1c2Vyc3BhY2UgbmVl
ZHMgdG8gY2xvc2UgYW5kIHJlLW9wZW4gdGhlIHdhdGNoZG9nDQpkZXZpY2UgKGUuZy4gdG8gcmUt
ZXhlYyBpdHNlbGYpLCBhbmQgd2FudHMgdGhlIGJvYXJkIHRvIHJlc2V0IGluIGNhc2UNCml0IGRv
ZXNuJ3QgY29tZSBiYWNrIHF1aWNrbHkgZW5vdWdoLCB0aGUgb3Blbl90aW1lb3V0IGNhbiBlYXNp
bHkgYmUNCmVtdWxhdGVkIGJ5IGNvbWJpbmluZyBub3dheW91dCB3aXRoIGFuIGFwcHJvcHJpYXRl
IFdESU9DX1NFVFRJTUVPVVQuDQoNCkNoYW5nZXMgaW4gdjk6IE1ha2UgdGhlIHVuaXQgc2Vjb25k
cyBpbnN0ZWFkIG9mIG1pbGxpc2Vjb25kcy4NCg0KUmFzbXVzIFZpbGxlbW9lcyAoMyk6DQogIHdh
dGNoZG9nOiBpbnRyb2R1Y2Ugd2F0Y2hkb2cub3Blbl90aW1lb3V0IGNvbW1hbmRsaW5lIHBhcmFt
ZXRlcg0KICB3YXRjaGRvZzogaW50cm9kdWNlIENPTkZJR19XQVRDSERPR19PUEVOX1RJTUVPVVQN
CiAgd2F0Y2hkb2c6IG1ha2UgdGhlIGRldmljZSB0aW1lIG91dCBhdCBvcGVuX2RlYWRsaW5lIHdo
ZW4gb3Blbl90aW1lb3V0DQogICAgaXMgdXNlZA0KDQogLi4uL3dhdGNoZG9nL3dhdGNoZG9nLXBh
cmFtZXRlcnMudHh0ICAgICAgICAgIHwgIDggKysrKw0KIGRyaXZlcnMvd2F0Y2hkb2cvS2NvbmZp
ZyAgICAgICAgICAgICAgICAgICAgICB8ICA5ICsrKysNCiBkcml2ZXJzL3dhdGNoZG9nL3dhdGNo
ZG9nX2Rldi5jICAgICAgICAgICAgICAgfCA0OCArKysrKysrKysrKysrKysrLS0tDQogMyBmaWxl
cyBjaGFuZ2VkLCA1OSBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQ0KDQotLSANCjIuMjAu
MQ0KDQo=
