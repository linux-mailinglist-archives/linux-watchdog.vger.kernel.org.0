Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6A1D22BE8E
	for <lists+linux-watchdog@lfdr.de>; Fri, 24 Jul 2020 09:03:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726781AbgGXHDg (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 24 Jul 2020 03:03:36 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:5243 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725942AbgGXHDg (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 24 Jul 2020 03:03:36 -0400
X-UUID: 40d85fcacdc84a78b366d4c8c9a9741e-20200724
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=pQEzRPBBsfVAYpz/jWwz9ulLUcB7f5ZARXi1n6E4uJE=;
        b=X5PD51UuZTUw9T9biWy2CeEPUtz6YAwpyRH2/VSsrukFa4TQ8pfTM+32aBQgtZFO2lqlO0ayl//FOUUWyCC9se6M+aRq/1L+ms/zv7iFcukwb5a3+EwLbvPGGc99BjT1zr9133HlrcymoHHS7qIPlC/r5F8etwrsiYdB/znPgIg=;
X-UUID: 40d85fcacdc84a78b366d4c8c9a9741e-20200724
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <crystal.guo@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 2057504373; Fri, 24 Jul 2020 15:03:32 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs06n2.mediatek.inc
 (172.21.101.130) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 24 Jul
 2020 15:03:30 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 24 Jul 2020 15:03:27 +0800
Message-ID: <1595574138.15289.16.camel@mhfsdcap03>
Subject: Re: [PATCH 3/4] watchdog: mt8192: add wdt support
From:   Crystal Guo <crystal.guo@mediatek.com>
To:     Matthias Brugger <matthias.bgg@gmail.com>
CC:     Seiya Wang =?UTF-8?Q?=28=E7=8E=8B=E8=BF=BA=E5=90=9B=29?= 
        <seiya.wang@mediatek.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        srv_heupstream <srv_heupstream@mediatek.com>
Date:   Fri, 24 Jul 2020 15:02:18 +0800
In-Reply-To: <bdd9f543-0fe0-af25-1843-aae95fcd4230@gmail.com>
References: <20200723090731.4482-1-seiya.wang@mediatek.com>
         <20200723090731.4482-4-seiya.wang@mediatek.com>
         <bdd9f543-0fe0-af25-1843-aae95fcd4230@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 13D0D2DA84AEC947E1C8752AB204567EA3348C69F831154A8F05B16077032F5D2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

T24gRnJpLCAyMDIwLTA3LTI0IGF0IDA2OjAwICswODAwLCBNYXR0aGlhcyBCcnVnZ2VyIHdyb3Rl
Og0KPiANCj4gT24gMjMvMDcvMjAyMCAxMTowNywgU2VpeWEgV2FuZyB3cm90ZToNCj4gPiBGcm9t
OiBDcnlzdGFsIEd1byA8Y3J5c3RhbC5ndW9AbWVkaWF0ZWsuY29tPg0KPiA+IA0KPiA+IGFkZCBk
cml2ZXIgc2V0dGluZyB0byBzdXBwb3J0IG10ODE5MiB3ZHQNCj4gPiANCj4gPiBTaWduZWQtb2Zm
LWJ5OiBDcnlzdGFsIEd1byA8Y3J5c3RhbC5ndW9AbWVkaWF0ZWsuY29tPg0KPiA+IC0tLQ0KPiA+
ICAgZHJpdmVycy93YXRjaGRvZy9tdGtfd2R0LmMgfCA1ICsrKysrDQo+ID4gICAxIGZpbGUgY2hh
bmdlZCwgNSBpbnNlcnRpb25zKCspDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvd2F0
Y2hkb2cvbXRrX3dkdC5jIGIvZHJpdmVycy93YXRjaGRvZy9tdGtfd2R0LmMNCj4gPiBpbmRleCBk
NmE2MzkzZjYwOWQuLmFkMjM1OTYxNzBhZiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL3dhdGNo
ZG9nL210a193ZHQuYw0KPiA+ICsrKyBiL2RyaXZlcnMvd2F0Y2hkb2cvbXRrX3dkdC5jDQo+ID4g
QEAgLTc2LDYgKzc2LDEwIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX3dkdF9kYXRhIG10ODE4
M19kYXRhID0gew0KPiA+ICAgCS50b3ByZ3Vfc3dfcnN0X251bSA9IE1UODE4M19UT1BSR1VfU1df
UlNUX05VTSwNCj4gPiAgIH07DQo+ID4gICANCj4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtf
d2R0X2RhdGEgbXQ4MTkyX2RhdGEgPSB7DQo+ID4gKwkudG9wcmd1X3N3X3JzdF9udW0gPSAyMywN
Cj4gDQo+IFNob3VsZCBiZSBkZWZpbmVkIGluIGluY2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQtY29u
dHJvbGxlci9tdDgxOTItcmVzZXRzLmgNCg0KbXQ4eHh4LXJlc2V0cy5oIGFjdHVhbGx5IGp1c3Qg
dXNlZCB0byBkZWZpbmUgVE9QUkdVX1NXX1JTVF9OVU0sIG1heSBiZQ0KaXQncyBtb3JlIGVhc2ll
ciB0byBtYWludGFpbiBieSBkZWZpbmUgaXQgYXQgT0YgZGF0YSBkaXJlY3RseSwgaW5zdGVhZA0K
b2YgcmVzdWJtaXQgdGhlIG10OHh4eC1yZXNldC5oIGFuZCBhZGQNCiJpbmNsdWRlL2R0LWJpbmRp
bmdzL3Jlc2V0LWNvbnRyb2xsZXIvbXQ4eHh4LXJlc2V0cy5oIiBhdCBtdGtfd2R0LmMuDQoNClJl
Z2FyZHMNCkNyeXN0YWwgR3VvDQoNCj4gDQo+ID4gK307DQo+ID4gKw0KPiA+ICAgc3RhdGljIGlu
dCB0b3ByZ3VfcmVzZXRfdXBkYXRlKHN0cnVjdCByZXNldF9jb250cm9sbGVyX2RldiAqcmNkZXYs
DQo+ID4gICAJCQkgICAgICAgdW5zaWduZWQgbG9uZyBpZCwgYm9vbCBhc3NlcnQpDQo+ID4gICB7
DQo+ID4gQEAgLTMyMiw2ICszMjYsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9p
ZCBtdGtfd2R0X2R0X2lkc1tdID0gew0KPiA+ICAgCXsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWss
bXQyNzEyLXdkdCIsIC5kYXRhID0gJm10MjcxMl9kYXRhIH0sDQo+ID4gICAJeyAuY29tcGF0aWJs
ZSA9ICJtZWRpYXRlayxtdDY1ODktd2R0IiB9LA0KPiA+ICAgCXsgLmNvbXBhdGlibGUgPSAibWVk
aWF0ZWssbXQ4MTgzLXdkdCIsIC5kYXRhID0gJm10ODE4M19kYXRhIH0sDQo+ID4gKwl7IC5jb21w
YXRpYmxlID0gIm1lZGlhdGVrLG10ODE5Mi13ZHQiLCAuZGF0YSA9ICZtdDgxOTJfZGF0YSB9LA0K
PiA+ICAgCXsgLyogc2VudGluZWwgKi8gfQ0KPiA+ICAgfTsNCj4gPiAgIE1PRFVMRV9ERVZJQ0Vf
VEFCTEUob2YsIG10a193ZHRfZHRfaWRzKTsNCj4gPiANCg0K

