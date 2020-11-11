Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F7F12AF2E7
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 Nov 2020 15:01:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726903AbgKKOBr (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 11 Nov 2020 09:01:47 -0500
Received: from mail-eopbgr00067.outbound.protection.outlook.com ([40.107.0.67]:48140
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726553AbgKKOBi (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 11 Nov 2020 09:01:38 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kXNzqK52c3h+AofQvu+4iJtrlFKoFDDAvQ035b4uEqq5kgSJ1KWoYSVnzz9OcGyRNi/s+o94uZEhTPkmaghLMZNcNwZNCK130hkNJKUE84LJ7ScSo0jORENe53nnWwGXLGY0o0wuqFJTBUdkNEGpa7fn2xsib1h/+Nlcs78y/XsRu9whKGfT2KXi+Q2L3aRPWQl91eeRBXpJ+JnuJqNwBm/5w47ZpC/QPxiODF+eiWMLHOBXcKXWxD2miSxJV+u0GN98jDqhRnwJpvfiVNb2E2CUU6R0ExokD/u+pfQXfB23Ou7nZmlI0cknkG9IY0e3315uOhJcNVt0ZAAvVPJC4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g07drDPYDKe+bFLPAaHNElm3zg+zJq17tZTZJ5ZvYpc=;
 b=hUTl58v4t3WddoUNCQ5jx2MMBwYqnarLXdafA7gxfkKTNI6rT2t2ZNZVCv3BuoVWbaWJtm1skrK9niOClngDEkjOFglQKUQS3dVw2ywhD1D/E5eQnVFJ/Rh0cdyn0gcpMMOr3SuCfKoTx3KL5Y3G9HKCvCZ1VbB4XqXEFApcRidOlUtyiWgkQggyWMw9XVK/6HtaX+RURH0+IQh9YLDNzL2hD3vMnufSwQObD4LJKfhoAn18dSJ6UGTQgfLIayH8yllAH5r1WiXhU69mcBhtMD7+XmaySQwVslGlzS4u0IblI9mPdG0Iun/FdmnpChpKMnnxXlgZpRseeI3QrEFtGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g07drDPYDKe+bFLPAaHNElm3zg+zJq17tZTZJ5ZvYpc=;
 b=NClbBu/jSvX4WDvV17mAuX/oWPjX5caV73eMTLZkfq+dPaCcaSC5obc/umWdJ8dGOc+yvoaZQ+46kUsyaE0hj1GOrsq8VOXSJCveQoRZiVGtJk85XaZGMFCcRKPTCglHQXcP9wbtr+qngbEv071IKyx0jaUaky/VW3fZfiiuDt0=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR0302MB2762.eurprd03.prod.outlook.com (2603:10a6:3:ef::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.25; Wed, 11 Nov 2020 14:01:32 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::2c6d:c39b:de6d:b343]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::2c6d:c39b:de6d:b343%5]) with mapi id 15.20.3541.021; Wed, 11 Nov 2020
 14:01:32 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>
CC:     "linux@roeck-us.net" <linux@roeck-us.net>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Subject: Re: [PATCH v5 3/4] wdt: Support wdt on ROHM BD9576MUF and BD9573MUF
Thread-Topic: [PATCH v5 3/4] wdt: Support wdt on ROHM BD9576MUF and BD9573MUF
Thread-Index: AQHWs2g3f/ROJf29sU2Nc5RkpdSV3anC/3+A
Date:   Wed, 11 Nov 2020 14:01:32 +0000
Message-ID: <7d912f9a9c1aa2be3d73287401fd2088a63b899c.camel@fi.rohmeurope.com>
References: <cover.1604574431.git.matti.vaittinen@fi.rohmeurope.com>
         <1a454defaf65ecc22deb0fe42a1384a5f9d5a771.1604574431.git.matti.vaittinen@fi.rohmeurope.com>
In-Reply-To: <1a454defaf65ecc22deb0fe42a1384a5f9d5a771.1604574431.git.matti.vaittinen@fi.rohmeurope.com>
Reply-To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Accept-Language: fi-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none
 header.from=fi.rohmeurope.com;
x-originating-ip: [62.78.225.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 204cddb5-8e91-4d5f-f8e6-08d8864a4baa
x-ms-traffictypediagnostic: HE1PR0302MB2762:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR0302MB27627B719692BBD3480B7EF7ADE80@HE1PR0302MB2762.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gxXZKiCAGkolf8lNzUnovFrafDQM1OiMaP3ewjTFW3YAuIx9+Iet+6VewhEhLMptf5XRdKnTja1AYNzctgfCd5K1n5t72GoVAVeScwpIHetVlM8+wTzbUaaERON6p7gXaceKMQIkvDZCSd3Ja9SEoG+Ck5ULpSKd5dEx6XblBqAoH1MSQkthhKYoQiEKjaeypn264Qp5fmzR3Bgi4q/Nfb+oBj5oYBqz1yn5kIaC8DWaMrjOYNT+JZ46WJHYbJSavoey0FEs3Ap9kqrouQ1VIk62j11pll2GudJgwm44e3mO6S35lvkP4SXZ5/L0l8xZAgwNulsbaDr4nZvwsx5FGA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(376002)(396003)(136003)(366004)(6512007)(86362001)(2906002)(76116006)(83380400001)(71200400001)(6486002)(6916009)(316002)(66946007)(8676002)(5660300002)(54906003)(3450700001)(4326008)(26005)(6506007)(66556008)(66476007)(66446008)(64756008)(478600001)(2616005)(186003)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: qMYFXrJonFZIMuYmfxAmdHD4GLiDQXls1bWKDLozpCa4j2XZftqkq5K4RxOpFqPZDckUP0fgwwzSXlYRR5Z/1moVkuXL7vULZ3A4cGrEGhrCqhsNl7B0n0pe58E4jmchGMzIeqXzbmkLf4V9PUYO1NZJ9AQIJfZaVud/cpwaI/PqQhThlNMTgp1YjJ1kOGpBGwaTw0q/L2NegtI/rYHg341MrsrUcCczMyuFM0RbeLVqEhDuQI4TsdYh0pOzJyX8PV48scv+uaZcyf5tdjITgTOkA1nCRyilVn7xOiMfM482Fj6Dh7xBvete57YlqlqAhWL9QkYgEU/L1FWRreoTdVkQd6foUjlGjom61jf3GziiJ6Lt0Sc4uVw1AZi+vfFdqF45ATZi90Rf3aEkSj++cOOtNNkxu6N0wM7cTsOTOiBwSu3z9JznDr+KChPSD0cLEA2BZVERG9NWfB3ZQSYcEoijr7dFMR8R7J+xYuC0ppebEovpMyf+PuaK3PndpwgBF2RQB+PMR6+xEGfyhrJcJMSpZNeuZpBlCOqQ+TJNeOaWrpb1G9ttVJazrxBNAVYGg/xkJB27w3yzt9PvmiFPLd2bOY9xJLeYhvICRjS4fgYsTL5eTgYDz448ZsQ5RuRIi0dpoTeX8AvhlmngRi8JN+SNS1wONdyKOBwuO1bqC1Mvzf235AYtlj4ofaz8U+1S6HVPNtZwisCVrDK+kkbH2eyuY+9/rwFf8/Zg+PrCUuDH/1bISCKJ9vqaWSwFD3W/NSAFH3r9yzb+CRKDrFsnWRWWCR1ZUGjH0aR9i4lyGE6FhAMcePRTQthsbio2cPWKu9uSoUyXSGeRs8AoKNhEr6snZtIIU8voBVpv5R4UHUhY8KHoCb0TcqHlXCKLCPZunB+D2T4Scq13LMEsXw1K6A==
Content-Type: text/plain; charset="utf-8"
Content-ID: <C9C5ADFF7B28E44190F9A2D4E13EC6ED@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 204cddb5-8e91-4d5f-f8e6-08d8864a4baa
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2020 14:01:32.7363
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fgrSSl8NYzDA8CU+3XHA6ca93rcLi4LRIUcXeqOEZTuQk9i9wAdPYd9c2kvk1neBTeM5eQNTWkIMPhLuHIURWpe+W0BRHcCxF3GvDlcUjZFatsX+nVF9tjplcq7ke0uS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0302MB2762
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

T24gVGh1LCAyMDIwLTExLTA1IGF0IDEzOjM4ICswMjAwLCBNYXR0aSBWYWl0dGluZW4gd3JvdGU6
DQo+IEFkZCBXYXRjaGRvZyBzdXBwb3J0IGZvciBST0hNIEJEOTU3Nk1VRiBhbmQgQkQ5NTczTVVG
IFBNSUNzIHdoaWNoIGFyZQ0KPiBtYWlubHkgdXNlZCB0byBwb3dlciB0aGUgUi1DYXIgc2VyaWVz
IHByb2Nlc3NvcnMuIFRoZSB3YXRjaGRvZyBpcw0KPiBwaW5nZWQgdXNpbmcgYSBHUElPIGFuZCBl
bmFibGVkIHVzaW5nIGFub3RoZXIgR1BJTy4gQWRkaXRpb25hbGx5DQo+IHdhdGNoZG9nIHRpbWUt
b3V0IGNhbiBiZSBjb25maWd1cmVkIHRvIEhXIHByaW9yIHN0YXJ0aW5nIHRoZQ0KPiB3YXRjaGRv
Zy4NCj4gV2F0Y2hkb2cgdGltZW91dCBjYW4gYmUgY29uZmlndXJlZCB0byBkZXRlY3Qgb25seSBk
ZWxheWVkIHBpbmcgb3IgaW4NCj4gYSB3aW5kb3cgbW9kZSB3aGVyZSBhbHNvIHRvbyBmYXN0IHBp
bmdzIGFyZSBkZXRlY3RlZC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1hdHRpIFZhaXR0aW5lbiA8
bWF0dGkudmFpdHRpbmVuQGZpLnJvaG1ldXJvcGUuY29tPg0KPiBSZXZpZXdlZC1ieTogR3VlbnRl
ciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0Pg0KPiAtLS0NCj4gDQoNCi8vc25pcA0KDQo+ICsJ
cmV0ID0gb2ZfcHJvcGVydHlfcmVhZF92YXJpYWJsZV91MzJfYXJyYXkobnAsICJyb2htLGh3LXRp
bWVvdXQtDQo+IG1zIiwNCj4gKwkJCQkJCSAgJmh3X21hcmdpblswXSwgMSwgMik7DQo+ICsJaWYg
KHJldCA8IDAgJiYgcmV0ICE9IC1FSU5WQUwpDQo+ICsJCXJldHVybiByZXQ7DQo+ICsNCj4gKwlp
ZiAocmV0ID09IDEpDQo+ICsJCWh3X21hcmdpbl9tYXggPSBod19tYXJnaW5bMF07DQo+ICsNCj4g
KwlpZiAocmV0ID09IDIpIHsNCj4gKwkJaHdfbWFyZ2luX21heCA9IGh3X21hcmdpblsxXTsNCj4g
KwkJaHdfbWFyZ2luX21pbiA9IGh3X21hcmdpblswXTsNCj4gKwl9DQo+ICsNCj4gKwlyZXQgPSBi
ZDk1N3hfc2V0X3dkdF9tb2RlKHByaXYsIGh3X21hcmdpbl9tYXgsIGh3X21hcmdpbl9taW4pOw0K
PiArCWlmIChyZXQpDQo+ICsJCXJldHVybiByZXQ7DQo+ICsNCj4gKwlwcml2LT5hbHdheXNfcnVu
bmluZyA9IG9mX3Byb3BlcnR5X3JlYWRfYm9vbChucCwgImFsd2F5cy0NCj4gcnVubmluZyIpOw0K
PiArDQo+ICsJd2F0Y2hkb2dfc2V0X2RydmRhdGEoJnByaXYtPndkZCwgcHJpdik7DQo+ICsNCj4g
Kwlwcml2LT53ZGQuaW5mbwkJCT0gJmJkOTU3eF93ZHRfaWRlbnQ7DQo+ICsJcHJpdi0+d2RkLm9w
cwkJCT0gJmJkOTU3eF93ZHRfb3BzOw0KPiArCXByaXYtPndkZC5taW5faHdfaGVhcnRiZWF0X21z
CT0gaHdfbWFyZ2luX21pbjsNCj4gKwlwcml2LT53ZGQubWF4X2h3X2hlYXJ0YmVhdF9tcwk9IGh3
X21hcmdpbl9tYXg7DQo+ICsJcHJpdi0+d2RkLnBhcmVudAkJPSBkZXY7DQo+ICsJcHJpdi0+d2Rk
LnRpbWVvdXQJCT0gKGh3X21hcmdpbl9tYXggLyAyKSAqIDEwMDA7DQoNCkhtbS4gSnVzdCBub3Rp
Y2VkIHRoaXMgdmFsdWUgZG9lcyBub3QgbWFrZSBzZW5zZSwgcmlnaHQ/DQpNYXhpbXVtIGh3X21h
cmdpbiBpcyA0NDE2IG1zLiBJZiBJIHJlYWQgdGhpcyBjb3JyZWN0bHkgdGltZW91dCBzaG91bGQN
CmJlIGluIHNlY29uZHMgLSAgc28gcmVzdWx0IGlzIGFyb3VuZCAyIDAwMCAwMDAgc2Vjb25kcyBo
ZXJlLiBJIHRoaW5rIGl0DQppcyB1c2VsZXNzIHZhbHVlLi4uDQoNClBlcmhhcHMNCglwcml2LT53
ZGQudGltZW91dAkJPSAoaHdfbWFyZ2luX21heCAvIDIpIC8gMTAwMDsNCglpZiAoIXByaXYtPndk
ZC50aW1lb3V0KQ0KCQlwcml2LT53ZGQudGltZW91dCA9IDE7DQp3b3VsZCBiZSBtb3JlIGFwcHJv
cHJpYXRlLg0KDQpJIG5lZWQgdG8gZG8gc29tZSB0ZXN0aW5nIHdoZW4gSSBnZXQgdGhlIEhXIGF0
IG15IGhhbmRzIC0gcGxlYXNlIGRvbid0DQphcHBseSB0aGlzIHBhdGNoIGp1c3QgeWV0LiBJIHdp
bGwgcmVzcGluIHRoaXMgYWZ0ZXIgc29tZSB0ZXN0aW5nIC0gb3INCmlmIG90aGVyIHBhdGNoZXMg
YXJlIGFwcGxpZWQgdGhlbiBJIHdpbGwganVzdCBzZW5kIHRoaXMgb25lIGFsb25lLg0KDQpTb3Jy
eSBmb3IgdGhlIGhhc3NsZS4uLg0KDQotLU1hdHRpDQoNCi0tDQpNYXR0aSBWYWl0dGluZW4sIExp
bnV4IGRldmljZSBkcml2ZXJzDQpST0hNIFNlbWljb25kdWN0b3JzLCBGaW5sYW5kIFNXREMNCktp
dmloYXJqdW5sZW5ra2kgMUUNCjkwMjIwIE9VTFUNCkZJTkxBTkQNCg0Kfn5+ICJJIGRvbid0IHRo
aW5rIHNvLCIgc2FpZCBSZW5lIERlc2NhcnRlcy4gSnVzdCB0aGVuIGhlIHZhbmlzaGVkIH5+fg0K
DQpTaW1vbiBzYXlzIC0gaW4gTGF0aW4gcGxlYXNlLg0KIm5vbiBjb2dpdG8gbWUiIGRpeGl0IFJl
bmUgRGVzY2FydGUsIGRlaW5kZSBldmFuZXNjYXZpdA0KDQooVGhhbmtzIGZvciB0aGUgdHJhbnNs
YXRpb24gU2ltb24pDQo=
