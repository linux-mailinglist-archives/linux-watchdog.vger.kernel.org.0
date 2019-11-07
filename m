Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7ECF6F3575
	for <lists+linux-watchdog@lfdr.de>; Thu,  7 Nov 2019 18:10:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729171AbfKGRKt (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 7 Nov 2019 12:10:49 -0500
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:49119 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726231AbfKGRKs (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 7 Nov 2019 12:10:48 -0500
Received-SPF: Pass (esa3.microchip.iphmx.com: domain of
  Eugen.Hristev@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="Eugen.Hristev@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa3.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa3.microchip.iphmx.com; spf=Pass smtp.mailfrom=Eugen.Hristev@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: 7LPfQ8s+y6CiSb1MeGpX6zr2dVunbM6NZTPTGO4MHEFm9pjxC/FjXx4fFIuPROlz27v83SJUuF
 mSEzg4LkBsHPpJmRH44riahcYhDNJUUgCD5IXmEUxw5c89n/9DS8DPqKTlKzfsGGRZTHEEj8Ib
 siEZ5HrNZ7izY1Cp0Y5kVQdNOl8+K/680dPremrt3ogFcJRSHmXh7iM0Rf0oZzk1SkxxH68A2r
 ZWY8zumYNBVfg1ItNqeHbUjvTO+qNonlWfJeJTLFk1Xb8BhyWPwRwgC/FjsITwLu3AkgRRQekl
 rIQ=
X-IronPort-AV: E=Sophos;i="5.68,278,1569308400"; 
   d="scan'208";a="56114027"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Nov 2019 10:10:47 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 7 Nov 2019 10:10:47 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 7 Nov 2019 10:10:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hPpvP6eqbB7K/SIQdfR/5QZQ+mx9wYciKksrld24kME+MdXQtNsT6XzBw1/99BIheFTrFzUknSmmo/kEMiRT4FIiHsR4yudmadd4o4szHnIpbFwuIx7hsmtBe3F2AnkEsCNs+8zdVWd+vQTsuFzfJTj3Qx7HD/dDR9DkWv6wMqp7uc2mJhGoJIgu+LLJR7abfQAmQ5U7B6RIG3eXFBH2VhmP6wIUXKOKjyaHKT2FytvPXT9EHqzzgnF2Ut7iIr3NpYDU2buXmeNf2tYd3iopuVHczZYZ8l19634Lg1W9hS2KA3nkjF4U/QGax0h86M4lX18UNwEb082m3wiIxsZBhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vzwwiym6EcOoE2l3k/C9/6GCO7dvRLS0eWZ0eBGHSSU=;
 b=IIsD0Su2J4T/I1H2JWzGtjInB2sv/u3cK7cOYGo9VFvEK55XCqn+rCDKSkbUeYTc0r7XeF1OIqXSKpM37ls929w2MHUaoF24iUU7ega/J1cG2Cqveqm2PKOGah05ktiiaBiuf9BjtrfsKVM+z5cMzsH2syi5C28PVK5Tt/fT1//QQ6hgy6BZXD4/Pn82ISFHCcnSWemd1sc5/L80YefnoZW663p/UyfTLD7uEE+tX3rUOJCniBug9dG5wmxyxHIReIy0I/bQDHkJvPRJCwsVeikjakzO29J98dY27uTephwBwuEAp8p7NdEuXed5Z10zDTzmQn6qk9VI4yrZMOPBqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vzwwiym6EcOoE2l3k/C9/6GCO7dvRLS0eWZ0eBGHSSU=;
 b=QWWE/pW9/KirVpNRRJAFwGj4vFQ2KL2TYvORNIVHzc+tlGxt/jqJEguQgTpVbG6sp5o0WNWD34MI/3eXaLdFEdOMgMgbBBspsECc2CwWpzgpHBkMpoJcBOs8WOaas+EFraEsC0EltwSlIrxBvzXcJE0ixJyhnriGM+EwIIIlhcQ=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB1306.namprd11.prod.outlook.com (10.168.103.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.20; Thu, 7 Nov 2019 17:10:45 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::d594:bcd0:98a9:d2c8]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::d594:bcd0:98a9:d2c8%4]) with mapi id 15.20.2408.028; Thu, 7 Nov 2019
 17:10:45 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <linux@roeck-us.net>
CC:     <wim@linux-watchdog.org>, <robh+dt@kernel.org>,
        <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] watchdog: sama5d4_wdt: addition of sam9x60
 compatible watchdog
Thread-Topic: [PATCH v2 2/2] watchdog: sama5d4_wdt: addition of sam9x60
 compatible watchdog
