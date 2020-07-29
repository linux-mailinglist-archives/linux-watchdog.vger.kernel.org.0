Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF5E72318CA
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Jul 2020 06:50:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726286AbgG2EuM (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 29 Jul 2020 00:50:12 -0400
Received: from mail-eopbgr80047.outbound.protection.outlook.com ([40.107.8.47]:15105
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726203AbgG2EuL (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 29 Jul 2020 00:50:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hDXIIoCdKBYyfKhYweZT9l9bSViG0+Wq6P95t6xB42Ks4Ahvc4rzKep7eUV4LL/mr+jQ7uCKqQQApXYYU14qecPe2wyMOpUkzNdbZhlsk0GV3Wk6ui1h0X7+qEudGR+ULpnxobmT7mqJA1ln3XzkremwrqaOnnbWFLFNYxXT8qWrqmlUWjV/XIBEmdFpiyFkFHPeiaYN4kbhJqkQ+vJlLOHWe2nKlLy2l6G3QqCxOG9yWURGhYniItrijrKaadFQ6FVY/6tkQ39VKuPAKp29XykBQu8QizFchMLrdyFGxbiVeB3BzcDY2/LpgtukKUB8WQfj6/JnLgkvbqVoQVvvKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hxZV+Wz41onhGReq1QOuZS6Tommump1qJqGgy0QjZgk=;
 b=eBV2Qd+lT6TDh5rBEJnklrxXmDQbFQ/vw72g0eDZcgbvNTwvFLEUvQyQ15MQxqfb/zUXO94xVd+xFBlk0oz6GUSe2FkUZlkoVXRBYpHD611qIU3CS65McRfdkf/3OwYgpVlYJ/dIOoc+0Mh4a1jT6MSuu1b/8/UCfTlRmlYons6hDvN9Kq15vjDl8OcMuKOtvsMeta57GuDFClqPduyMvpEW2YIHUtr7oPf2+Mg6Evsm7XTI8+YRtfCKZ8z4pAq5hRFX3ZW2pFy5+vnt4xiHljul1RS01DbbCYGXVp4cfDQpLQ8zPWaq08GHC0jibErCkgwdPdB3RLb2c2J1xaXK0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hxZV+Wz41onhGReq1QOuZS6Tommump1qJqGgy0QjZgk=;
 b=Js4z7D0mGkN4dpNyJnrmhHpxB/NB9G/7AqoaPqXxm5PHEVsk2SRrrtb4EsU8DPHeDR27+8ygdzdw/ny/LIyOR/2d1GNWUrkwXVS7SNv5cRd6v/wli6vkDqf/rpUqzOlUL8Sfkmtlu1u58XRN742SeVpb8zn3ihDHmd0Ps7R7sAs=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (2603:10a6:8:10::18)
 by DB7PR04MB5468.eurprd04.prod.outlook.com (2603:10a6:10:86::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.28; Wed, 29 Jul
 2020 04:50:07 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::49f8:20ce:cf20:80b3]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::49f8:20ce:cf20:80b3%6]) with mapi id 15.20.3216.034; Wed, 29 Jul 2020
 04:50:07 +0000
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
Thread-Index: AQHWZU9toVNXTyNlR0yNnyvd1DR7Makd8woAgAAEoFA=
Date:   Wed, 29 Jul 2020 04:50:06 +0000
Message-ID: <DB3PR0402MB3916C412DE1E83A2D40B2341F5700@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1595989227-24700-1-git-send-email-Anson.Huang@nxp.com>
 <00587a78-8069-4fbd-7e02-b774d541f75a@roeck-us.net>
In-Reply-To: <00587a78-8069-4fbd-7e02-b774d541f75a@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: bae5e158-2c6a-4e0f-3018-08d8337adda9
x-ms-traffictypediagnostic: DB7PR04MB5468:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB546872336D60BC10A42381FAF5700@DB7PR04MB5468.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TkyYsLfZIFM7vJkDInfy25UF+iOWf5cEnC3Uhb640R0FVi2GadFWrqcBiDmHxL5xwufShxTiVQfVJJcHGIccPlLb+LWT5t/WyKGm9bYFwt/J4GFZYTkzGT0HTg8lAQ8CkN0DaXovSA5SfvRVYcuY73/dIYbCSEZ1PIoM7rACRE/rch6W0Kkyh6c5d0+0pud4/EfPfTZFrLTinpDHPeOHWvrmfGUVLsIkMJCmydT/fK6wTqyrUFpvtHdwMZBFJp8Mvm0FpKTusMk3aT3maVCWJxvqTBZI66WEQ1VqZa70Yoo97bhhuBFN2r7DUpAN9XbzYZfmrifqeAODnkfbE85qXg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(136003)(396003)(39860400002)(346002)(376002)(44832011)(5660300002)(8676002)(66556008)(64756008)(110136005)(86362001)(52536014)(66446008)(6506007)(53546011)(478600001)(8936002)(7696005)(55016002)(71200400001)(83380400001)(9686003)(33656002)(66946007)(26005)(66476007)(186003)(76116006)(2906002)(316002)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 1Ds0yfHbC6NsJEX8Xi8G7BvLfibDPAOXd/DGvdn25vDCejpA4/KUzdKA5DmlgEgdOSDd4YbBcyKsoarlp8nIhiiojlq/neHPk7Q+LDezOXoiC2edxMIq3WC+jRbEcS13Oj4iFGs6eWwHvCxlAl8PW5E1uSDAQiPjsfR4yJYsmSDnWTlRs9V1H3yPcZWz+iB8ObGMQEsvkIOvkHb8O9mORNcF57bOhg9abubVJsVTxnr2WDsBgzcDRvN8xxgiT02BzW/X5yRvxnWy8z+ij1eBGaxahIzmVxzsx7YyQMarEAaRTYn5gqjq0Q5CPAKWC7euArqZW7ZZPevK3cMPKbHANZFIg0ZOOL/0B/4bShL/bzAmt/FV0MrJLLGLiEmv1cEaWGAQA62q0xfcTVPkF6+E9VbVu/EQuzOl8Eqxic37LGy/X+41NC/LDSBQ7LcHOEjafpSpibQkG7OwPmzUm8nafUb0jPXWifCG5QSlx2Z0bjA=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0402MB3916.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bae5e158-2c6a-4e0f-3018-08d8337adda9
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2020 04:50:06.9675
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P8c0AsD8+iYqgT91UZDX7eLkC1cSjVyDqGi1VT/IHX5UsYUpYW6vyviKwHA/599sBC+l4XuyruuuWDwGusUB9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5468
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
DQo+ID4gKwkJCQkJCSAgV0RPR19XQUlUX1RJTUVPVVQpKTsNCj4gDQo+IEkgYW0gbm90IGEgZnJp
ZW5kIG9mIFdBUk5fT04sIGVzcGVjaWFsbHkgaW4gc2l0dWF0aW9ucyBsaWtlIHRoaXMuDQo+IFBs
ZWFzZSBleHBsYWluIHdoeSB0aGlzIGlzIG5lZWRlZCwgYW5kIHdoeSBhIHJldHVybiBvZiAtRVRJ
TUVET1VUIGlzIG5vdA0KPiBmZWFzaWJsZS4NCg0KT0ssIEkgd2lsbCB1c2UgcmV0dXJuIHZhbHVl
IG9mIC1FVElNRU9VVCBhbmQgaGFuZGxlIGl0IGluIHRoZSBjYWxsZXIuDQoNCj4gDQo+IEFsc28s
IEkgZG8gbm90IGJlbGlldmUgdGhhdCBhIDEwIG1pbGxpLXNlY29uZCB0aW1lb3V0IGlzIHdhcnJh
bnRlZC4NCj4gVGhpcyB3aWxsIG5lZWQgdG8gYmUgYmFja2VkIHVwIGJ5IHRoZSBkYXRhc2hlZXQu
DQo+IA0KDQpUaGVyZSBpcyBubyBzdWNoIGluZm8gcHJvdmlkZWQgaW4gcmVmZXJlbmNlIG1hbnVh
bCBvciBkYXRhc2hlZXQsIGJ1dCBJIGp1c3QgZGlkDQphbiBleHBlcmltZW50LCB0aGUgdW5sb2Nr
IHdpbmRvdyBpcyBvcGVuIGluIGxlc3MgdGhhbiAxdXMgYWZ0ZXIgc2VuZGluZyB1bmxvY2sgY29t
bWFuZCwNCmFuZCBPTkxZIGxhc3QgZm9yIE9OTFkgMn4zIHVzIHRoZW4gY2xvc2UsIHRoZSByZWNv
bmZpZ3VyYXRpb24gc3RhdHVzIGJpdCB3aWxsIGJlIHNldCBpbiBsZXNzIHRoYW4NCjF1cyBhZnRl
ciByZWdpc3RlciB3cml0ZS4gU28gd2hhdCBkbyB5b3UgcmVjb21tZW5kIGZvciB0aGlzIHRpbWVv
dXQgdmFsdWU/IDEwMG1TIGZvciBzYWZlPw0KDQpUaGFua3MsDQpBbnNvbg0K
