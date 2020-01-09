Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BE6A135212
	for <lists+linux-watchdog@lfdr.de>; Thu,  9 Jan 2020 04:59:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727746AbgAID7i (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 8 Jan 2020 22:59:38 -0500
Received: from Mailgw01.mediatek.com ([1.203.163.78]:35446 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726913AbgAID7h (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 8 Jan 2020 22:59:37 -0500
X-UUID: 680714b8ecd04aeeb45eaea5ad274877-20200109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=KCps6BgWrvdtsekJVTQpLbQ7cnpqG3IPNr8iggRA7dM=;
        b=ho+sL122t//pXEShp7xu2qqXD4Jfem52dZMrA54A+CSHK9bzs7t7EzmRvsCTlml02icv1dXggfeysvFkwekJS7wbAPuk72kVutgjrx7bNSIdfvHQkJf7NMeSq2GwAVhOhQk4zhZb7l/E3XgRW1lLIfFsEN7Ern/85328KKXL6+4=;
X-UUID: 680714b8ecd04aeeb45eaea5ad274877-20200109
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <yong.liang@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 363496259; Thu, 09 Jan 2020 11:59:32 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Thu, 9 Jan
 2020 11:58:19 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 9 Jan 2020 11:59:40 +0800
Message-ID: <1578542359.20923.16.camel@mhfsdcap03>
Subject: Re: [PATCH v3 1/2] amr64: dts: modify mt8183.dtsi
From:   Yong Liang <yong.liang@mediatek.com>
To:     Nicolas Boichat <drinkcat@chromium.org>
CC:     Mark Rutland <mark.rutland@arm.com>,
        Devicetree List <devicetree@vger.kernel.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Date:   Thu, 9 Jan 2020 11:59:19 +0800
In-Reply-To: <CANMq1KB4PzAUdp03go0Ur_khi2bM3+oNUhHtMK=--V6DmGXiDA@mail.gmail.com>
References: <20191227141405.3396-1-yong.liang@mediatek.com>
         <20191227141405.3396-2-yong.liang@mediatek.com>
         <CANMq1KD=jAPn4Y7zQZrsg9FB7Cq6tNX0R8OF4qX21Sjy2=0Naw@mail.gmail.com>
         <CANMq1KB4PzAUdp03go0Ur_khi2bM3+oNUhHtMK=--V6DmGXiDA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 54C315E0B98D2A87DB338729E419450348F525FF59E3EDFD3BC0ECB9CBA3B6422000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

T24gV2VkLCAyMDIwLTAxLTA4IGF0IDE3OjE0ICswODAwLCBOaWNvbGFzIEJvaWNoYXQgd3JvdGU6
DQo+IE9uIFdlZCwgSmFuIDgsIDIwMjAgYXQgNDo1NiBQTSBOaWNvbGFzIEJvaWNoYXQgPGRyaW5r
Y2F0QGNocm9taXVtLm9yZz4gd3JvdGU6DQo+ID4NCj4gPiBtaW5vciBuaXQsIHMvYW1yNjQvYXJt
NjQvIGluIHRoZSBjb21taXQgdGl0bGUuDQo+ID4NCj4gPiBPbiBGcmksIERlYyAyNywgMjAxOSBh
dCAxMDoxNSBQTSBZb25nIExpYW5nIDx5b25nLmxpYW5nQG1lZGlhdGVrLmNvbT4gd3JvdGU6DQo+
ID4gPg0KPiA+ID4gRnJvbTogInlvbmcubGlhbmciIDx5b25nLmxpYW5nQG1lZGlhdGVrLmNvbT4N
Cj4gPiA+DQo+ID4gPiAxLiBJbmNsdWRlIG10ODE4My1yZXNldC5oIGFuZCBhZGQgcmVzZXQtY2Vs
bHMgaW4gaW5mcmFjZmcNCj4gPiA+IGluIGR0c2kgZmlsZQ0KPiANCj4gRXJyLCB3YWl0LCBkb2Vz
bid0IHRoaXMgZGVwZW5kIG9uDQo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL3BpcGVybWFp
bC9saW51eC1tZWRpYXRlay8yMDIwLUphbnVhcnkvMDI2MTcwLmh0bWwNCj4gPw0KPiANCiAgWWVz
LCBidXQgdGhpcyBwYXRjaCBjYW4gYmUgZGVsYXkgYSB3aGlsZSwgV2Ugd2lsbCBlbnN1cmUgamlh
eGluJ3MNCnBhdGNoIGJlIHNlbmQgb3V0IHByaW9yaXRseS4NCg0KICBZb25nLkxpYW5nDQoNCj4g
PiA+IDIuIEFkZCB3YXRjaGRvZyBkZXZpY2Ugbm9kZQ0KPiANCj4gQ2FuIHdlIGhhdmUgYSBwYXRj
aCB3aXRoIGp1c3QgdGhpcyBjaGFuZ2UgaW5zdGVhZCwgc2luY2UgeW91J3JlDQo+IHNlbmRpbmcg
dGhlIGJpbmRpbmcgd2l0aCBpdC4NCg0KICBJIHdpbGwgcmVtb3ZlIGJpbmRpbmcgdHh0IGZpbGUg
ZnJvbSB0aGlzIHBhdGNoLg0KICBBbmQgd2Ugd2lsbCBlbnN1cmUgamlheGluJ3MgcGF0Y2ggYmUg
c2VuZCBvdXQgcHJpb3JpdGx5Lg0KDQo+IA0KPiA+ID4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IHlv
bmcubGlhbmcgPHlvbmcubGlhbmdAbWVkaWF0ZWsuY29tPg0KPiA+DQo+ID4gVGVzdGVkLWJ5OiBO
aWNvbGFzIEJvaWNoYXQgPGRyaW5rY2F0QGNocm9taXVtLm9yZz4NCj4gPg0KPiA+ID4gLS0tDQo+
ID4gPiAgYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxODMuZHRzaSB8IDggKysrKysr
KysNCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspDQo+ID4gPiBbc25pcF0N
Cj4gDQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+
IExpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdA0KPiBMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZy
YWRlYWQub3JnDQo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbWVkaWF0ZWsNCg0K

