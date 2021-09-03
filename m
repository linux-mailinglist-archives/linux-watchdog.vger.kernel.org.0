Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B6453FFAAF
	for <lists+linux-watchdog@lfdr.de>; Fri,  3 Sep 2021 08:52:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234729AbhICGwf (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 3 Sep 2021 02:52:35 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:36324 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1346964AbhICGwe (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 3 Sep 2021 02:52:34 -0400
X-UUID: c76c733be8394f8581fb96ed1fa64e55-20210903
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=OQWwOb7sQeXF3nnpG4IGI+gbtaCyzmN8HQTZATIqijo=;
        b=ZpHt3LM5Ix+9r70jkr80b3KSZonyuvp1TTlrUSolxaJ7nTluJXdZ1HTF/NXvY2z4n1KVSNo7GocgByozhIH0jPAV+sSA8wCjPIgrzsh+d7ZVnloe+KmJM3y+r0+rhFCRkgCVGlBxrtm5bC4AZ08TNOJUeQGiUIa9nZkYgMDPN/k=;
X-UUID: c76c733be8394f8581fb96ed1fa64e55-20210903
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw01.mediatek.com
        (envelope-from <fengquan.chen@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 861027756; Fri, 03 Sep 2021 14:51:29 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs05n1.mediatek.inc
 (172.21.101.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 3 Sep
 2021 14:51:28 +0800
Received: from mhfsdcap04 (10.17.3.154) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 3 Sep 2021 14:51:26 +0800
Message-ID: <242e9e2ed9c2c071c4b05d11f276642e996e03b6.camel@mediatek.com>
Subject: Re: [PATCH] watchdog: mtk: add disable_wdt_extrst support
From:   Fengquan Chen <fengquan.chen@mediatek.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        <linux-watchdog@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     <tinghan.shen@mediatek.com>, <randy.wu@mediatek.com>,
        <rex-bc.chen@mediatek.com>, <christine.zhu@mediatek.com>,
        <joe.yang@mediatek.com>, <zhishuang.zhang@mediatek.com>
Date:   Fri, 3 Sep 2021 14:51:28 +0800
In-Reply-To: <5fe9c774-c619-604e-1f74-12ff6bfe826f@roeck-us.net>
References: <1630569881-6032-1-git-send-email-Fengquan.Chen@mediatek.com>
         <1630569881-6032-2-git-send-email-Fengquan.Chen@mediatek.com>
         <5fe9c774-c619-604e-1f74-12ff6bfe826f@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

T24gVGh1LCAyMDIxLTA5LTAyIGF0IDA2OjQzIC0wNzAwLCBHdWVudGVyIFJvZWNrIHdyb3RlOg0K
PiBPbiA5LzIvMjEgMTowNCBBTSwgRmVuZ3F1YW4gQ2hlbiB3cm90ZToNCj4gPiBGcm9tOiAiZmVu
Z3F1YW4uY2hlbiIgPGZlbmdxdWFuLmNoZW5AbWVkaWF0ZWsuY29tPg0KPiANCj4gVGhlcmUgc2hv
dWxkIG5vdCBiZSBzdWNoIEZyb206IGxpbmUuDQoNClRoYW5rcywgaSBoYXZlIHJlbW92ZWQgaXQg
YW5kIHVwbG9hZGVkIGEgbmV3IHZlcnNpb246DQpodHRwczovL3BhdGNod29yay5rZXJuZWwub3Jn
L3Byb2plY3QvbGludXgtbWVkaWF0ZWsvbGlzdC8/c2VyaWVzPTU0MTU2Nw0KDQo+IA0KPiA+IA0K
PiA+IEluIHNvbWUgY2FzZXMsIHdlIG1heSBuZWVkIHdhdGNoZG9nIGp1c3QgdG8gdHJpZ2dlciBh
bg0KPiA+IGludGVybmFsIHNvYyByZXNldCB3aXRob3V0IHNlbmRpbmcgYW55IG91dHB1dCBzaWdu
YWwuDQo+ID4gDQo+ID4gUHJvdmlkZSBhIGRpc2FibGVfd2R0X2V4dHJzdCBwYXJhbWV0ZXIgZm9y
IGNvbmZpZ3VyYXRpb24uDQo+ID4gV2UgY2FuIGRpc2FibGUgb3IgZW5hYmxlIGl0IGp1c3QgYnkg
Y29uZmlndXJpbmcgZHRzLg0KPiA+IA0KPiA+IGlnbmVkLW9mZi1ieTogRmVuZ3F1YW4gQ2hlbiA8
ZmVuZ3F1YW4uY2hlbkBtZWRpYXRlay5jb20+DQo+IA0KPiBNaXNzaW5nICJTIi4NCg0KVGhhbmtz
LCBoYXMgYmVlbiBhZGRlZCBiYWNrIGluIHYyLg0KDQo+IA0KPiA+IC0tLQ0KPiA+ICAgZHJpdmVy
cy93YXRjaGRvZy9tdGtfd2R0LmMgfCA3ICsrKysrKysNCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCA3
IGluc2VydGlvbnMoKykNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy93YXRjaGRvZy9t
dGtfd2R0LmMNCj4gPiBiL2RyaXZlcnMvd2F0Y2hkb2cvbXRrX3dkdC5jDQo+ID4gaW5kZXggOTdj
YTk5My4uNDgyNGMwNyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL3dhdGNoZG9nL210a193ZHQu
Yw0KPiA+ICsrKyBiL2RyaXZlcnMvd2F0Y2hkb2cvbXRrX3dkdC5jDQo+ID4gQEAgLTYzLDYgKzYz
LDcgQEAgc3RydWN0IG10a193ZHRfZGV2IHsNCj4gPiAgIAl2b2lkIF9faW9tZW0gKndkdF9iYXNl
Ow0KPiA+ICAgCXNwaW5sb2NrX3QgbG9jazsgLyogcHJvdGVjdHMgV0RUX1NXU1lTUlNUIHJlZyAq
Lw0KPiA+ICAgCXN0cnVjdCByZXNldF9jb250cm9sbGVyX2RldiByY2RldjsNCj4gPiArCWJvb2wg
ZGlzYWJsZV93ZHRfZXh0cnN0Ow0KPiA+ICAgfTsNCj4gPiAgIA0KPiA+ICAgc3RydWN0IG10a193
ZHRfZGF0YSB7DQo+ID4gQEAgLTI0MCw2ICsyNDEsOCBAQCBzdGF0aWMgaW50IG10a193ZHRfc3Rh
cnQoc3RydWN0IHdhdGNoZG9nX2RldmljZQ0KPiA+ICp3ZHRfZGV2KQ0KPiA+ICAgDQo+ID4gICAJ
cmVnID0gaW9yZWFkMzIod2R0X2Jhc2UgKyBXRFRfTU9ERSk7DQo+ID4gICAJcmVnICY9IH4oV0RU
X01PREVfSVJRX0VOIHwgV0RUX01PREVfRFVBTF9FTik7DQo+ID4gKwlpZiAobXRrX3dkdC0+ZGlz
YWJsZV93ZHRfZXh0cnN0KQ0KPiA+ICsJCXJlZyAmPSB+V0RUX01PREVfRVhSU1RfRU47DQo+ID4g
ICAJcmVnIHw9IChXRFRfTU9ERV9FTiB8IFdEVF9NT0RFX0tFWSk7DQo+ID4gICAJaW93cml0ZTMy
KHJlZywgd2R0X2Jhc2UgKyBXRFRfTU9ERSk7DQo+ID4gICANCj4gPiBAQCAtMzA5LDYgKzMxMiwx
MCBAQCBzdGF0aWMgaW50IG10a193ZHRfcHJvYmUoc3RydWN0DQo+ID4gcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQ0KPiA+ICAgCQlpZiAoZXJyKQ0KPiA+ICAgCQkJcmV0dXJuIGVycjsNCj4gPiAgIAl9
DQo+ID4gKw0KPiA+ICsJbXRrX3dkdC0+ZGlzYWJsZV93ZHRfZXh0cnN0ID0NCj4gPiArCQlvZl9w
cm9wZXJ0eV9yZWFkX2Jvb2woZGV2LT5vZl9ub2RlLCAiZGlzYWJsZV9leHRyc3QiKTsNCj4gPiAr
DQo+IA0KPiBUaGUgbmV3IHByb3BlcnR5IG5lZWRzIHRvIGJlIGRvY3VtZW50ZWQgYW5kIGFwcHJv
dmVkIGJ5IGEgRFQNCj4gbWFpbnRhaW5lcg0KPiAoc2VwYXJhdGUgcGF0Y2gpLiBTb21ldGhpbmcg
bGlrZSAibXRrLGRpc2FibGUtZXh0cnN0IiB3b3VsZCBwcm9iYWJseQ0KPiBiZQ0KPiBhIGJldHRl
ciBwcm9wZXJ0eSBuYW1lLg0KPiANCj4gR3VlbnRlcg0KDQpUaGFua3MsIHRoZSBwcm9wZXJ0eSBu
YW1lIGhhcyBiZWVuIG1vZGlmaWVkLCBhbmQgcmVsYXRlZCBkdC1iaW5kaW5nDQpoYXMNCmJlZW4g
YWRkZWQsc2VlIHNlcmllcyA1NDE1NjcNCg0KQmVzdCBSZWdhcmRzDQpGZW5ncXVhbg0KDQo=

