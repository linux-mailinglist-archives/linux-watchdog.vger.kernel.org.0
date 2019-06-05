Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40F7D35EA8
	for <lists+linux-watchdog@lfdr.de>; Wed,  5 Jun 2019 16:07:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728323AbfFEOHD (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 5 Jun 2019 10:07:03 -0400
Received: from mail-eopbgr30099.outbound.protection.outlook.com ([40.107.3.99]:52096
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727936AbfFEOHC (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 5 Jun 2019 10:07:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.se;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vhwehZCIMQe6/ktqYy5gw8qYUa7Zw/A7ecCCCivFD3Q=;
 b=cGZP17p9ZS/cNGq+h7U3kV6DpQgvr5WoZ5KDeumW3yc1vdHgkhjH9ZkD3aJgqt7neKcXAsXVytEN7R4MFfFogY5n1wVWuCXHsVshtrzzZdXQuOc9lRhsGivIT69LSRSQ5zsDJAwOdn4QPbH8en5Zl1abirZzH7CmgGqFuGdVwao=
Received: from VI1PR10MB2639.EURPRD10.PROD.OUTLOOK.COM (20.178.126.80) by
 VI1PR10MB2382.EURPRD10.PROD.OUTLOOK.COM (20.177.62.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Wed, 5 Jun 2019 14:06:52 +0000
Received: from VI1PR10MB2639.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::8844:426d:816b:f5d5]) by VI1PR10MB2639.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::8844:426d:816b:f5d5%6]) with mapi id 15.20.1965.011; Wed, 5 Jun 2019
 14:06:52 +0000
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
Subject: [PATCH v10 3/3] watchdog: make the device time out at open_deadline
 when open_timeout is used
Thread-Topic: [PATCH v10 3/3] watchdog: make the device time out at
 open_deadline when open_timeout is used
Thread-Index: AQHVG6fowaQY4GjN3k2RR2MpldVesg==
Date:   Wed, 5 Jun 2019 14:06:44 +0000
Message-ID: <20190605140628.618-4-rasmus.villemoes@prevas.dk>
References: <20190605140628.618-1-rasmus.villemoes@prevas.dk>
In-Reply-To: <20190605140628.618-1-rasmus.villemoes@prevas.dk>
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
x-ms-office365-filtering-correlation-id: 0f27fdba-4e8c-4ca4-b417-08d6e9bf0a56
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:VI1PR10MB2382;
x-ms-traffictypediagnostic: VI1PR10MB2382:
x-microsoft-antispam-prvs: <VI1PR10MB23826AF529C4A4EEECE746178A160@VI1PR10MB2382.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 00594E8DBA
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(366004)(39850400004)(346002)(396003)(136003)(189003)(199004)(6436002)(66066001)(76176011)(5660300002)(52116002)(478600001)(107886003)(71200400001)(71190400001)(6486002)(74482002)(3846002)(6116002)(44832011)(72206003)(2501003)(6512007)(54906003)(6666004)(486006)(2906002)(102836004)(73956011)(110136005)(8976002)(6506007)(99286004)(7736002)(386003)(53936002)(64756008)(446003)(316002)(476003)(66946007)(66556008)(81156014)(8676002)(81166006)(66446008)(11346002)(66476007)(4326008)(14454004)(50226002)(25786009)(2616005)(305945005)(26005)(36756003)(68736007)(42882007)(186003)(256004)(8936002)(14444005)(1076003);DIR:OUT;SFP:1102;SCL:1;SRVR:VI1PR10MB2382;H:VI1PR10MB2639.EURPRD10.PROD.OUTLOOK.COM;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: prevas.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: aIJhPhczU9vmCCv+r9GSnDXX3EwyIPoN7uRNcUHISe6GnUG9BjwwkxSYp54InA8/GLa7iltAXjR9h5obUUynVdIxX+XGBK/1lyvWP/uh87t9z3qJTqjQatSSxUjtg/n5JQqAHaHyn3otAphR+xOW0HVjUscVSqvhOFztn2I/JbkF/Q7v9lRopnUSk24W0r9ssyBBB/7r8Vd+WMkdnIiiOdmN0A1zBodssjBzLm7DNKGP6pgVMEJOQo6vZX08uf2S6leE8XMl2hRDLzVOoZIYCp8uUq1tEGZjkD4ZJtwYV6aQsc2nVBnnwEFn4qVhD5S/1eQo3PIDM4xVThIuLA9OUiIaVhTKC8CZoXzHJRFHEaezgqQieBxe+saxpBJ6W7JihhhyREmGH2tJRqhYGjfyy91fqTRqw6wumyFnJn1S1W0=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f27fdba-4e8c-4ca4-b417-08d6e9bf0a56
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2019 14:06:44.4131
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

