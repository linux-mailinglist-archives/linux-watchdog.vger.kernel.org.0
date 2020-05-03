Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 747F91C2A1F
	for <lists+linux-watchdog@lfdr.de>; Sun,  3 May 2020 07:33:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726901AbgECFdG (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 3 May 2020 01:33:06 -0400
Received: from mail-eopbgr70059.outbound.protection.outlook.com ([40.107.7.59]:6082
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726883AbgECFdG (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 3 May 2020 01:33:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oP4KY8v97TgkAo9VWHA/3jlwobaINvRg9ASHf6xb6+MGMExm24l6HtW2wImUzt9XmlJhM41b4Qeg/5/alaMsy3owIVgNDeRTRAaTar0iiOZ4YlcOQEvpKI2XjhektWdzFY/lSvc30J60wY7UVMCmyl+nH7814n19IxcG1xfxOxLyHqzA/LpB3TRENGMP5m+LA/VYNjUo4pltqj5AY/sfn8g1E9wUBNAkktk60vpS32BmN5YnBQCzGK5g0KXSXCDuorFzt6fwvYH6TZQ4+X/fKAPwyZV+UyuBnei6khGDcAInwcR/l9Ob9JpAwohzI991maczvXrmLuwNecIwS7gi4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=43xinI4LtjTFQAF9IQBa2+2fms1euXVvOx62HMKzlAw=;
 b=MgwN4TPgw9mp6YtPr00quIC75x37P3Hsbiw3c4C5cdEf2Jp47GJPUgHYRzXFC5W4k4JH8xQzdmzsShxdnqXXUq5eiJjcPJ1vyVGtgQkf6AdhULp+SqOMN1S4hEC5TKP2iQK+YT917BekMrX72V5uqwF4j7OYKgHu4q8wW9WRuBdBa2SsWILst7aIbkn6PYAD/Mkvky4s3weEe2jKO69PZaJra3CbVYEHAqRxB9RZdj4yJvClZ+V/RfFvJO0IZmsc352VuQ2reNlgPYeJVzT/Bt11pLFzboQLJ8MYZ4KfGDWiB5KcgAR+61TA/vkZkQMGVbzS4yG+aeHN3Zan36CQ2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=43xinI4LtjTFQAF9IQBa2+2fms1euXVvOx62HMKzlAw=;
 b=ORb5Z18w7SThIt4pZj3/PkO4BEazp0es9L+YIE7eyLCEUhj3eWROweDPALOrQNf/oRndDMJ+Idnl4wWJ3mc9357Vbf1YpY28BzXcU2qpVYGTVvj0LIqTgF5RtTg2gk45TwUnnlQLcNUQxppvuR550pcZ6u6DqDKJUpS0iRqqdZ8=
Received: from AM6PR05MB6168.eurprd05.prod.outlook.com (2603:10a6:20b:2a::21)
 by AM6PR05MB5588.eurprd05.prod.outlook.com (2603:10a6:20b:5a::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20; Sun, 3 May
 2020 05:32:58 +0000
Received: from AM6PR05MB6168.eurprd05.prod.outlook.com
 ([fe80::7ce1:9f42:460e:b1f3]) by AM6PR05MB6168.eurprd05.prod.outlook.com
 ([fe80::7ce1:9f42:460e:b1f3%5]) with mapi id 15.20.2958.029; Sun, 3 May 2020
 05:32:58 +0000
From:   Michael Shych <michaelsh@mellanox.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "andy@infradead.org" <andy@infradead.org>,
        "dvhart@infradead.org" <dvhart@infradead.org>
CC:     "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@mellanox.com>
Subject: RE: [PATCH v2 3/4] watchdog: mlx-wdt: support new watchdog type with
 longer timeout period
Thread-Topic: [PATCH v2 3/4] watchdog: mlx-wdt: support new watchdog type with
 longer timeout period
Thread-Index: AQHWHV45H/LuUIPnP0+m692CmEBDEKiQCQ0AgAXT98A=
Date:   Sun, 3 May 2020 05:32:58 +0000
Message-ID: <AM6PR05MB61684CC5C2F65DD790B80849D9A90@AM6PR05MB6168.eurprd05.prod.outlook.com>
References: <20200428130816.582-1-michaelsh@mellanox.com>
 <20200428130816.582-4-michaelsh@mellanox.com>
 <2a055ba3-0602-4e45-2155-521c9514f909@roeck-us.net>
In-Reply-To: <2a055ba3-0602-4e45-2155-521c9514f909@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=mellanox.com;
x-originating-ip: [93.173.116.239]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: fb5c8317-76df-4e29-7e32-08d7ef23705a
x-ms-traffictypediagnostic: AM6PR05MB5588:|AM6PR05MB5588:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR05MB558840CE4290CAD3E885E24BD9A90@AM6PR05MB5588.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-forefront-prvs: 0392679D18
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0uJTOmww6A+Ykgu+o41PizHtnse7E0PMSZmj416XfBRoRdxeKR0UpBHyrqbvspHsBAYu1kDX3SoWAG4mmAC6stye3V/O4eLL4kuYc7QJohUOWAD97u1iUlG3HwHzifkzZqK1NSFB80I8zKaMLnVMKlfccCGOmMcmZFeusuwhBIbno4oXonVwLFHIQ4TfYYAaJv6mi0HgUgLSFhx02S4XtRSTaUC8F9uT2fS2T4Ybe5VOmd2l5SCdXfynDTBPSxEMDMC75i5BfVIw9l1J13bcgMxAiAvWYJuK8WMf8QJ9mrfKhoOmYUVYbqBfaw5W9KabsObWHpUImNJUBkzbODMLksww2EteUmX1WyBiqcwHZfKduvJaDqUFzCBPL0+CeUC4yFbGbBiEiR2/JBMSPZlvDLNOOUT6pHz1LCz5KrNY3ziqAyN5Fm0N/4VGpN2x/ZjKNaBDVQ3/2F/S1oByVblKEcwPf459H8jud8hVloJTPmMmsuQ+YYlUEFhr21OsrCPWtRQmkwPl45B/tn68wU/N0Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR05MB6168.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(346002)(396003)(136003)(39850400004)(376002)(478600001)(5660300002)(33656002)(76116006)(66946007)(64756008)(66556008)(66476007)(71200400001)(52536014)(6506007)(53546011)(66446008)(55016002)(26005)(8936002)(186003)(8676002)(86362001)(7696005)(2906002)(316002)(9686003)(110136005)(54906003)(107886003)(4326008)(148743002)(6606295002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: LVjrJuDSahYe9cyca69X5xFYILPIP5xYQnzNObFckOggVdRiWH1dJfK2D4HREcrLiMoVG79XEcj9ILw3OiyPrkfh0TtQ8IQDsuSCWdndNT2XWnW4SVwgOI3eTbMJeXOT7CE2WRy3Eii5bNiSNY0myAyOV+gPrEaOovlet9uV1rPcxAlXenAcaRiaHbfyqSD1R88/JzqTOREd3eCuqDATAEsbcCB3bjgJIr5qOZsokOU0wbps3GlZ6g3UOwYohs8P4bG+dMWmGAma0ggbPJMheloaQH+zRIzX6ob/Kd8fS6oKakUld0tbl3LL9CDgqL+7aQGW72vDctnSDqxFnHWwuPWC5KEBiUH5RuoydAWcIaCgB4ekLGNsNLEH0xr6JkC7BV+1ZScJTu05vOC6nj/qRz+QWg2kHY6WdpOX/ZBC7n+ycGbCoSdapG78L95NDcHSxVcEgzKqZtA67unBRcGp1x39wCGTT8czGb/HfMbKbCB2Iy9QmEXmk8zrO33dApzw9eA922ZQfRCBEi8XOzjQGfbfjd436j7IqiKZHBxsQp/tVgfXx6I+f3QkMm3iRJFsB+JE+8V6Jnarj/sj7MPLcDDkymWv+J560CJkD38atbLh4JcY/NYRZO1kwx/6XkjH6kBFfOuSeI//II0xJJERqLAnBcpqxM3XH+qofheGAs2i3V/1pGvbxHvZ1Kspbo93oIDMs1jUTUEwwWO2d7kzk29pWKCSyQjTkh5Prd+IyyNZwd/BUM2hmdu/UxnNJJZSz8O3Zq81ykwNwLKj87B67DCAbZg102PUnKkY//grIgQ=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb5c8317-76df-4e29-7e32-08d7ef23705a
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2020 05:32:58.1708
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QRETiiFWz3SIUhL2ZvILFnrza1rBFH8teqdrGZXJ8vm/pjvx5W1J+GPVAwUPyvVzj/XcBF+yGAE74ngnWzFdwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR05MB5588
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR3VlbnRlciBSb2VjayA8
Z3JvZWNrN0BnbWFpbC5jb20+IE9uIEJlaGFsZiBPZiBHdWVudGVyIFJvZWNrDQo+IFNlbnQ6IFdl
ZG5lc2RheSwgQXByaWwgMjksIDIwMjAgMzozMCBQTQ0KPiBUbzogTWljaGFlbCBTaHljaCA8bWlj
aGFlbHNoQG1lbGxhbm94LmNvbT47IHdpbUBsaW51eC13YXRjaGRvZy5vcmc7DQo+IGFuZHlAaW5m
cmFkZWFkLm9yZzsgZHZoYXJ0QGluZnJhZGVhZC5vcmcNCj4gQ2M6IGxpbnV4LXdhdGNoZG9nQHZn
ZXIua2VybmVsLm9yZzsgcGxhdGZvcm0tZHJpdmVyLXg4NkB2Z2VyLmtlcm5lbC5vcmc7DQo+IFZh
ZGltIFBhc3Rlcm5hayA8dmFkaW1wQG1lbGxhbm94LmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRD
SCB2MiAzLzRdIHdhdGNoZG9nOiBtbHgtd2R0OiBzdXBwb3J0IG5ldyB3YXRjaGRvZyB0eXBlDQo+
IHdpdGggbG9uZ2VyIHRpbWVvdXQgcGVyaW9kDQo+IA0KPiBPbiA0LzI4LzIwIDY6MDggQU0sIG1p
Y2hhZWxzaEBtZWxsYW5veC5jb20gd3JvdGU6DQo+ID4gRnJvbTogTWljaGFlbCBTaHljaCA8bWlj
aGFlbHNoQG1lbGxhbm94LmNvbT4NCj4gPg0KPiA+IE5ldyBwcm9ncmFtbWFibGUgbG9naWMgZGV2
aWNlIGNhbiBoYXZlIHdhdGNoZG9nIHR5cGUgMyBpbXBsZW1lbnRhdGlvbi4NCj4gPiBJdCdzIHNh
bWUgYXMgVHlwZSAyIHdpdGggZXh0ZW5kZWQgbWF4aW11bSB0aW1lb3V0IHBlcmlvZC4NCj4gPiBN
YXhpbXVtIHRpbWVvdXQgaXMgdXAtdG8gNjU1MzUgc2VjLg0KPiA+IFR5cGUgMyBIVyB3YXRjaGRv
ZyBpbXBsZW1lbnRhdGlvbiBjYW4gZXhpc3Qgb24gYWxsIE1lbGxhbm94IHN5c3RlbXMuDQo+ID4g
SXQgaXMgZGlmZmVyZW50aWF0ZWQgYnkgV0QgY2FwYWJpbGl0eSBiaXQuDQo+ID4NCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBNaWNoYWVsIFNoeWNoIDxtaWNoYWVsc2hAbWVsbGFub3guY29tPg0KPiA+IFJl
dmlld2VkLWJ5OiBWYWRpbSBQYXN0ZXJuYWsgPHZhZGltcEBtZWxsYW5veC5jb20+DQo+ID4gLS0t
DQo+ID4gdjEtdjI6DQo+ID4gTWFrZSBjaGFuZ2VzIHBvaW50ZWQgb3V0IGJ5IEd1ZW50ZXI6DQo+
ID4gLVNpbXBsaWZ5IGJpdCBvcGVyYXRpb25zDQo+ID4gLUNvbnNpc3RlbmN5IGluIHJlZ2lzdGVy
cyBhY2Nlc3MNCj4gPiAtRG9uJ3QgY2hlY2sgaXJyZWxldmFudCByZXR1cm4gY29kZQ0KPiA+IC0t
LQ0KPiA+ICBkcml2ZXJzL3dhdGNoZG9nL21seF93ZHQuYyB8IDc1DQo+ICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDY0
IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvd2F0Y2hkb2cvbWx4X3dkdC5jIGIvZHJpdmVycy93YXRjaGRvZy9tbHhfd2R0LmMNCj4g
PiBpbmRleCAwM2I5YWM0Yjk5YWYuLjRlNzZkNGExYWY1YyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2
ZXJzL3dhdGNoZG9nL21seF93ZHQuYw0KPiA+ICsrKyBiL2RyaXZlcnMvd2F0Y2hkb2cvbWx4X3dk
dC5jDQo+ID4gQEAgLTIxLDYgKzIxLDcgQEANCj4gPiAgI2RlZmluZSBNTFhSRUdfV0RUX0NMT0NL
X1NDQUxFCQkxMDAwDQo+ID4gICNkZWZpbmUgTUxYUkVHX1dEVF9NQVhfVElNRU9VVF9UWVBFMQkz
Mg0KPiA+ICAjZGVmaW5lIE1MWFJFR19XRFRfTUFYX1RJTUVPVVRfVFlQRTIJMjU1DQo+ID4gKyNk
ZWZpbmUgTUxYUkVHX1dEVF9NQVhfVElNRU9VVF9UWVBFMwk2NTUzNQ0KPiA+ICAjZGVmaW5lIE1M
WFJFR19XRFRfTUlOX1RJTUVPVVQJCTENCj4gPiAgI2RlZmluZSBNTFhSRUdfV0RUX09QVElPTlNf
QkFTRSAoV0RJT0ZfS0VFUEFMSVZFUElORyB8DQo+IFdESU9GX01BR0lDQ0xPU0UgfCBcDQo+ID4g
IAkJCQkgV0RJT0ZfU0VUVElNRU9VVCkNCj4gPiBAQCAtNDksNiArNTAsNyBAQCBzdHJ1Y3QgbWx4
cmVnX3dkdCB7DQo+ID4gIAlpbnQgdGxlZnRfaWR4Ow0KPiA+ICAJaW50IHBpbmdfaWR4Ow0KPiA+
ICAJaW50IHJlc2V0X2lkeDsNCj4gPiArCWludCByZWdtYXBfdmFsX3N6Ow0KPiA+ICAJZW51bSBt
bHhyZWdfd2R0X3R5cGUgd2R0X3R5cGU7DQo+ID4gIH07DQo+ID4NCj4gPiBAQCAtMTExLDcgKzEx
Myw4IEBAIHN0YXRpYyBpbnQgbWx4cmVnX3dkdF9zZXRfdGltZW91dChzdHJ1Y3QNCj4gd2F0Y2hk
b2dfZGV2aWNlICp3ZGQsDQo+ID4gIAl1MzIgcmVndmFsLCBzZXRfdGltZSwgaHdfdGltZW91dDsN
Cj4gPiAgCWludCByYzsNCj4gPg0KPiA+IC0JaWYgKHdkdC0+d2R0X3R5cGUgPT0gTUxYX1dEVF9U
WVBFMSkgew0KPiA+ICsJc3dpdGNoICh3ZHQtPndkdF90eXBlKSB7DQo+ID4gKwljYXNlIE1MWF9X
RFRfVFlQRTE6DQo+ID4gIAkJcmMgPSByZWdtYXBfcmVhZCh3ZHQtPnJlZ21hcCwgcmVnX2RhdGEt
PnJlZywgJnJlZ3ZhbCk7DQo+ID4gIAkJaWYgKHJjKQ0KPiA+ICAJCQlyZXR1cm4gcmM7DQo+ID4g
QEAgLTEyMCwxNCArMTIzLDMzIEBAIHN0YXRpYyBpbnQgbWx4cmVnX3dkdF9zZXRfdGltZW91dChz
dHJ1Y3QNCj4gd2F0Y2hkb2dfZGV2aWNlICp3ZGQsDQo+ID4gIAkJcmVndmFsID0gKHJlZ3ZhbCAm
IHJlZ19kYXRhLT5tYXNrKSB8IGh3X3RpbWVvdXQ7DQo+ID4gIAkJLyogUm93bmRvd24gdG8gYWN0
dWFsIGNsb3Nlc3QgbnVtYmVyIG9mIHNlYy4gKi8NCj4gPiAgCQlzZXRfdGltZSA9IEJJVChod190
aW1lb3V0KSAvIE1MWFJFR19XRFRfQ0xPQ0tfU0NBTEU7DQo+ID4gLQl9IGVsc2Ugew0KPiA+ICsJ
CXJjID0gcmVnbWFwX3dyaXRlKHdkdC0+cmVnbWFwLCByZWdfZGF0YS0+cmVnLCByZWd2YWwpOw0K
PiA+ICsJCWJyZWFrOw0KPiA+ICsJY2FzZSBNTFhfV0RUX1RZUEUyOg0KPiA+ICsJCXNldF90aW1l
ID0gdGltZW91dDsNCj4gPiArCQlyYyA9IHJlZ21hcF93cml0ZSh3ZHQtPnJlZ21hcCwgcmVnX2Rh
dGEtPnJlZywgdGltZW91dCk7DQo+ID4gKwkJYnJlYWs7DQo+ID4gKwljYXNlIE1MWF9XRFRfVFlQ
RTM6DQo+ID4gKwkJLyogV0RfVFlQRTMgaGFzIDJCIHNldCB0aW1lIHJlZ2lzdGVyICovDQo+ID4g
IAkJc2V0X3RpbWUgPSB0aW1lb3V0Ow0KPiA+IC0JCXJlZ3ZhbCA9IHRpbWVvdXQ7DQo+ID4gKwkJ
aWYgKHdkdC0+cmVnbWFwX3ZhbF9zeiA9PSAxKSB7DQo+ID4gKwkJCXRpbWVvdXQgPSBjcHVfdG9f
bGUxNih0aW1lb3V0KTsNCj4gPiArCQkJcmVndmFsID0gdGltZW91dCAmIDB4ZmY7DQo+ID4gKwkJ
CXJjID0gcmVnbWFwX3dyaXRlKHdkdC0+cmVnbWFwLCByZWdfZGF0YS0+cmVnLCByZWd2YWwpOw0K
PiA+ICsJCQlpZiAoIXJjKSB7DQo+ID4gKwkJCQlyZWd2YWwgPSAodGltZW91dCAmIDB4ZmYwMCkg
Pj4gODsNCj4gPiArCQkJCXJjID0gcmVnbWFwX3dyaXRlKHdkdC0+cmVnbWFwLA0KPiA+ICsJCQkJ
CQlyZWdfZGF0YS0+cmVnICsgMSwgcmVndmFsKTsNCj4gPiArCQkJfQ0KPiA+ICsJCX0gZWxzZSB7
DQo+ID4gKwkJCXJjID0gcmVnbWFwX3dyaXRlKHdkdC0+cmVnbWFwLCByZWdfZGF0YS0+cmVnLA0K
PiB0aW1lb3V0KTsNCj4gPiArCQl9DQo+ID4gKwkJYnJlYWs7DQo+ID4gKwlkZWZhdWx0Og0KPiA+
ICsJCXJldHVybiAtRUlOVkFMOw0KPiA+ICAJfQ0KPiA+DQo+ID4gIAl3ZGQtPnRpbWVvdXQgPSBz
ZXRfdGltZTsNCj4gPiAtCXJjID0gcmVnbWFwX3dyaXRlKHdkdC0+cmVnbWFwLCByZWdfZGF0YS0+
cmVnLCByZWd2YWwpOw0KPiA+IC0NCj4gPiAgCWlmICghcmMpIHsNCj4gPiAgCQkvKg0KPiA+ICAJ
CSAqIFJlc3RhcnQgd2F0Y2hkb2cgd2l0aCBuZXcgdGltZW91dCBwZXJpb2QNCj4gPiBAQCAtMTQ3
LDEwICsxNjksMjYgQEAgc3RhdGljIHVuc2lnbmVkIGludCBtbHhyZWdfd2R0X2dldF90aW1lbGVm
dChzdHJ1Y3QNCj4gd2F0Y2hkb2dfZGV2aWNlICp3ZGQpDQo+ID4gIHsNCj4gPiAgCXN0cnVjdCBt
bHhyZWdfd2R0ICp3ZHQgPSB3YXRjaGRvZ19nZXRfZHJ2ZGF0YSh3ZGQpOw0KPiA+ICAJc3RydWN0
IG1seHJlZ19jb3JlX2RhdGEgKnJlZ19kYXRhID0gJndkdC0+cGRhdGEtPmRhdGFbd2R0LQ0KPiA+
dGxlZnRfaWR4XTsNCj4gPiAtCXUzMiByZWd2YWw7DQo+ID4gKwl1MzIgcmVndmFsLCBtc2IsIGxz
YjsNCj4gPiAgCWludCByYzsNCj4gPg0KPiA+IC0JcmMgPSByZWdtYXBfcmVhZCh3ZHQtPnJlZ21h
cCwgcmVnX2RhdGEtPnJlZywgJnJlZ3ZhbCk7DQo+ID4gKwlpZiAod2R0LT53ZHRfdHlwZSA9PSBN
TFhfV0RUX1RZUEUyKSB7DQo+ID4gKwkJcmMgPSByZWdtYXBfcmVhZCh3ZHQtPnJlZ21hcCwgcmVn
X2RhdGEtPnJlZywgJnJlZ3ZhbCk7DQo+ID4gKwl9IGVsc2Ugew0KPiA+ICsJCS8qIFdEX1RZUEUz
IGhhcyAyIGJ5dGUgdGltZWxlZnQgcmVnaXN0ZXIgKi8NCj4gPiArCQlpZiAod2R0LT5yZWdtYXBf
dmFsX3N6ID09IDEpIHsNCj4gPiArCQkJcmMgPSByZWdtYXBfcmVhZCh3ZHQtPnJlZ21hcCwgcmVn
X2RhdGEtPnJlZywgJmxzYik7DQo+ID4gKwkJCWlmICghcmMpIHsNCj4gPiArCQkJCXJjID0gcmVn
bWFwX3JlYWQod2R0LT5yZWdtYXAsDQo+ID4gKwkJCQkJCXJlZ19kYXRhLT5yZWcgKyAxLCAmbXNi
KTsNCj4gPiArCQkJCXJlZ3ZhbCA9IChtc2IgJiAweGZmKSA8PCA4IHwgKGxzYiAmIDB4ZmYpOw0K
PiA+ICsJCQkJcmVndmFsID0gbGUxNl90b19jcHUocmVndmFsKTsNCj4gDQo+IEkgZG9uJ3QgdGhp
bmsgbXkgY29uY2VybnMgcmVnYXJkaW5nIHRoZSB1c2Ugb2YgbGUxNl90b19jcHUoKSBoYXZlIGJl
ZW4NCj4gYWRkcmVzc2VkLCBhbmQgSSBzdGlsbCB0aGluayB0aGlzIHJlc3VsdHMgaW4gYmFkIGRh
dGEgb24gYSBiaWcgZW5kaWFuDQo+IHN5c3RlbS4NCj4gDQo+IEd1ZW50ZXINCg0KWW91IGFyZSBy
aWdodC4gVGhlc2UgYXJlIHVubmVjZXNzYXJ5IGNvbnZlcnNpb25zLiBJIHJlbW92ZWQgdGhlbSBh
cyB3ZWxsIGFzIHJlZmVyZW5jZQ0KVG8gdGhlbSBpbiB0aGUgZG9jdW1lbnQuIFJlc2VuZGluZyBw
YXRjaHNldCB2My4NCg0KPiANCj4gPiArCQkJfQ0KPiA+ICsJCX0gZWxzZSB7DQo+ID4gKwkJCXJj
ID0gcmVnbWFwX3JlYWQod2R0LT5yZWdtYXAsIHJlZ19kYXRhLT5yZWcsDQo+ICZyZWd2YWwpOw0K
PiA+ICsJCX0NCj4gPiArCX0NCj4gPiArDQo+ID4gIAkvKiBSZXR1cm4gMCB0aW1lbGVmdCBpbiBj
YXNlIG9mIGZhaWx1cmUgcmVnaXN0ZXIgcmVhZC4gKi8NCj4gPiAgCXJldHVybiByYyA9PSAwID8g
cmVndmFsIDogMDsNCj4gPiAgfQ0KPiA+IEBAIC0yMTIsMTMgKzI1MCwyMyBAQCBzdGF0aWMgdm9p
ZCBtbHhyZWdfd2R0X2NvbmZpZyhzdHJ1Y3QgbWx4cmVnX3dkdA0KPiAqd2R0LA0KPiA+ICAJCXdk
dC0+d2RkLmluZm8gPSAmbWx4cmVnX3dkdF9hdXhfaW5mbzsNCj4gPg0KPiA+ICAJd2R0LT53ZHRf
dHlwZSA9IHBkYXRhLT52ZXJzaW9uOw0KPiA+IC0JaWYgKHdkdC0+d2R0X3R5cGUgPT0gTUxYX1dE
VF9UWVBFMikgew0KPiA+IC0JCXdkdC0+d2RkLm9wcyA9ICZtbHhyZWdfd2R0X29wc190eXBlMjsN
Cj4gPiAtCQl3ZHQtPndkZC5tYXhfdGltZW91dCA9DQo+IE1MWFJFR19XRFRfTUFYX1RJTUVPVVRf
VFlQRTI7DQo+ID4gLQl9IGVsc2Ugew0KPiA+ICsJc3dpdGNoICh3ZHQtPndkdF90eXBlKSB7DQo+
ID4gKwljYXNlIE1MWF9XRFRfVFlQRTE6DQo+ID4gIAkJd2R0LT53ZGQub3BzID0gJm1seHJlZ193
ZHRfb3BzX3R5cGUxOw0KPiA+ICAJCXdkdC0+d2RkLm1heF90aW1lb3V0ID0NCj4gTUxYUkVHX1dE
VF9NQVhfVElNRU9VVF9UWVBFMTsNCj4gPiArCQlicmVhazsNCj4gPiArCWNhc2UgTUxYX1dEVF9U
WVBFMjoNCj4gPiArCQl3ZHQtPndkZC5vcHMgPSAmbWx4cmVnX3dkdF9vcHNfdHlwZTI7DQo+ID4g
KwkJd2R0LT53ZGQubWF4X3RpbWVvdXQgPQ0KPiBNTFhSRUdfV0RUX01BWF9USU1FT1VUX1RZUEUy
Ow0KPiA+ICsJCWJyZWFrOw0KPiA+ICsJY2FzZSBNTFhfV0RUX1RZUEUzOg0KPiA+ICsJCXdkdC0+
d2RkLm9wcyA9ICZtbHhyZWdfd2R0X29wc190eXBlMjsNCj4gPiArCQl3ZHQtPndkZC5tYXhfdGlt
ZW91dCA9DQo+IE1MWFJFR19XRFRfTUFYX1RJTUVPVVRfVFlQRTM7DQo+ID4gKwkJYnJlYWs7DQo+
ID4gKwlkZWZhdWx0Og0KPiA+ICsJCWJyZWFrOw0KPiA+ICAJfQ0KPiA+ICsNCj4gPiAgCXdkdC0+
d2RkLm1pbl90aW1lb3V0ID0gTUxYUkVHX1dEVF9NSU5fVElNRU9VVDsNCj4gPiAgfQ0KPiA+DQo+
ID4gQEAgLTI0OSw2ICsyOTcsMTEgQEAgc3RhdGljIGludCBtbHhyZWdfd2R0X3Byb2JlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UNCj4gKnBkZXYpDQo+ID4NCj4gPiAgCXdkdC0+d2RkLnBhcmVudCA9
IGRldjsNCj4gPiAgCXdkdC0+cmVnbWFwID0gcGRhdGEtPnJlZ21hcDsNCj4gPiArCXJjID0gcmVn
bWFwX2dldF92YWxfYnl0ZXMod2R0LT5yZWdtYXApOw0KPiA+ICsJaWYgKHJjIDwgMCkNCj4gPiAr
CQlyZXR1cm4gLUVJTlZBTDsNCj4gPiArDQo+ID4gKwl3ZHQtPnJlZ21hcF92YWxfc3ogPSByYzsN
Cj4gPiAgCW1seHJlZ193ZHRfY29uZmlnKHdkdCwgcGRhdGEpOw0KPiA+DQo+ID4gIAlpZiAoKHBk
YXRhLT5mZWF0dXJlcyAmIE1MWFJFR19DT1JFX1dEX0ZFQVRVUkVfTk9XQVlPVVQpKQ0KPiA+DQoN
Cg==
