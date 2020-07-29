Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9E3E2321A8
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Jul 2020 17:32:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726496AbgG2PcK (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 29 Jul 2020 11:32:10 -0400
Received: from mail-eopbgr70080.outbound.protection.outlook.com ([40.107.7.80]:3473
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726365AbgG2PcJ (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 29 Jul 2020 11:32:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J2jIHZrZ6NVWYE1bHcBlV1qjAz26O/8TChK5Yl9LJqmJqcAmIV/HxVxxnrR7CMbZxTeG3O2q6sLw/WxAA/F+JNrEv2czbK6vh7QwX8YtcriD0ImycQiNIXONxsHmgzt3XnopQQgeR7d6rNR0P/8JAbh74w6z4c0+xdMoAnK0EoGif7LOQCznJ1U/RIfRkK9n28DyrcnyolP/QkxtkBO9n8VYyx4yNh3/D6wEQqHBloCFTz6dlh97hSMlO+qV+4H7SxfcW6oXxawOroRWFXFQeJl/QWxPfZgdiaxNPNw/wqgHbUahdTDuRQ5MjwNb0N/+gH/lpikzoXq+FSh4mOnYUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xAg/X9HVqil32iOxGxZrNY41DvxcsKjUeFKa7mNyt94=;
 b=DKyoalLBQrXCSzl8biyvhJwpK1kHY7vXKRQgr/UKedIXJtJLO84fyk1ppAh2tnFJw69HxyN/zCv/rSVeQdjTIW2pePcpvfl5jX5yGtZrPcDD27cDiN1a5oWD7oZ3LBFUc4V79SMT/cBPEZiTuPzHR0BKvrJw7Ev3qgTkSKTslRIwdsSSsU3E6Ah+r85m4YFh+rHnRgDtS/+sA4sjRmx7uu4Tk5Hp6B12pcWFSOBN3aYPwJRn6h/ds6m9dV8P5pGytKR3/i6XT/jjHeYC/PY+FuVfg3WYg+YhZGlQpPmSotZxDau251kYPAjIFYXrbtTkydREJVqxAWiB6HOIZ4aLqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xAg/X9HVqil32iOxGxZrNY41DvxcsKjUeFKa7mNyt94=;
 b=LHsAVxrij30/lbzqP6x3q2UVATUbrZ2PpCtwWf7qhLQttHxbnItDXox32w+XVwTviLYmirtS1TKtGPRV/dFOjJv1SpkvxIU8lxNArVdQyOfInIq19qJ+zMR3qo4CRDV+Afl0dDypO0JM2mXdyIVmj2NWy9xYfhCJEpdPIoAUSU4=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (2603:10a6:8:10::18)
 by DB8PR04MB6682.eurprd04.prod.outlook.com (2603:10a6:10:10c::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Wed, 29 Jul
 2020 15:32:03 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::49f8:20ce:cf20:80b3]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::49f8:20ce:cf20:80b3%6]) with mapi id 15.20.3216.034; Wed, 29 Jul 2020
 15:32:03 +0000
From:   Anson Huang <anson.huang@nxp.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH V2 1/2] watchdog: imx7ulp: Strictly follow the sequence
 for wdog operations
Thread-Topic: [PATCH V2 1/2] watchdog: imx7ulp: Strictly follow the sequence
 for wdog operations
Thread-Index: AQHWZU9toVNXTyNlR0yNnyvd1DR7Makeq5iAgAAD5LA=
Date:   Wed, 29 Jul 2020 15:32:02 +0000
Message-ID: <DB3PR0402MB391641A2991A7651B72283D0F5700@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1595989227-24700-1-git-send-email-Anson.Huang@nxp.com>
 <a7461ad9-cc73-d38b-d1a8-c1fe49b2031c@roeck-us.net>