Thread-Index: AQHVh+/l2gK286N5pUWI+AtpzaiEg6dxqaQAgA4aiYCAAEA9AIAACEMA
Date:   Thu, 7 Nov 2019 17:10:45 +0000
Message-ID: <cfa73eee-8ba9-89f2-b218-886ab226a6da@microchip.com>
References: <1571648890-15140-1-git-send-email-eugen.hristev@microchip.com>
 <1571648890-15140-2-git-send-email-eugen.hristev@microchip.com>
 <20191029132831.GA5643@roeck-us.net>
 <28c6b394-ae88-f913-312e-6b38be1dc5a8@microchip.com>
 <20191107164104.GA7693@roeck-us.net>
In-Reply-To: <20191107164104.GA7693@roeck-us.net>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0237.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::33) To DM5PR11MB1242.namprd11.prod.outlook.com
 (2603:10b6:3:14::8)
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20191107191038895
x-originating-ip: [213.41.198.74]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 223a3514-c42e-42b4-8f8f-08d763a56d38
x-ms-traffictypediagnostic: DM5PR11MB1306:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB130659DF0C6AD2315F2B5104E8780@DM5PR11MB1306.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0214EB3F68
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(376002)(39860400002)(136003)(396003)(346002)(199004)(189003)(5660300002)(66556008)(66946007)(66476007)(31686004)(11346002)(2906002)(316002)(6116002)(7736002)(305945005)(66446008)(8676002)(64756008)(76176011)(53546011)(102836004)(386003)(71190400001)(81156014)(26005)(81166006)(52116002)(6916009)(8936002)(186003)(71200400001)(6506007)(14444005)(256004)(486006)(99286004)(476003)(86362001)(478600001)(3846002)(31696002)(6512007)(6246003)(25786009)(229853002)(2616005)(36756003)(6436002)(6486002)(54906003)(66066001)(4326008)(14454004)(446003);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB1306;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: R9SVM2IXEXPrda77rwNc4uRkfTUTck2RVrOGSAvl14WEbz97DlXDGjeoL1zIbzFMqsJPsnqatnehbgxj8lFU/g+vzjg5U4JynNAZjmTX4mnKSxRgJABa3KLhrhv/KLCKR0qbnsHWGm9GsIoc4dVy+nkK3nGK8CmikjCMctedIy35ZqntIyOwTGcCXhAJts/uUmCZM4OCMz05S2qSFRUVnXTquAjQKj7ktbFBA2yxfhpdK2IeBH4N2kdeafpQ7aGeGsaGaX3E9zKw/9499M1VeVflplMOR8cOHBEpOzy0xrG7sOVfWRrJCifi+rtx24BN/jZth7XyHABxBxNiWIyNgDMjcga0rZnAC/hjp6PaLcO4a+DePD8YO6jq6meCMymvshCvYiT6YDqpogVPUJ0nMfl6XntHK0PNDZi5OgFPBHzpvI9obi1lYbm6eT2oCbh1
Content-Type: text/plain; charset="utf-8"
Content-ID: <31C4D98CF18EF24EBC6FA472E0E9A6FD@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 223a3514-c42e-42b4-8f8f-08d763a56d38
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2019 17:10:45.1840
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nrCFMQ/jwbWZ2S6J+yjIVgqPOWiQNDH356VSlJSVqHog9TH4M0PIEsMa/NYHjsvodRdb6U8KsUASRGN25505kta90/4oXemfauPVyYzjAbU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1306
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

