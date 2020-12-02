Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D51882CBF9D
	for <lists+linux-watchdog@lfdr.de>; Wed,  2 Dec 2020 15:28:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727057AbgLBO1h (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 2 Dec 2020 09:27:37 -0500
Received: from mail-eopbgr50054.outbound.protection.outlook.com ([40.107.5.54]:10372
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726071AbgLBO1g (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 2 Dec 2020 09:27:36 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b7HiLwtlxbeP8SruGqqM0wo3EfdYcy6ndJ9FMQqBgw2CWo5fRP3YibZM0KiwQxlrI73ppWwpRLBNGvR99TziJHY/CRzdDQrfVuOe8z7zhpVfM7Pes2JwzLtdc1yEK9YNrPQQynWopmCyS1kqBH36kNG7wQ1V+uA1zBnrfRjWf6yMFow/9iRkvHXHtyN2YO9fpe6OaExUegEURdk3upVcXaM0Wbooqs1TWqq1NpE5ETfDWYl/x5SFeLPIZdbSWkfRGCcw+MpyVp6F87MFUbnmpASzI2B9QSM1n4Bgla/8BNQYAtEXRAdgxoVlYUK5p1N+A+tjgLw1w8kdtAunXL3+Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NBX4WJo6y6x2m6qM4V5IE+f2UmPpnlVpPzHkrDzsmAU=;
 b=JLTIMnDmjIC58+Dc+SiP/WTPLEoInTHHIVf8fCWMhZGLkIV1NhwaQqZeYpLs9ok5ZJiKI81094FwQjOQsb9Su1S7Qp4V7xtzDNPe1al8Z75lctTKuqj4+XNmZ5BGAGK7IiqitkiVgNr1t7uY0S+kzwytRWlNpzaXXOvRVn+QZQyWywFhN1vhMbJ3xNNE37EBpuYe6AMUXVLi/dwRfIo6UeBZ04KIubCD99xXxIiOkMoBbUyk0sRv/O0soIlY1RuXFuCszmMbsduWrgHsLIeAChadIzykA86RHVA73YMbn4YbYWioLVyqlDxw6rZwbfBvX4F+i58iy5hsed8/V/ciqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NBX4WJo6y6x2m6qM4V5IE+f2UmPpnlVpPzHkrDzsmAU=;
 b=O4Vbe8Ns34Mp51QmvHAvflyfWVU2+LHJX7aAPLbI4JFQQo4pFWKeFD+Dh+Lo6CZF5dSnGOMz0YoyUMaATowiYGB9rmAF6H0ptGqvIjWDjnZJm3pNkN/6sKjjMdTZJRD2DUFE2qaA/bbKFOIbm0Sb3FHnSFxSmzDV/ugNGYanIyY=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR0301MB2316.eurprd03.prod.outlook.com (2603:10a6:3:2a::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.29; Wed, 2 Dec 2020 14:26:46 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::f1f1:eb1d:2bf5:eb87]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::f1f1:eb1d:2bf5:eb87%6]) with mapi id 15.20.3632.017; Wed, 2 Dec 2020
 14:26:46 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "lee.jones@linaro.org" <lee.jones@linaro.org>
CC:     "linux@roeck-us.net" <linux@roeck-us.net>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Subject: Re: [PATCH RESEND v6 2/4] mfd: Support ROHM BD9576MUF and BD9573MUF
Thread-Topic: [PATCH RESEND v6 2/4] mfd: Support ROHM BD9576MUF and BD9573MUF
Thread-Index: AQHWwWDHZJglj3cu602g/c6U2v2JcanbrP0AgAAT74CACBGsgIAAGO+A
Date:   Wed, 2 Dec 2020 14:26:45 +0000
Message-ID: <122f69f1f049ece573e5aed537758075adafcb8b.camel@fi.rohmeurope.com>
References: <cover.1605882179.git.matti.vaittinen@fi.rohmeurope.com>
         <cc46e329efa30c66f000ab7c97f9bbf0bc31f0f7.1605882179.git.matti.vaittinen@fi.rohmeurope.com>
         <20201127083242.GK2455276@dell>
         <6bd4abcb340bdf764fd23b685684d3f984319ed7.camel@fi.rohmeurope.com>
         <20201202125723.GK4801@dell>
In-Reply-To: <20201202125723.GK4801@dell>
Reply-To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Accept-Language: fi-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none
 header.from=fi.rohmeurope.com;
x-originating-ip: [62.78.225.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ae64215b-f469-49ec-ab97-08d896ce4c5e
x-ms-traffictypediagnostic: HE1PR0301MB2316:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR0301MB2316C7D9991616A736F64716ADF30@HE1PR0301MB2316.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vAt+5gxJ3PVkOaXO+llYZLRsgolRzCJgpo4df5IjW3zyzFCZXWaKG3CFzeWnssfgjqTDXElI9GAnElZlPtapYs1SwG3DAzDEx/TcHoH+xB7ks5X3ZJUBO8BZ+bZqaunuHDuSUG/aOzUnS3iJc2RMbZ0XA5cBGztmC0rMlAkBIMamVxiDykVWDgAhkI2N3G+h5AzATK1IDJuQbxwxNYuiHCtzhu0d71tqWWkxHjuSaeL+favlvY0lGJay3XiNbcgoUbaktnolnjskxal3KSsTSvn7aw3EErdHFRG22yUCB/3u7fNp6GNaSYur3UMI76FspWAOS5liTR2oIvNGw08WEw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(396003)(366004)(39850400004)(86362001)(6486002)(66556008)(66446008)(64756008)(66476007)(4326008)(6916009)(54906003)(71200400001)(2906002)(478600001)(26005)(76116006)(316002)(4001150100001)(66946007)(6506007)(5660300002)(6512007)(8936002)(8676002)(2616005)(186003)(3450700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?Ny9HMFl6ZDZwdzR4c1FYSk1xMmVBUUNURysxdlIySU0yZkZKSEFFTmtMVTNp?=
 =?utf-8?B?RXlXcWE4WmI1V2huY3kwc2hheER3T3hldzd3UXdaWmEzRXJDV1lDUFp3dm96?=
 =?utf-8?B?N0ZjcmdmRDVpakFxYzI5NXV1U3BJOXlWMzlDaUcwdWEySVM4MmlpMGJPU05w?=
 =?utf-8?B?eHhwWVB2QW9xdVRnZ3lFRlBaUGdIVGpRNmNXVXg2Q2pKcjdCaklIVHVWaGI1?=
 =?utf-8?B?S3ZFM29jL1pOVG5OZnFaTnA3ZTh5UzN1ODRrenBod3VyWHVaL054VHdzTTBo?=
 =?utf-8?B?dWlrOGJpZEhDMW1NeHRqaUV2TXZYTHAvTHFTSm5NMkh4dWM1OGV0SkRNdUhm?=
 =?utf-8?B?YzBWUS9XNitGN1JUdlJRWm9va3dSKzcwOWdqU2VxejNCTi9SOW05RmVLbmZS?=
 =?utf-8?B?N0x5bTU5MGtZZmZpeElPUisrWnhNOExWQVFpVnBPSFFUYXFQMEFEVStVZ1Er?=
 =?utf-8?B?WVJEWVhOQThjNldiYXI0QXpuYnpjSnlBMFQvenpHZEkzY1o2NXM0QUpmQVNP?=
 =?utf-8?B?T3ltTUlzdXdjOWNmazRWYnRiazZjNjNXdkxyTFFGa2lOVTBZQmZ0Y09JYVJt?=
 =?utf-8?B?ek8wZDlHVlpYdUM5ZnNHZGdJam5XTCtJMGRrMUxiRXU0U2VxY0orWEZKWmha?=
 =?utf-8?B?Rk5Eb1Zya1c0TEFXZlBRVCswNjB4T0VycnRFekFLb2k0Qi9aM2FvSGhvL2pN?=
 =?utf-8?B?WWhUV3BsL1NjWnFDZkFGd0MwLzBsK1lHRmx5TU8vT3JZNlFoM1ZaVVV4SG92?=
 =?utf-8?B?eWUxZkhQUDVNbGgreXR0dmhabzAvTXR5Wi9na09BbmN4Y2MxY0x5SnNrc2lw?=
 =?utf-8?B?eElPOGVPblhCQk50S1JwT3ZsYzMrbS91SFppakFMcHp0QS9IYUJBZWtCSTJS?=
 =?utf-8?B?aHh4S1FDWm5SRFhLMkU3a1ExMVg4WnhNTW84bHRTaUZwa256L29vTUZ5YjFp?=
 =?utf-8?B?dHpiWUNmQW1DU2RRa1lRaHloQnptSGN4M2x5a0RYWGZYdWJkQ1RxMnVXell3?=
 =?utf-8?B?by9idjVCaWNFdnoxbkNlRUVXU2d2b3Fma1YzcDc2czE0L0hXOW5zbUs1UnYw?=
 =?utf-8?B?Z09pRXVjelBIY0VWVlJzdEs3akdqNXZTdHFXc0N6ekNGdldQQWw0dk41dHVk?=
 =?utf-8?B?RytmOWxyY1RrbjZWZXFXQktlbDNQR2grRWwxNFRhUWF5MU81MHlldXFWVWRU?=
 =?utf-8?B?Qkp2L1doSGNmWXZYdzR6TldEUnV1cEY2YjE0WEkyd0lGYlU2SE84UHlldUZs?=
 =?utf-8?B?KzQvbitOR0Nkd1dVVlBXTzRaUm5KWmdJMWtxalZZRjZkeGlRN081eXBCSFBZ?=
 =?utf-8?Q?NIQjR3RRS/eVI++xkvGJ8tryRi49D0C0Ti?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <03BC3FB49E987E44ABB004812C6FDBB6@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae64215b-f469-49ec-ab97-08d896ce4c5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2020 14:26:45.9978
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mi41FShRTHOYOE0qe4E9Hx+1Tnj20SuEFIAwLKehWmQaBqE6gPU58/ghYGa/n/trIBNW/UfJg7bkRLWDZgs5p3A9/Xf1O8MGGgoyZkWvrfTuK2GdwXA5vh3a75aTb622
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0301MB2316
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

T24gV2VkLCAyMDIwLTEyLTAyIGF0IDEyOjU3ICswMDAwLCBMZWUgSm9uZXMgd3JvdGU6DQo+IE9u
IEZyaSwgMjcgTm92IDIwMjAsIFZhaXR0aW5lbiwgTWF0dGkgd3JvdGU6DQo+IA0KPiA+IEhlbGxv
IExlZSwNCj4gPiANCj4gPiBPbiBGcmksIDIwMjAtMTEtMjcgYXQgMDg6MzIgKzAwMDAsIExlZSBK
b25lcyB3cm90ZToNCj4gPiA+IE9uIE1vbiwgMjMgTm92IDIwMjAsIE1hdHRpIFZhaXR0aW5lbiB3
cm90ZToNCj4gPiA+IA0KPiA+ID4gPiBBZGQgY29yZSBzdXBwb3J0IGZvciBST0hNIEJEOTU3Nk1V
RiBhbmQgQkQ5NTczTVVGIFBNSUNzIHdoaWNoDQo+ID4gPiA+IGFyZQ0KPiA+ID4gPiBtYWlubHkg
dXNlZCB0byBwb3dlciB0aGUgUi1DYXIgc2VyaWVzIHByb2Nlc3NvcnMuDQo+ID4gPiA+IA0KPiA+
ID4gPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aSBWYWl0dGluZW4gPA0KPiA+ID4gPiBtYXR0aS52YWl0
dGluZW5AZmkucm9obWV1cm9wZS5jb20+DQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiAgZHJpdmVycy9t
ZmQvS2NvbmZpZyAgICAgICAgICAgICAgfCAgMTEgKysrKw0KPiA+ID4gPiAgZHJpdmVycy9tZmQv
TWFrZWZpbGUgICAgICAgICAgICAgfCAgIDEgKw0KPiA+ID4gPiAgZHJpdmVycy9tZmQvcm9obS1i
ZDk1NzYuYyAgICAgICAgfCAxMDgNCj4gPiA+ID4gKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKw0KPiA+ID4gPiAgaW5jbHVkZS9saW51eC9tZmQvcm9obS1iZDk1N3guaCAgfCAgNTkgKysr
KysrKysrKysrKysrKysNCj4gPiA+ID4gIGluY2x1ZGUvbGludXgvbWZkL3JvaG0tZ2VuZXJpYy5o
IHwgICAyICsNCj4gPiA+ID4gIDUgZmlsZXMgY2hhbmdlZCwgMTgxIGluc2VydGlvbnMoKykNCj4g
PiA+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL21mZC9yb2htLWJkOTU3Ni5jDQo+ID4g
PiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9saW51eC9tZmQvcm9obS1iZDk1N3guaA0K
PiA+ID4gDQo+ID4gPiBMb29rcyBsaWtlIGEgcG9zc2libGUgY2FuZGlkYXRlIGZvciAic2ltcGxl
LW1mZC1pMmMiLg0KPiA+ID4gDQo+ID4gPiBDb3VsZCB5b3UgbG9vayBpbnRvIHRoYXQgcGxlYXNl
Pw0KPiA+ID4gDQo+ID4gSSBtdXN0IGFkbWl0IEkgZGlkbid0IGtub3cgYWJvdXQgInNpbXBsZS1t
ZmQtaTJjIi4gR29vZCB0aGluZyB0bw0KPiA+IGtub3cNCj4gPiB3aGVuIHdvcmtpbmcgd2l0aCBz
aW1wbGUgZGV2aWNlcyA6KSBJcyB0aGlzIGEgbmV3IHRoaW5nPw0KPiANCj4gWWVzLCBpdCdzIG5l
dy4NCj4gDQo+ID4gSSBhbSB1bnN1cmUgSSB1bmRlcnN0YW5kIHRoZSBpZGVhIGZ1bGx5LiBTaG91
bGQgdXNlcnMgcHV0IGFsbCB0aGUNCj4gPiBkaWZmZXJlbnQgcmVnYW1wIGNvbmZpZ3MgaW4gdGhp
cyBmaWxlIGFuZCBqdXN0IGFkZCB0aGUgZGV2aWNlIElEcw0KPiA+IHdpdGgNCj4gPiBwb2ludGVy
IHRvIGNvcnJlY3QgY29uZmlnPyAoQkQ5NTc2IGFuZCBCRDk1NzMgbmVlZCB2b2xhdGlsZQ0KPiA+
IHJhbmdlcykuDQo+ID4gQWxzbywgZG9lcyB0aGlzIG1lYW4gZWFjaCBzdWItZGV2aWNlIHNob3Vs
ZCBoYXZlIG93biBub2RlIGFuZCBvd24NCj4gPiBjb21wYXRpYmxlIGluIERUIHRvIGdldCBjb3Jy
ZWN0bHkgbG9hZCBhbmQgcHJvYmVkPyBJIGd1ZXNzIHRoaXMNCj4gPiB3b3VsZA0KPiA+IG5lZWQg
YSBidXktaW4gZnJvbSBSb2IgdG9vIHRoZW4uDQo+IA0KPiBZb3Ugc2hvdWxkIGRlc2NyaWJlIHRo
ZSBIL1cgaW4gRFQuDQoNCkFmdGVyIHJlLXJlYWRpbmcgdGhpcyAtIGRvIHlvdSBtZWFuIG9uZSBz
aG91bGQgZGVzY3JpYmUgZm9yIGV4YW1wbGUgdGhlDQpyZWdpc3RlciByYW5nZXMgaW4gRFQ/IEkg
ZG9uJ3Qgc2VlIGNvZGUgd2hpY2ggcGFyc2VzIHRoZSB2b2xhdGlsZQ0KcmFuZ2VzIG9yIG90aGVy
IHJlZ21hcCBjb25maWdzIGhlcmUuIEkgYXNzdW1lIG5vLiBJIGd1ZXNzIHlvdSByZXBsaWVkDQp0
byB0aGUgcXVlc3Rpb24gd2hldGhlciBlYWNoIHN1YiBkZXZpY2Ugd291bGQgbmVlZCBvd24gbm9k
ZSBhbmQNCmNvbXBhdGlibGUuDQoNCkJlc3QgUmVnYXJkcw0KCU1hdHRpIFZhaXR0aW5lbg0K
