Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB9E32E2DB7
	for <lists+linux-watchdog@lfdr.de>; Sat, 26 Dec 2020 09:56:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725995AbgLZI4n (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 26 Dec 2020 03:56:43 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:36469 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725967AbgLZI4m (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 26 Dec 2020 03:56:42 -0500
X-UUID: 284624398b55469e8b1114820e51e12d-20201226
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=O8MvIzbgoKP0EJFUCZCWVgh+fi1X2o9IdCQSOOz75XU=;
        b=mfoIGD3BMNLAhuX0tVP+8pCUbuybGmEgiboapJzSh9WU6cxfhGqDudx5hgyZVH9D7n/4geVwKVRPqqDTTE3l1KD9ZmLEP0zttT19xbmL4IczcWepvK5HNMKCHdpPvFeaPLsz6E679QOTtX9kj4yImRB7zsvOYgV3F6T3djeCAg0=;
X-UUID: 284624398b55469e8b1114820e51e12d-20201226
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw02.mediatek.com
        (envelope-from <crystal.guo@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1409887270; Sat, 26 Dec 2020 16:55:49 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs07n2.mediatek.inc
 (172.21.101.141) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Sat, 26 Dec
 2020 16:55:43 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 26 Dec 2020 16:55:42 +0800
Message-ID: <1608972946.14806.75.camel@mhfsdcap03>
Subject: Re: [v6,2/4] dt-binding: mediatek: mt8192: update mtk-wdt document
From:   Crystal Guo <crystal.guo@mediatek.com>
To:     Nicolas Boichat <drinkcat@chromium.org>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
CC:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Seiya Wang =?UTF-8?Q?=28=E7=8E=8B=E8=BF=BA=E5=90=9B=29?= 
        <seiya.wang@mediatek.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Date:   Sat, 26 Dec 2020 16:55:46 +0800
In-Reply-To: <CANMq1KDB5W9ON0+ormDjFy=9oJUnAq4A41zNTUMHcWsAJ449Zg@mail.gmail.com>
References: <20201014131936.20584-1-crystal.guo@mediatek.com>
         <20201014131936.20584-3-crystal.guo@mediatek.com>
         <1605529631.14806.57.camel@mhfsdcap03>
         <CANMq1KDB5W9ON0+ormDjFy=9oJUnAq4A41zNTUMHcWsAJ449Zg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

T24gTW9uLCAyMDIwLTEyLTIxIGF0IDA4OjU5ICswODAwLCBOaWNvbGFzIEJvaWNoYXQgd3JvdGU6
DQo+IE9uIE1vbiwgTm92IDE2LCAyMDIwIGF0IDg6MjcgUE0gQ3J5c3RhbCBHdW8gPGNyeXN0YWwu
Z3VvQG1lZGlhdGVrLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBIaSBNYWludGFpbmVycywNCj4gPg0K
PiA+IEdlbnRsZSBwaW4gZm9yIHRoaXMgcGF0Y2guDQo+ID4NCj4gPiBUaGFua3MNCj4gPg0KPiA+
IE9uIFdlZCwgMjAyMC0xMC0xNCBhdCAyMToxOSArMDgwMCwgQ3J5c3RhbCBHdW8gd3JvdGU6DQo+
ID4gPiB1cGRhdGUgbXRrLXdkdCBkb2N1bWVudCBmb3IgTVQ4MTkyIHBsYXRmb3JtDQo+IA0KPiBS
b2I6IEkgYXNzdW1lIHlvdXIgaW5wdXQgaXMgcmVxdWlyZWQgaGVyZT8gQW55IGNoYW5jZSB3ZSBj
b3VsZCBoYXZlDQo+IHlvdXIgYWNrL3JldmlldyBvbiB0aGlzIHRyaXZpYWwgcGF0Y2g/IEl0IHNl
ZW1zIGxpa2UgdGhlIHNlcmllcyBpcw0KPiBibG9ja2VkIHBlbmRpbmcgb24gYSByZXZpZXcgb2Yg
dGhpcyBwYXRjaCAtLSBhbmQgSSBkb24ndCB0aGluayBpdCBoYXMNCj4gYmVlbiByZXZpZXdlZCBi
ZWZvcmUuDQo+IA0KPiBUaGFua3MsDQo+IA0KPiANCg0KSGkgTWFpbnRhaW5lcnMsDQoNCkp1c3Qg
YSBnZW50bGUgcGluZywgY2FuIHlvdSBoZWxwIHRvIHJldmlldyBvciBnaXZlIHNvbWUgc3VnZ2Vz
dGlvbnMNCmFib3V0IHRoaXMgcGF0Y2ggc2V0Pw0KDQpNYW55IHRoYW5rcy4NCg0KPiA+ID4NCj4g
PiA+IFNpZ25lZC1vZmYtYnk6IENyeXN0YWwgR3VvIDxjcnlzdGFsLmd1b0BtZWRpYXRlay5jb20+
DQo+ID4gPiAtLS0NCj4gPiA+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvd2F0
Y2hkb2cvbXRrLXdkdC50eHQgfCAxICsNCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKykNCj4gPiA+DQo+ID4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3dhdGNoZG9nL210ay13ZHQudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3dhdGNoZG9nL210ay13ZHQudHh0DQo+ID4gPiBpbmRleCA0NWVlZGMyYzMxNDEu
LmUzNmJhNjBkZTgyOSAxMDA2NDQNCj4gPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy93YXRjaGRvZy9tdGstd2R0LnR4dA0KPiA+ID4gKysrIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3dhdGNoZG9nL210ay13ZHQudHh0DQo+ID4gPiBAQCAtMTIs
NiArMTIsNyBAQCBSZXF1aXJlZCBwcm9wZXJ0aWVzOg0KPiA+ID4gICAgICAgIm1lZGlhdGVrLG10
NzYyOS13ZHQiLCAibWVkaWF0ZWssbXQ2NTg5LXdkdCI6IGZvciBNVDc2MjkNCj4gPiA+ICAgICAg
ICJtZWRpYXRlayxtdDgxODMtd2R0IjogZm9yIE1UODE4Mw0KPiA+ID4gICAgICAgIm1lZGlhdGVr
LG10ODUxNi13ZHQiLCAibWVkaWF0ZWssbXQ2NTg5LXdkdCI6IGZvciBNVDg1MTYNCj4gPiA+ICsg
ICAgICJtZWRpYXRlayxtdDgxOTItd2R0IjogZm9yIE1UODE5Mg0KPiA+ID4NCj4gPiA+ICAtIHJl
ZyA6IFNwZWNpZmllcyBiYXNlIHBoeXNpY2FsIGFkZHJlc3MgYW5kIHNpemUgb2YgdGhlIHJlZ2lz
dGVycy4NCj4gPiA+DQo+ID4NCj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXw0KPiA+IExpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdA0KPiA+IExpbnV4
LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcNCj4gPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrDQoNCg==