V2hlbiB0aGUgd2F0Y2hkb2cgZGV2aWNlIGlzIG5vdCBvcGVuIGJ5IHVzZXJzcGFjZSwgdGhlIGtl
cm5lbCB0YWtlcw0KY2FyZSBvZiBwaW5naW5nIGl0LiBXaGVuIHRoZSBvcGVuX3RpbWVvdXQgZmVh
dHVyZSBpcyBpbiB1c2UsIHdlIHNob3VsZA0KZW5zdXJlIHRoYXQgdGhlIGhhcmR3YXJlIGZpcmVz
IGNsb3NlIHRvIG9wZW5fdGltZW91dCBzZWNvbmRzIGFmdGVyIHRoZQ0Ka2VybmVsIGhhcyBhc3N1
bWVkIHJlc3BvbnNpYmlsaXR5IGZvciB0aGUgZGV2aWNlLg0KDQpUbyBkbyB0aGlzLCBzaW1wbHkg
cmV1c2UgdGhlIGxvZ2ljIHRoYXQgaXMgYWxyZWFkeSBpbiBwbGFjZSBmb3INCmVuc3VyaW5nIHRo
ZSBzYW1lIHRoaW5nIHdoZW4gdXNlcnNwYWNlIGlzIHJlc3BvbnNpYmxlIGZvciByZWd1bGFybHkN
CnBpbmdpbmcgdGhlIGRldmljZToNCg0KLSBXaGVuIHdhdGNoZG9nX2FjdGl2ZSh3ZGQpLCB0aGlz
IHBhdGNoIGRvZXNuJ3QgY2hhbmdlIGFueXRoaW5nLg0KDQotIFdoZW4gIXdhdGNoZG9jX2FjdGl2
ZSh3ZGQpLCB0aGUgInZpcnR1YWwgdGltZW91dCIgc2hvdWxkIGJlIHRha2VuIHRvDQpiZSAtPm9w
ZW5fZGVhZGxpbmUiLiBXaGVuIHRoZSBvcGVuX3RpbWVvdXQgZmVhdHVyZSBpcyBub3QgdXNlZCBv
ciB0aGUNCmRldmljZSBoYXMgYmVlbiBvcGVuZWQgYXQgbGVhc3Qgb25jZSwgLT5vcGVuX2RlYWRs
aW5lIGlzIEtUSU1FX01BWCwNCmFuZCB0aGUgYXJpdGhtZXRpYyBlbmRzIHVwIHJldHVybmluZyBr
ZWVwYWxpdmVfaW50ZXJ2YWwgYXMgd2UgdXNlZCB0by4NCg0KVGhpcyBoYXMgYmVlbiB0ZXN0ZWQg
b24gYSBXYW5kYm9hcmQgd2l0aCB2YXJpb3VzIGNvbWJpbmF0aW9ucyBvZg0Kb3Blbl90aW1lb3V0
IGFuZCB0aW1lb3V0LXNlYyBwcm9wZXJ0aWVzIGZvciB0aGUgb24tYm9hcmQgd2F0Y2hkb2cgYnkN
CmJvb3Rpbmcgd2l0aCAnaW5pdD0vYmluL3NoJywgdGltZXN0YW1waW5nIHRoZSBsaW5lcyBvbiB0
aGUgc2VyaWFsDQpjb25zb2xlLCBhbmQgY29tcGFyaW5nIHRoZSB0aW1lc3RhbXAgb2YgdGhlICdp
bXgyLXdkdCAyMGJjMDAwLndkb2c6DQp0aW1lb3V0IG5ubiBzZWMnIGxpbmUgd2l0aCB0aGUgdGlt
ZXN0YW1wIG9mIHRoZSAnVS1Cb290IFNQTCAuLi4nDQpsaW5lICh3aGljaCBhcHBlYXJzIGp1c3Qg
YWZ0ZXIgcmVzZXQpLg0KDQpTdWdnZXN0ZWQtYnk6IEd1ZW50ZXIgUm9lY2sgPGxpbnV4QHJvZWNr
LXVzLm5ldD4NClNpZ25lZC1vZmYtYnk6IFJhc211cyBWaWxsZW1vZXMgPHJhc211cy52aWxsZW1v
ZXNAcHJldmFzLmRrPg0KLS0tDQogZHJpdmVycy93YXRjaGRvZy93YXRjaGRvZ19kZXYuYyB8IDEx
ICsrKysrKy0tLS0tDQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlv
bnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvd2F0Y2hkb2cvd2F0Y2hkb2dfZGV2LmMgYi9k
cml2ZXJzL3dhdGNoZG9nL3dhdGNoZG9nX2Rldi5jDQppbmRleCAzMzRiODEwZGIyY2YuLmVkZmI4
ODQwNDRlMCAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvd2F0Y2hkb2cvd2F0Y2hkb2dfZGV2LmMNCisr
KyBiL2RyaXZlcnMvd2F0Y2hkb2cvd2F0Y2hkb2dfZGV2LmMNCkBAIC0xMzMsMTQgKzEzMywxNSBA
QCBzdGF0aWMga3RpbWVfdCB3YXRjaGRvZ19uZXh0X2tlZXBhbGl2ZShzdHJ1Y3Qgd2F0Y2hkb2df
ZGV2aWNlICp3ZGQpDQogCWt0aW1lX3QgdmlydF90aW1lb3V0Ow0KIAl1bnNpZ25lZCBpbnQgaHdf
aGVhcnRiZWF0X21zOw0KIA0KLQl2aXJ0X3RpbWVvdXQgPSBrdGltZV9hZGQod2RfZGF0YS0+bGFz
dF9rZWVwYWxpdmUsDQotCQkJCSBtc190b19rdGltZSh0aW1lb3V0X21zKSk7DQorCWlmICh3YXRj
aGRvZ19hY3RpdmUod2RkKSkNCisJCXZpcnRfdGltZW91dCA9IGt0aW1lX2FkZCh3ZF9kYXRhLT5s
YXN0X2tlZXBhbGl2ZSwNCisJCQkJCSBtc190b19rdGltZSh0aW1lb3V0X21zKSk7DQorCWVsc2UN
CisJCXZpcnRfdGltZW91dCA9IHdkX2RhdGEtPm9wZW5fZGVhZGxpbmU7DQorDQogCWh3X2hlYXJ0
YmVhdF9tcyA9IG1pbl9ub3RfemVybyh0aW1lb3V0X21zLCB3ZGQtPm1heF9od19oZWFydGJlYXRf
bXMpOw0KIAlrZWVwYWxpdmVfaW50ZXJ2YWwgPSBtc190b19rdGltZShod19oZWFydGJlYXRfbXMg
LyAyKTsNCiANCi0JaWYgKCF3YXRjaGRvZ19hY3RpdmUod2RkKSkNCi0JCXJldHVybiBrZWVwYWxp
dmVfaW50ZXJ2YWw7DQotDQogCS8qDQogCSAqIFRvIGVuc3VyZSB0aGF0IHRoZSB3YXRjaGRvZyB0
aW1lcyBvdXQgd2RkLT50aW1lb3V0IHNlY29uZHMNCiAJICogYWZ0ZXIgdGhlIG1vc3QgcmVjZW50
IHBpbmcgZnJvbSB1c2Vyc3BhY2UsIHRoZSBsYXN0DQotLSANCjIuMjAuMQ0KDQo=