In-Reply-To: <a7461ad9-cc73-d38b-d1a8-c1fe49b2031c@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [183.192.23.221]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a5f5a3c5-9af1-435b-093e-08d833d48b00
x-ms-traffictypediagnostic: DB8PR04MB6682:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB8PR04MB6682F5DE1BC5291E896948C1F5700@DB8PR04MB6682.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rK4ATCIT9iVVQfcVe0q/F5/83hJCMyHPlPWdu29bEUn2JwjyR6OprHV1FEYMWFVU2kVR6xheeeBRGTp8En3DJcNNX+LvL2Ad3jn/BSastgl2ze4UcFY0k6CbkiFvecvvG/c0wsio9uYB2RX3YCs2qleRE/oCCtQlwxNJrHjLPLJmnSrx2pv4FVX//88wx762e0Ca93sHPMCcrpqHedu4Sq1GxL/hv5iuuZ93jJdnRyKEQd2c2vPfoRSe1uY0N9TcMsisFNqshQCARKoHsfm61Rj3NP7UclxwGcwhL3RWGYav35i5aryWLKUGbaY8m4/wpHYU89v9riHW09QGi8hh5g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(366004)(39860400002)(376002)(346002)(136003)(316002)(110136005)(86362001)(8676002)(4326008)(55016002)(9686003)(186003)(26005)(33656002)(71200400001)(76116006)(5660300002)(8936002)(53546011)(6506007)(2906002)(83380400001)(7696005)(64756008)(44832011)(66476007)(52536014)(66446008)(478600001)(66556008)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: GZ+/AQzqukdlPojGQcE3yDEGcu6Vndca9rLJz6DFoGgbLaaZO+eXAyJ9lMyvxz80z2Fn7umlgYLKe3Qkm9vBPqf/I4NGeocRmQ1v2ioEiwud1uV1LLe/XW1Jz/IGG4XZ5rST7ENWkYExkDJGsPMCJnnEiPrn7mI89GI/QQwwZ6p9cI5ZotdhHwUsEvf8zKiUegNwcJhOJNkzp5nTseyYTfR5IP9cGdjIo9dz7S3wS6GKMfLIiuuuU+YyFvx1tzOq0FCAEOJoebpHMoGDdJUJaqeDBraRtw9tQMYhR6nwdy27pYCld9+dyOXYxp0DJ2VnzUg3xnMqmzeVkyyiG2wkVRER5nlWW0tbZs0XZN2qaT4shB5nN/t4DXMWyhzIv0iA5PccK7NSZkmrduuCZJQPgLAVSCuGF/tPEymWn1PVvIC+cRnRPAS8aDLwpIeva9ofbJLo2qnR3lVuEMmD3emrx+PATupyqj8AOzcN+YfhW7HBgEhVLqD5874qpVdjC0GB
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0402MB3916.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5f5a3c5-9af1-435b-093e-08d833d48b00
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2020 15:32:02.9944
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ovd/jdLH+oXc/NV1awDl2Dyyn7R0oAiHkMgh0C2tVkoftNYcX2YXNPeUmfPGCgv8G450zqWNYP7bIKg9NxkvTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6682
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

