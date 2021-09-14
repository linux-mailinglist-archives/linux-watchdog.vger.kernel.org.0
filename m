Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80FD340AE3D
	for <lists+linux-watchdog@lfdr.de>; Tue, 14 Sep 2021 14:51:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232664AbhINMw5 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 14 Sep 2021 08:52:57 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:19633 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S232476AbhINMw5 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 14 Sep 2021 08:52:57 -0400
X-UUID: b2371669948d48feb3cd6aa884af7e7b-20210914
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=o/ulPcGoC9qllHKs1jxpDbN0XZWElaGx7RjSMBlQ4ig=;
        b=jV8zBqkRw4rzwhGkurv3wsu21IV+vFZHCBjtkrlVU4ea3/cC8pHrB/nSJ9z0QGJuIrMfSknVtuYqIma+1WOibrqDu2SGaLn1LqnJzCwa9UVoGKx6imQ+HOmLY2tgI0sqdky6Rbj4xFMTERjtQ0n1ePRcnrSRxV7AIRhuMgzIhpQ=;
X-UUID: b2371669948d48feb3cd6aa884af7e7b-20210914
Received: from mtkcas34.mediatek.inc [(172.27.5.253)] by mailgw01.mediatek.com
        (envelope-from <fengquan.chen@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 593936125; Tue, 14 Sep 2021 20:51:33 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 14 Sep
 2021 20:51:32 +0800
Received: from mhfsdcap04 (10.17.3.154) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 14 Sep 2021 20:51:31 +0800
Message-ID: <39a7b3043e39db30394270a51a3ebca670f465d9.camel@mediatek.com>
Subject: Re: [v2,1/2] watchdog: mtk: add disable_wdt_extrst support
From:   Fengquan Chen <fengquan.chen@mediatek.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Matthias Brugger" <matthias.bgg@gmail.com>,
        <linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     <tinghan.shen@mediatek.com>, <randy.wu@mediatek.com>,
        <rex-bc.chen@mediatek.com>, <christine.zhu@mediatek.com>,
        <joe.yang@mediatek.com>, <zhishuang.zhang@mediatek.com>
Date:   Tue, 14 Sep 2021 20:51:33 +0800
In-Reply-To: <65cc931f-ba49-19b5-ce25-c49f7b984cec@roeck-us.net>
References: <20210903061623.10715-1-Fengquan.Chen@mediatek.com>
         <20210903061623.10715-2-Fengquan.Chen@mediatek.com>
         <65cc931f-ba49-19b5-ce25-c49f7b984cec@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 7696784DA0C6EE93EB3F11057021201EBE78BCE407BDF54B2280A17DDB698F292000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

T24gRnJpLCAyMDIxLTA5LTAzIGF0IDA3OjA1IC0wNzAwLCBHdWVudGVyIFJvZWNrIHdyb3RlOg0K
PiBPbiA5LzIvMjEgMTE6MTYgUE0sIEZlbmdxdWFuIENoZW4gd3JvdGU6DQo+ID4gSW4gc29tZSBj
YXNlcywgd2UgbWF5IG5lZWQgd2F0Y2hkb2cganVzdCB0byB0cmlnZ2VyIGFuDQo+ID4gaW50ZXJu
YWwgc29jIHJlc2V0IHdpdGhvdXQgc2VuZGluZyBhbnkgb3V0cHV0IHNpZ25hbC4NCj4gPiANCj4g
PiBQcm92aWRlIGEgZGlzYWJsZV93ZHRfZXh0cnN0IHBhcmFtZXRlciBmb3IgY29uZmlndXJhdGlv
bi4NCj4gPiBXZSBjYW4gZGlzYWJsZSBvciBlbmFibGUgaXQganVzdCBieSBjb25maWd1cmluZyBk
dHMuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogZmVuZ3F1YW4uY2hlbiA8ZmVuZ3F1YW4uY2hl
bkBtZWRpYXRlay5jb20+DQo+IA0KPiBOaXQ6IFlvdSBzaG91bGQgc2V0IHVwIGdpdCBzdWNoIHRo
YXQgaXQgdXNlcyAiRmVuZ3F1YW4gQ2hlbiIsIG5vdA0KPiAiZmVuZ3F1YW4uY2hlbiIuDQo+IA0K
PiBPdGhlciB0aGFuIHRoYXQsIGZvciBteSByZWZlcmVuY2UsDQo+IA0KPiBSZXZpZXdlZC1ieTog
R3VlbnRlciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0Pg0KPiANCj4gV2UnbGwgaGF2ZSB0byB3
YWl0IGZvciBkdCBwcm9wZXJ0eSBhcHByb3ZhbCBiZWZvcmUgd2UgY2FuIGFwcGx5IHRoZQ0KPiBw
YXRjaC4NCj4gDQo+IFRoYW5rcywNCj4gR3VlbnRlcg0KDQpUaGFua3MsIGkgaGF2ZSB1cGxvYWRl
ZCBhIG5ldyB2MyB0byBmaXggdGhlIHNpZ25lZC1vZmYgbmFtZSwNCmFuZCBtb3ZlIHRoZSBkdC1i
aW5kaW5nIHBhdGNoIHRvIHRoZSBmaXJzdCBwYXRjaC4NCg0KQmVzdCBSZWdhcmRzDQpGZW5ncXVh
bg0KDQo+IA0KPiA+IC0tLQ0KPiA+ICAgZHJpdmVycy93YXRjaGRvZy9tdGtfd2R0LmMgfCA3ICsr
KysrKysNCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykNCj4gPiANCj4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy93YXRjaGRvZy9tdGtfd2R0LmMNCj4gPiBiL2RyaXZlcnMvd2F0
Y2hkb2cvbXRrX3dkdC5jDQo+ID4gaW5kZXggOTdjYTk5M2JkMDA5Li4yNzZiNmNiN2QyMjUgMTAw
NjQ0DQo+ID4gLS0tIGEvZHJpdmVycy93YXRjaGRvZy9tdGtfd2R0LmMNCj4gPiArKysgYi9kcml2
ZXJzL3dhdGNoZG9nL210a193ZHQuYw0KPiA+IEBAIC02Myw2ICs2Myw3IEBAIHN0cnVjdCBtdGtf
d2R0X2RldiB7DQo+ID4gICAJdm9pZCBfX2lvbWVtICp3ZHRfYmFzZTsNCj4gPiAgIAlzcGlubG9j
a190IGxvY2s7IC8qIHByb3RlY3RzIFdEVF9TV1NZU1JTVCByZWcgKi8NCj4gPiAgIAlzdHJ1Y3Qg
cmVzZXRfY29udHJvbGxlcl9kZXYgcmNkZXY7DQo+ID4gKwlib29sIGRpc2FibGVfd2R0X2V4dHJz
dDsNCj4gPiAgIH07DQo+ID4gICANCj4gPiAgIHN0cnVjdCBtdGtfd2R0X2RhdGEgew0KPiA+IEBA
IC0yNDAsNiArMjQxLDggQEAgc3RhdGljIGludCBtdGtfd2R0X3N0YXJ0KHN0cnVjdCB3YXRjaGRv
Z19kZXZpY2UNCj4gPiAqd2R0X2RldikNCj4gPiAgIA0KPiA+ICAgCXJlZyA9IGlvcmVhZDMyKHdk
dF9iYXNlICsgV0RUX01PREUpOw0KPiA+ICAgCXJlZyAmPSB+KFdEVF9NT0RFX0lSUV9FTiB8IFdE
VF9NT0RFX0RVQUxfRU4pOw0KPiA+ICsJaWYgKG10a193ZHQtPmRpc2FibGVfd2R0X2V4dHJzdCkN
Cj4gPiArCQlyZWcgJj0gfldEVF9NT0RFX0VYUlNUX0VOOw0KPiA+ICAgCXJlZyB8PSAoV0RUX01P
REVfRU4gfCBXRFRfTU9ERV9LRVkpOw0KPiA+ICAgCWlvd3JpdGUzMihyZWcsIHdkdF9iYXNlICsg
V0RUX01PREUpOw0KPiA+ICAgDQo+ID4gQEAgLTMwOSw2ICszMTIsMTAgQEAgc3RhdGljIGludCBt
dGtfd2R0X3Byb2JlKHN0cnVjdA0KPiA+IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gPiAgIAkJ
aWYgKGVycikNCj4gPiAgIAkJCXJldHVybiBlcnI7DQo+ID4gICAJfQ0KPiA+ICsNCj4gPiArCW10
a193ZHQtPmRpc2FibGVfd2R0X2V4dHJzdCA9DQo+ID4gKwkJb2ZfcHJvcGVydHlfcmVhZF9ib29s
KGRldi0+b2Zfbm9kZSwgIm1lZGlhdGVrLGRpc2FibGUtDQo+ID4gZXh0cnN0Iik7DQo+ID4gKw0K
PiA+ICAgCXJldHVybiAwOw0KPiA+ICAgfQ0KPiA+ICAgDQo+ID4gDQo+IA0KPiANCg==