DQoNCk9uIDA3LjExLjIwMTkgMTg6NDEsIEd1ZW50ZXIgUm9lY2sgd3JvdGU6DQoNCj4gT24gVGh1
LCBOb3YgMDcsIDIwMTkgYXQgMTI6NTE6MTVQTSArMDAwMCwgRXVnZW4uSHJpc3RldkBtaWNyb2No
aXAuY29tIHdyb3RlOg0KPj4NCj4+Pj4gICAgDQo+Pj4+IC0JaWYgKCh3ZHQtPm1yICYgQVQ5MV9X
RFRfV0RGSUVOKSAmJiBpcnEpIHsNCj4+Pj4gKwlpcnEgPSBpcnFfb2ZfcGFyc2VfYW5kX21hcChk
ZXYtPm9mX25vZGUsIDApOw0KPj4+PiArCWlmICghaXJxKSB7DQo+Pj4+ICsJCWRldl93YXJuKGRl
diwgImZhaWxlZCB0byBnZXQgSVJRIGZyb20gRFRcbiIpOw0KPj4+PiArCQl3ZHQtPm5lZWRfaXJx
ID0gMDsNCj4+Pg0KPj4+IERvZXMgaXQgbWFrZSBzZW5zZSB0byBpZ25vcmUgdGhhdCA/DQo+Pg0K
Pj4gSGkgR3VlbnRlciwNCj4+DQo+PiBDYW4geW91IGRldGFpbCB3aGF0IGV4YWN0bHkgaXMgaWdu
b3JlZCA/DQo+Pg0KPiBUaGUgbWlzc2luZyBpbnRlcnJ1cHQuDQoNCkhpLA0KDQpUaGUgaW50ZXJy
dXB0IGlzIG5vdCBtYW5kYXRvcnkgZm9yIHRoZSB3b3JrIG9mIHRoZSB3YXRjaGRvZy4gU28sIGlm
IGl0J3MgDQpub3QgYXZhaWxhYmxlLCB3ZSBtdXN0IGFjdCBhY2NvcmRpbmdseToganVzdCBjb25m
aWd1cmUgd2F0Y2hkb2cgdG8gcmVzZXQgDQp0aGUgQ1BVLg0KSWYgd2UgaGF2ZSBhbiBJUlEsIHdl
IGNhbiB0aGVuIGFjdCBpbiB0aGUgJ3NvZnR3YXJlLXN0eWxlJyB3YXRjaGRvZzogDQp0cmlnZ2Vy
IGFuIElSUSBmaXJzdCBhbmQgdHJ5IHRvIGFsbG93IHRoZSBzeXN0ZW0gdG8gYSBzYWZlIHJlYm9v
dC4NClNvICwgaXQncyBub3QgaWdub3JpbmcsIGl0J3MgYWN0aW5nIGFjY29yZGluZ2x5IChsYXRl
ciBvbiwgZG8gbm90IGVuYWJsZSANCmFueXRoaW5nIGlycS1yZWxhdGVkICkNCg0KDQo+IA0KPj4+
PiArc3RhdGljIHN0cnVjdCBzYW1hNWQ0X3dkdF9kYXRhIHNhbWE1ZDRfY29uZmlnOw0KPj4+PiAr
DQo+Pj4+ICtzdGF0aWMgc3RydWN0IHNhbWE1ZDRfd2R0X2RhdGEgc2FtOXg2MF9jb25maWcgPSB7
DQo+Pj4+ICsJLnNhbTl4NjBfc3VwcG9ydCA9IDEsDQo+Pj4+ICt9Ow0KPj4+DQo+Pj4gVW5sZXNz
IHRoZXJlIGlzIHJlYXNvbiB0byBiZWxpZXZlIHRoYXQgdGhlcmUgd2lsbCBiZSBvdGhlcg0KPj4+
IGNvbmZpZ3VyYXRpb24gZGF0YSwgcGxlYXNlIGp1c3QgYXNzaWduIHRoZSBmbGFnIHZhbHVlIGRp
cmVjdGx5DQo+Pj4gdG8gLmRhdGEgYW5kIGFkZCBhIHZhcmlhYmxlIHRvIHN0cnVjdCBzYW1hNWQ0
X3dkdCB0byBhY2Nlc3MgaXQuDQo+Pj4gUGxlYXNlIG1ha2UgdGhhdCB2YXJpYWJsZSBhIGJvb2wu
DQo+Pg0KPj4gVGhlcmUgd2lsbCBiZSBtb3JlIGNvbmZpZ3VyYXRpb24gZGF0YSBmb3IgZnV0dXJl
IHByb2R1Y3RzLCBidXQgbm90IGF0DQo+PiB0aGlzIG1vbWVudC4gRG8gdGhlIGNoYW5nZSBvciBr
ZWVwIGl0IHRoaXMgd2F5ID8NCj4+DQo+IElmIG5vdCBhcyBwYXJ0IG9mIHRoaXMgc2VyaWVzLCBp
dCBpcyBiZXR0ZXIgdG8ganVzdCBhc3NpZ24NCj4gdGhlIGZsYWcgZGlyZWN0bHkuIElmIHRoZXJl
IGFyZSBjaGFuZ2VzIGNvbWluZyBhdCBhIGxhdGVyIHRpbWUNCj4gd2hpY2ggaW5kZWVkIG5lZWQg
YSBzdHJ1Y3R1cmUgKHdpdGggbW9yZSB0aGFuIG9uZSBvYmplY3QgaW4gaXQpLA0KPiB0aGF0IHN0
cnVjdHVyZSBjYW4gYmUgYWRkZWQgYXQgdGhhdCB0aW1lLg0KDQpPaywgSSB3aWxsIGNoYW5nZSBp
dCBpbiBuZXh0IHZlcnNpb24uDQoNClRoYW5rcywNCkV1Z2VuDQo+IA0KPiBHdWVudGVyDQo+IA0K
PiANCg==