SGksIEd1ZW50ZXINCg0KDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggVjIgMS8yXSB3YXRjaGRvZzog
aW14N3VscDogU3RyaWN0bHkgZm9sbG93IHRoZSBzZXF1ZW5jZQ0KPiBmb3Igd2RvZyBvcGVyYXRp
b25zDQo+IA0KPiBPbiA3LzI4LzIwIDc6MjAgUE0sIEFuc29uIEh1YW5nIHdyb3RlOg0KPiA+IEFj
Y29yZGluZyB0byByZWZlcmVuY2UgbWFudWFsLCB0aGUgaS5NWDdVTFAgV0RPRydzIG9wZXJhdGlv
bnMgc2hvdWxkDQo+ID4gZm9sbG93IGJlbG93IHNlcXVlbmNlOg0KPiA+DQo+ID4gMS4gZGlzYWJs
ZSBnbG9iYWwgaW50ZXJydXB0czsNCj4gPiAyLiB1bmxvY2sgdGhlIHdkb2cgYW5kIHdhaXQgdW5s
b2NrIGJpdCBzZXQ7IDMuIHJlY29uZmlndXJlIHRoZSB3ZG9nDQo+ID4gYW5kIHdhaXQgZm9yIHJl
Y29uZmlndXJhdGlvbiBiaXQgc2V0OyA0LiBlbmFiZWwgZ2xvYmFsIGludGVycnVwdHMuDQo+ID4N
Cj4gPiBTdHJpY3RseSBmb2xsb3cgdGhlIHJlY29tbWVuZGVkIHNlcXVlbmNlIGNhbiBtYWtlIGl0
IG1vcmUgcm9idXN0Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQW5zb24gSHVhbmcgPEFuc29u
Lkh1YW5nQG54cC5jb20+DQo+ID4gLS0tDQo+ID4gQ2hhbmdlcyBzaW5jZSBWMToNCj4gPiAJLSB1
c2UgcmVhZGxfcG9sbF90aW1lb3V0X2F0b21pYygpIGluc3RlYWQgb2YgdXNsZWVwX3Jhbmdlcygp
IHNpbmNlIElSUSBpcw0KPiBkaXNhYmxlZC4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy93YXRjaGRv
Zy9pbXg3dWxwX3dkdC5jIHwgMjkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiAg
MSBmaWxlIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL3dhdGNoZG9nL2lteDd1bHBfd2R0LmMNCj4gPiBiL2RyaXZlcnMvd2F0Y2hkb2cvaW14
N3VscF93ZHQuYyBpbmRleCA3OTkzYzhjLi43ZDJiMTJlIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZl
cnMvd2F0Y2hkb2cvaW14N3VscF93ZHQuYw0KPiA+ICsrKyBiL2RyaXZlcnMvd2F0Y2hkb2cvaW14
N3VscF93ZHQuYw0KPiA+IEBAIC01LDYgKzUsNyBAQA0KPiA+DQo+ID4gICNpbmNsdWRlIDxsaW51
eC9jbGsuaD4NCj4gPiAgI2luY2x1ZGUgPGxpbnV4L2lvLmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51
eC9pb3BvbGwuaD4NCj4gPiAgI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPg0KPiA+ICAjaW5jbHVk
ZSA8bGludXgvbW9kdWxlLmg+DQo+ID4gICNpbmNsdWRlIDxsaW51eC9vZi5oPg0KPiA+IEBAIC0z
Niw2ICszNyw3IEBADQo+ID4gICNkZWZpbmUgREVGQVVMVF9USU1FT1VUCTYwDQo+ID4gICNkZWZp
bmUgTUFYX1RJTUVPVVQJMTI4DQo+ID4gICNkZWZpbmUgV0RPR19DTE9DS19SQVRFCTEwMDANCj4g
PiArI2RlZmluZSBXRE9HX1dBSVRfVElNRU9VVAkxMDAwMA0KPiA+DQo+ID4gIHN0YXRpYyBib29s
IG5vd2F5b3V0ID0gV0FUQ0hET0dfTk9XQVlPVVQ7DQo+IG1vZHVsZV9wYXJhbShub3dheW91dCwN
Cj4gPiBib29sLCAwMDAwKTsgQEAgLTQ4LDE3ICs1MCwzMSBAQCBzdHJ1Y3QgaW14N3VscF93ZHRf
ZGV2aWNlIHsNCj4gPiAgCXN0cnVjdCBjbGsgKmNsazsNCj4gPiAgfTsNCj4gPg0KPiA+ICtzdGF0
aWMgaW5saW5lIHZvaWQgaW14N3VscF93ZHRfd2FpdCh2b2lkIF9faW9tZW0gKmJhc2UsIHUzMiBt
YXNrKSB7DQo+ID4gKwl1MzIgdmFsID0gcmVhZGwoYmFzZSArIFdET0dfQ1MpOw0KPiA+ICsNCj4g
PiArCWlmICghKHZhbCAmIG1hc2spKQ0KPiA+ICsJCVdBUk5fT04ocmVhZGxfcG9sbF90aW1lb3V0
X2F0b21pYyhiYXNlICsgV0RPR19DUywgdmFsLA0KPiA+ICsJCQkJCQkgIHZhbCAmIG1hc2ssIDAs
DQo+ID4gKwkJCQkJCSAgV0RPR19XQUlUX1RJTUVPVVQpKTsNCj4gPiArfQ0KPiA+ICsNCj4gPiAg
c3RhdGljIHZvaWQgaW14N3VscF93ZHRfZW5hYmxlKHN0cnVjdCB3YXRjaGRvZ19kZXZpY2UgKndk
b2csIGJvb2wNCj4gPiBlbmFibGUpICB7DQo+ID4gIAlzdHJ1Y3QgaW14N3VscF93ZHRfZGV2aWNl
ICp3ZHQgPSB3YXRjaGRvZ19nZXRfZHJ2ZGF0YSh3ZG9nKTsNCj4gPg0KPiA+ICAJdTMyIHZhbCA9
IHJlYWRsKHdkdC0+YmFzZSArIFdET0dfQ1MpOw0KPiA+DQo+ID4gKwlsb2NhbF9pcnFfZGlzYWJs
ZSgpOw0KPiA+ICAJd3JpdGVsKFVOTE9DSywgd2R0LT5iYXNlICsgV0RPR19DTlQpOw0KPiA+ICsJ
aW14N3VscF93ZHRfd2FpdCh3ZHQtPmJhc2UsIFdET0dfQ1NfVUxLKTsNCj4gPiAgCWlmIChlbmFi
bGUpDQo+ID4gIAkJd3JpdGVsKHZhbCB8IFdET0dfQ1NfRU4sIHdkdC0+YmFzZSArIFdET0dfQ1Mp
Ow0KPiA+ICAJZWxzZQ0KPiA+ICAJCXdyaXRlbCh2YWwgJiB+V0RPR19DU19FTiwgd2R0LT5iYXNl
ICsgV0RPR19DUyk7DQo+ID4gKwlpbXg3dWxwX3dkdF93YWl0KHdkdC0+YmFzZSwgV0RPR19DU19S
Q1MpOw0KPiA+ICsJbG9jYWxfaXJxX2VuYWJsZSgpOw0KPiA+ICB9DQo+ID4NCj4gPiAgc3RhdGlj
IGJvb2wgaW14N3VscF93ZHRfaXNfZW5hYmxlZCh2b2lkIF9faW9tZW0gKmJhc2UpIEBAIC03Miw3
DQo+ID4gKzg4LDEyIEBAIHN0YXRpYyBpbnQgaW14N3VscF93ZHRfcGluZyhzdHJ1Y3Qgd2F0Y2hk
b2dfZGV2aWNlICp3ZG9nKSAgew0KPiA+ICAJc3RydWN0IGlteDd1bHBfd2R0X2RldmljZSAqd2R0
ID0gd2F0Y2hkb2dfZ2V0X2RydmRhdGEod2RvZyk7DQo+ID4NCj4gPiArCWxvY2FsX2lycV9kaXNh
YmxlKCk7DQo+ID4gKwl3cml0ZWwoVU5MT0NLLCB3ZHQtPmJhc2UgKyBXRE9HX0NOVCk7DQo+ID4g
KwlpbXg3dWxwX3dkdF93YWl0KHdkdC0+YmFzZSwgV0RPR19DU19VTEspOw0KPiA+ICAJd3JpdGVs
KFJFRlJFU0gsIHdkdC0+YmFzZSArIFdET0dfQ05UKTsNCj4gPiArCWlteDd1bHBfd2R0X3dhaXQo
d2R0LT5iYXNlLCBXRE9HX0NTX1JDUyk7DQo+IA0KPiBQZXIgcmVmZXJlbmNlIG1hbnVhbCAoc2Vj
dGlvbiA1OS41LjQpLCB0aGUgd2FpdHMgYXJlIG5vdCByZXF1aXJlZCBoZXJlLCBhbmQNCj4gbmVp
dGhlciBpcyB0aGUgdW5sb2NrLiBGb3IgcHJhY3RpY2FsIHB1cnBvc2VzLCBkaXNhYmxpbmcgaW50
ZXJydXB0cyBpcyB1c2VsZXNzIGFzDQo+IHdlbGwgc2luY2UgdGhlIHJlZnJlc2ggd3JpdGUgb3Bl
cmF0aW9uIGlzIGp1c3QgYSBzaW5nbGUgcmVnaXN0ZXIgd3JpdGUuDQoNCkNvcnJlY3QsIHRoZSBl
eGFtcGxlIGluIHJlZmVyZW5jZSBtYW51YWwgZG9lcyBOT1QgaGF2ZSB0aGlzIGZsb3cgZm9yIHJl
ZnJlc2gsIGJ1dA0KSSBjaGVja2VkIHdpdGggb3VyIGRlc2lnbiB0ZWFtIHllc3RvZGF5LCB0aGVp
ciB2YWxpZGF0aW9uIGNvZGUgaW5kZWVkIGhhcyB0aGlzIGZsb3csDQp0aGF0IGlzIHdoeSBJIGFk
ZGVkIGl0IGZvciByZWZyZXNoIG9wZXJhdGlvbiBhcyB3ZWxsLg0KSSB3aWxsIGRvIGEgdGVzdCBv
biBvdXIgRVZLIGJvYXJkLCBhbmQgaWYgaXQgd29ya3Mgd2l0aG91dCB0aGlzIGZsb3csIEkgd2ls
bCByZW1vdmUgdGhlbQ0KSW4gVjMuDQoNClRoYW5rcywNCkFuc29uDQoNCg0KDQoNCg==
