Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04B9E26F5AE
	for <lists+linux-watchdog@lfdr.de>; Fri, 18 Sep 2020 08:06:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726384AbgIRGG3 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 18 Sep 2020 02:06:29 -0400
Received: from mail-am6eur05on2056.outbound.protection.outlook.com ([40.107.22.56]:25006
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726119AbgIRGG3 (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 18 Sep 2020 02:06:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gA2u6p0TN7CsBv5EhRANHsb8zvUiXtFHk03UAzEGVBA2ugCeHJfA3qYWgwtcC52HPuFZHS5/nEN0n7sQRR51N58cJ/3JnnlzDlVWnK0GzsWRlr4dDAjqIMcIFUZusdykPT1MUCNsf2mEHTx3bq5zR+vnzmeNLE3IghGU/vXdYGnnMM7uSdDdBKVj/4q7yl0hCUhkI73Qpfg/uO0/2d1KY1JXMu2wx1XMc4rofcHQtKi4u6p0Gdn3iLnLvDovovQ33M2yruK5Nw3xNDP7KBTndQvzpJ/UOzpLOQLfZ/PGwftMsETVGp0sBNHt+2OZncWk0nAVajeY6tiA+iUJluv/fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kiPRmFUmVwQyrERNAti+cATV/BLcrJCG2WCaGRnl8Rw=;
 b=cxOuSoM3TvBFErZeJsVYGAZiBw4b6CpLaPGlCK0yCXUajfHTXEl+FKk5L8JmfqgHKUyFu8+e/bpBpVAgyE2CpAplSTsdGYADl4M+w+YKYyVaiAA1SplGMNPplBJ0cD+bqHOhS9DIhSH7wyz8MSJmy5RYSguBWbX//pE/Kxw4hJTjWO/Q5LCsUjg3jCz31y9COYJiG5/xI6pqJMtcMYZofHDQejYh0sekCe8Sn9qKFLQM91OjkZBKWWn16Ufe8ZSaVZguLWBLRNuEfqINzdy8QfypsSYOZEZYtUUXOlDVn1Mv7d77czhlxmTCT+w0+ZB5e0/PsG70GWByx3CufcHmIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kiPRmFUmVwQyrERNAti+cATV/BLcrJCG2WCaGRnl8Rw=;
 b=HjDP1OkUKAy0OBtNdpc7Dc90dkDSt/asCYluc2DwzdVMyLHRmeO+J0aVkXADydTSlS2cfefQeJKBxZX9fQ/NzkvWeHVMGeawCe8TDffKAFZ7W2h/m52Of5fVp0GUsmoF8W1YxBH0M6Fva7rfv36WYV8bMJFE2c1xM4nBSOJZaZs=
Received: from DB6PR03MB3160.eurprd03.prod.outlook.com (2603:10a6:6:37::21) by
 DB6PR0301MB2456.eurprd03.prod.outlook.com (2603:10a6:4:62::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3391.14; Fri, 18 Sep 2020 06:06:24 +0000
Received: from DB6PR03MB3160.eurprd03.prod.outlook.com
 ([fe80::3c50:c4c8:c54e:19e3]) by DB6PR03MB3160.eurprd03.prod.outlook.com
 ([fe80::3c50:c4c8:c54e:19e3%2]) with mapi id 15.20.3391.014; Fri, 18 Sep 2020
 06:06:24 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "linux@roeck-us.net" <linux@roeck-us.net>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>
CC:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Subject: Re: [PATCH v1 4/6] wdt: Support wdt on ROHM BD9576MUF and BD9573MUF
Thread-Topic: [PATCH v1 4/6] wdt: Support wdt on ROHM BD9576MUF and BD9573MUF
Thread-Index: AQHWjMkDDUSch7IdMEekC07U3XaBAqlt5CkAgAAF8IA=
Date:   Fri, 18 Sep 2020 06:06:24 +0000
Message-ID: <3b9d7ba7f59b5c6787c40f86e0258f55fe73e10c.camel@fi.rohmeurope.com>
References: <cover.1600329307.git.matti.vaittinen@fi.rohmeurope.com>
         <1993b8516fefd3d8ea16e926c4db379b89ae4096.1600329307.git.matti.vaittinen@fi.rohmeurope.com>
         <2683bcbd-7ff2-f451-2e6c-79a2ff9e69ea@roeck-us.net>
In-Reply-To: <2683bcbd-7ff2-f451-2e6c-79a2ff9e69ea@roeck-us.net>
Reply-To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Accept-Language: fi-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none
 header.from=fi.rohmeurope.com;
x-originating-ip: [213.255.186.46]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b21dc254-b5db-43d1-0570-08d85b98f943
x-ms-traffictypediagnostic: DB6PR0301MB2456:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR0301MB2456CAF71AE358EDC4E21E8FAD3F0@DB6PR0301MB2456.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tQZ7/dY3jX71dmL6YFND7/9yW2xZoen7L9vnvQkzN6hfACMfuz2y+ovakBlYVM1OOj1YKhAm26htvrV5fR4b6rag4nvO5KdESxBYNuXBC+jg0QixbeLkJhA06/jaRK/a230vkIQeacN4/J8RlvGNmwUdE9eIe3tPZXWcdlU30GSWZwo1e6ovnRK18gb/AWR4DAtzzZnvfQwcCuOeVbYgUskRwGBMoOvLaEhrK6QRNXgDxkr2/Q909c1SH37RVgaZjB2k740cfDYZh/KSOmLoNnNDbvrLcphc4r37p7VcZnsbVbIhVUfkxEjaM13B4MY4WyeVwl26VkYy0az+/NcBaMbZy1ovLSXx/4C1anY+MFaKpsWLEIAZDMokq4kxHGBfTtL2bDRT4+R1xIyrcWE3Xg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR03MB3160.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(376002)(396003)(346002)(39850400004)(7416002)(76116006)(186003)(83380400001)(3450700001)(966005)(4326008)(6512007)(86362001)(54906003)(316002)(110136005)(26005)(478600001)(8936002)(66446008)(66556008)(66476007)(64756008)(66946007)(91956017)(53546011)(2906002)(6506007)(6486002)(5660300002)(8676002)(71200400001)(2616005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: BdL8bqiew1OJjJbeCtXpwqWxcM3094rnG3XbZbF3sfiH/zL8A9chAjmdiqN0nHkLpUu1YWpyWPSaW74+Zu4kVvKzir2liZts2+R6DZEXmGRf9cmZ0wJkkbVlOlTAtdIfjE04dpHI3ejXlHW0adIWh0Ux+K2X5fceXwn14XRzHfDq+4xYRBqWxoSnavG82ljBKTSw9RO+Bor7DT8e98KolQH0GJsvFYAOrA8UEto07J+sLhIT2xau0kHMY0gwjHnvNF9+8/2WeSJILHTNxcQIE1IlkglzIF5CNlLU6aQFpxw03YLfop+ZUCpvrKk5cslmbjEyRLh7H06OGtoRpxa6Th3C+i3XqHLTLz95FEY0enMApLr5HrxDMPRws9HVCIIipk3pW2EmPDDomn5twRs6eyZP5QhX1pikUMBijDo0wuV+rMcl7OdIt6Ss6/Ma5MtOURFBfndX4GRPGRe0BFw7icgHXPRt1GvhAielV2LqGFL+Zl8UfPaLREIjAuKmPn5rq+xq+HiTYj/qv+sKl0WMksLwskzazFEeZOOxrFN5eCpdb392RxYVttjv5PcMtpHHN3mdzsOZuW7Xu5ZYWGqXRuUONrw63AL89BJF3NhmW0kwv9r2rpVldtHOFdTmqdAMK0kMiYKf0RDI5QgXGWaOCw==
Content-Type: text/plain; charset="utf-8"
Content-ID: <529863431A77484881A31BCB1351090F@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR03MB3160.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b21dc254-b5db-43d1-0570-08d85b98f943
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2020 06:06:24.6811
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7Fw1EFsZOrvIjl+EsCO3/JVCVhF9nM5no6jQyT80bdDJ5u19WRbBRoTLtm1KM5ikoJcdWaZbt1na8QogvLXuVDpIGIrx7XxwJyWQpXCdxyPqSzqMx1yOERVW1aVA5+7r
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0301MB2456
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

VGhhbmtzIChhZ2FpbikgZm9yIHJldmlldyBHdWVudGVyIQ0KDQpPbiBUaHUsIDIwMjAtMDktMTcg
YXQgMjI6NDUgLTA3MDAsIEd1ZW50ZXIgUm9lY2sgd3JvdGU6DQo+IE9uIDkvMTcvMjAgMTowMyBB
TSwgTWF0dGkgVmFpdHRpbmVuIHdyb3RlOg0KPiA+IEFkZCBXYXRjaGRvZyBzdXBwb3J0IGZvciBS
T0hNIEJEOTU3Nk1VRiBhbmQgQkQ5NTczTVVGIFBNSUNzIHdoaWNoDQo+ID4gYXJlDQo+ID4gbWFp
bmx5IHVzZWQgdG8gcG93ZXIgdGhlIFItQ2FyIHNlcmllcyBwcm9jZXNzb3JzLiBUaGUgd2F0Y2hk
b2cgaXMNCj4gPiBwaW5nZWQgdXNpbmcgYSBHUElPIGFuZCBlbmFibGVkIHVzaW5nIGFub3RoZXIg
R1BJTy4gQWRkaXRpb25hbGx5DQo+ID4gd2F0Y2hkb2cgdGltZS1vdXQgY2FuIGJlIGNvbmZpZ3Vy
ZWQgdG8gSFcgcHJpb3Igc3RhcnRpbmcgdGhlDQo+ID4gd2F0Y2hkb2cuDQo+ID4gV2F0Y2hkb2cg
dGltZW91dCBjYW4gYmUgY29uZmlndXJlZCB0byBkZXRlY3Qgb25seSBkZWxheWVkIHBpbmcgb3IN
Cj4gPiBpbg0KPiA+IGEgd2luZG93IG1vZGUgd2hlcmUgYWxzbyB0b28gZmFzdCBwaW5ncyBhcmUg
ZGV0ZWN0ZWQuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogTWF0dGkgVmFpdHRpbmVuIDxtYXR0
aS52YWl0dGluZW5AZmkucm9obWV1cm9wZS5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvd2F0
Y2hkb2cvS2NvbmZpZyAgICAgIHwgIDEzICsrDQo+ID4gIGRyaXZlcnMvd2F0Y2hkb2cvTWFrZWZp
bGUgICAgIHwgICAxICsNCj4gPiAgZHJpdmVycy93YXRjaGRvZy9iZDk1NzZfd2R0LmMgfCAyOTUN
Cj4gPiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gIDMgZmlsZXMgY2hh
bmdlZCwgMzA5IGluc2VydGlvbnMoKykNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMv
d2F0Y2hkb2cvYmQ5NTc2X3dkdC5jDQoNCj4gDQo+ID4gKw0KPiA+ICsJcmV0ID0gb2ZfcHJvcGVy
dHlfcmVhZF91MzIobnAsDQo+ID4gKwkJCQkgICAiaHdfbWFyZ2luX21zIiwgJmh3X21hcmdpbik7
DQo+IA0KPiBMaW5lIHNwbGl0cyBhcmUgYXJiaXRyYXJ5LiBXaHkgaXMgdGhpcyAiaHdfbWFyZ2lu
X21zIiBhbmQgbm90DQo+ICJyb2htLGh3X21hcmdpbl9tcyIgPw0KDQoiaHdfbWFyZ2luX21zIiBp
cyBhbiBleGlzdGluZyBiaW5kaW5nIGZvciBzcGVjaWZ5aW5nIHRoZSBtYXhpbXVtIFRNTyBpbg0K
SFcgKGlmIEkgdW5kZXJzdG9vZCBpdCBjb3JyZWN0bHkpLiAoSXQgaXMgdXNlZCBhdCBsZWFzdCBi
eSB0aGUgZ2VuZXJpZw0KR1BJTyB3YXRjaGRvZykgSSB0aG91Z2h0IGl0J3MgYmV0dGVyIHRvIG5v
dCBpbnZlbnQgYSBuZXcgdmVuZG9yDQpzcGVjaWZpYyBiaW5kaW5nIHdoZW4gd2UgaGF2ZSBhIGdl
bmVyaWMgb25lLg0KDQpodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92NS45LXJjMi9z
b3VyY2UvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3dhdGNoZG9nL2dwaW8td2R0
LnR4dA0KDQo+IA0KPiA+ICsJaWYgKHJldCkgew0KPiA+ICsJCWlmIChyZXQgIT0gLUVJTlZBTCkN
Cj4gPiArCQkJcmV0dXJuIHJldDsNCj4gPiArDQo+ID4gKwkJaHdfbWFyZ2luID0gQkQ5NTdYX1dE
VF9ERUZBVUxUX01BUkdJTjsNCj4gPiArCX0NCj4gPiArDQo+ID4gKwlyZXQgPSBvZl9wcm9wZXJ0
eV9yZWFkX3UzMihucCwgInJvaG0saHctbWFyZ2luLW1pbi1tcyIsDQo+ID4gJmh3X21hcmdpbl9t
aW4pOw0KPiA+ICsJaWYgKHJldCA9PSAtRUlOVkFMKQ0KPiA+ICsJCWh3X21hcmdpbl9taW4gPSAw
Ow0KPiA+ICsJZWxzZSBpZiAocmV0KQ0KPiA+ICsJCXJldHVybiByZXQ7DQo+IA0KPiBQbGVhc2Ug
dXNlIGEgc2luZ2xlIG1lY2hhbmlzbSB0byBoYW5kbGUgLUVJTlZBTCBhZnRlcg0KPiBvZl9wcm9w
ZXJ0eV9yZWFkX3UzMigpLg0KDQpTb3JyeSBHdWVudGVyIC0gSSBhbSBwcm9iYWJseSBhIGJpdCBz
bG93IHRvZGF5IGJ1dCBJIGFtIHVuc3VyZSBpZiBJDQp1bmRlcnN0YW5kIHRoZSBzdWdnZXN0aW9u
LiBEbyB5b3UgbWVhbiBzb21ldGhpbmcgbGlrZToNCg0KaHdfbWFyZ2luX21pbiA9IDA7DQoNCnJl
dCA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyKG5wLCAicm9obSxody1tYXJnaW4tbWluLW1zIiwNCiZo
d19tYXJnaW5fbWluKTsNCmlmIChyZXQgJiYgcmV0ICE9IC1FSU5WQUwpDQoJcmV0dXJuIHJldDsN
Cg0KT3RoZXIgdGhhbiB0aGF0IC0gYWxsIGZpbmRpbmdzIGFyZSBjbGVhciB0byBtZS4gSSdsbCBj
cmFmdCBhIG5ldw0KdmVyc2lvbiBidXQgSSdsbCB3YWl0IGZvciBhIHdoaWxlIHRvIHNlZSBpZiBM
ZWUgaGFzIHRpbWUgdG8gc2VuZCBzb21lDQpmZWVkYmFjayBvbiBNRkQgc28gSSBjb3VsZCBnZXQg
Ym90aCBXREcgYW5kIE1GRCBmaXhlcyB0byBzYW1lIHZlcnNpb24NCjopDQoNCkJlc3QgUmVnYXJk
cw0KCS0tTWF0dGkNCg0KDQotLQ0KTWF0dGkgVmFpdHRpbmVuLCBMaW51eCBkZXZpY2UgZHJpdmVy
cw0KUk9ITSBTZW1pY29uZHVjdG9ycywgRmlubGFuZA0KU1dEQw0KS2l2aWhhcmp1bmxlbmtraSAx
RQ0KOTAyMjAgT1VMVQ0KRklOTEFORA0KDQp+fn4gIkkgZG9uJ3QgdGhpbmsgc28sIiBzYWlkIFJl
bmUgRGVzY2FydGVzLiBKdXN0IHRoZW4gaGUgdmFuaXNoZWQgfn5+DQoNClNpbW9uIHNheXMgLSBp
biBMYXRpbiBwbGVhc2UuDQoibm9uIGNvZ2l0byBtZSIgZGl4aXQgUmVuZSBEZXNjYXJ0ZSwgZGVp
bmRlIGV2YW5lc2Nhdml0DQoNCihUaGFua3MgZm9yIHRoZSB0cmFuc2xhdGlvbiBTaW1vbikNCg0K
