Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B903232997
	for <lists+linux-watchdog@lfdr.de>; Thu, 30 Jul 2020 03:35:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726287AbgG3Bfu (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 29 Jul 2020 21:35:50 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:16032 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726194AbgG3Bfu (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 29 Jul 2020 21:35:50 -0400
X-UUID: 95aa0a724cb341fbb607e4a31a9b81c8-20200730
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=Gf/Mo8xD23Vb19E0FPpkZ0VSoaVgKK6weloMaegtMYM=;
        b=ixe0Z2+Ot/DWdm2oYuiS2Vx9b0YCFNpzBt1gc5TXw31ClcDHQ7Q7P/B0Fu0mc5IPjCHAjGxzXVPILGFvEaEem4hN+9BX8lL/AQzoBZo6FrcnRTuPV6vdym0p4Y1HnL6NOaLTxHyG4FvQnzg8lHhxUfvwIpRQ4ekn5jwocgbkQ84=;
X-UUID: 95aa0a724cb341fbb607e4a31a9b81c8-20200730
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
        (envelope-from <crystal.guo@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1527585400; Thu, 30 Jul 2020 09:35:47 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs02n1.mediatek.inc
 (172.21.101.77) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 30 Jul
 2020 09:35:39 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 30 Jul 2020 09:35:38 +0800
Message-ID: <1596072913.11360.12.camel@mhfsdcap03>
Subject: Re: [v2,1/3] dt-binding: mediatek: mt8192: update mtk-wdt document
From:   Crystal Guo <crystal.guo@mediatek.com>
To:     Matthias Brugger <matthias.bgg@gmail.com>
CC:     "linux@roeck-us.net" <linux@roeck-us.net>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        Seiya Wang =?UTF-8?Q?=28=E7=8E=8B=E8=BF=BA=E5=90=9B=29?= 
        <seiya.wang@mediatek.com>,
        Erin Lo =?UTF-8?Q?=28=E7=BE=85=E9=9B=85=E9=BD=A1=29?= 
        <erin.lo@mediatek.com>
Date:   Thu, 30 Jul 2020 09:35:13 +0800
In-Reply-To: <c6ea8852-0381-0924-185e-083ea167f8fa@gmail.com>
References: <1596016922-13184-1-git-send-email-crystal.guo@mediatek.com>
         <1596016922-13184-2-git-send-email-crystal.guo@mediatek.com>
         <c6ea8852-0381-0924-185e-083ea167f8fa@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

T24gV2VkLCAyMDIwLTA3LTI5IGF0IDE4OjE4ICswODAwLCBNYXR0aGlhcyBCcnVnZ2VyIHdyb3Rl
Og0KPiANCj4gT24gMjkvMDcvMjAyMCAxMjowMiwgQ3J5c3RhbCBHdW8gd3JvdGU6DQo+ID4gdXBk
YXRlIG10ay13ZHQgZG9jdW1lbnQgZm9yIE1UODE5MiBwbGF0Zm9ybQ0KPiANCj4gDQo+IHNob3Vs
ZCBiZSB0d28gcGF0Y2hlcy4gb25lIGZpeGluZyB0aGUgY29tcGF0aWJsZXMgYW5kIHNlY29uZCBh
ZGRpbmcgbmV3IGJvYXJkLg0KPiANCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBDcnlzdGFsIEd1
byA8Y3J5c3RhbC5ndW9AbWVkaWF0ZWsuY29tPg0KPiA+IC0tLQ0KPiA+ICAgRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3dhdGNoZG9nL210ay13ZHQudHh0IHwgNSArKystLQ0KPiA+
ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gPiAN
Cj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3dhdGNo
ZG9nL210ay13ZHQudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3dhdGNo
ZG9nL210ay13ZHQudHh0DQo+ID4gaW5kZXggNGRkMzZiZC4uZTM2YmE2MCAxMDA2NDQNCj4gPiAt
LS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvd2F0Y2hkb2cvbXRrLXdkdC50
eHQNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvd2F0Y2hkb2cv
bXRrLXdkdC50eHQNCj4gPiBAQCAtNCwxNCArNCwxNSBAQCBSZXF1aXJlZCBwcm9wZXJ0aWVzOg0K
PiA+ICAgDQo+ID4gICAtIGNvbXBhdGlibGUgc2hvdWxkIGNvbnRhaW46DQo+ID4gICAJIm1lZGlh
dGVrLG10MjcwMS13ZHQiLCAibWVkaWF0ZWssbXQ2NTg5LXdkdCI6IGZvciBNVDI3MDENCj4gPiAt
CSJtZWRpYXRlayxtdDI3MTItd2R0IiwgIm1lZGlhdGVrLG10NjU4OS13ZHQiOiBmb3IgTVQyNzEy
DQo+ID4gKwkibWVkaWF0ZWssbXQyNzEyLXdkdCI6IGZvciBNVDI3MTINCj4gPiAgIAkibWVkaWF0
ZWssbXQ2NTg5LXdkdCI6IGZvciBNVDY1ODkNCj4gPiAgIAkibWVkaWF0ZWssbXQ2Nzk3LXdkdCIs
ICJtZWRpYXRlayxtdDY1ODktd2R0IjogZm9yIE1UNjc5Nw0KPiA+ICAgCSJtZWRpYXRlayxtdDc2
MjItd2R0IiwgIm1lZGlhdGVrLG10NjU4OS13ZHQiOiBmb3IgTVQ3NjIyDQo+ID4gICAJIm1lZGlh
dGVrLG10NzYyMy13ZHQiLCAibWVkaWF0ZWssbXQ2NTg5LXdkdCI6IGZvciBNVDc2MjMNCj4gPiAg
IAkibWVkaWF0ZWssbXQ3NjI5LXdkdCIsICJtZWRpYXRlayxtdDY1ODktd2R0IjogZm9yIE1UNzYy
OQ0KPiA+IC0JIm1lZGlhdGVrLG10ODE4My13ZHQiLCAibWVkaWF0ZWssbXQ2NTg5LXdkdCI6IGZv
ciBNVDgxODMNCj4gPiArCSJtZWRpYXRlayxtdDgxODMtd2R0IjogZm9yIE1UODE4Mw0KPiANCj4g
V2Ugd2lsbCBuZWVkIHRvIHVwZGF0ZSB0aGUgRFRTSSBpbiBhIHNlcGVyYXRlIHBhdGNoIGFzIHdl
bGwuDQoNClllcywgdGhpcyBwYXRjaCBpcyBiYXNlZCBvbg0KaHR0cHM6Ly9wYXRjaHdvcmsua2Vy
bmVsLm9yZy9wYXRjaC8xMTY5MDQwMS8gLCB3aGljaCBtb2RpZnkgZGVzY3JpcHRpb24NCmZvciBt
dDI3MTIgYW5kIG10ODE4My4NCg0KPiANCj4gPiAgIAkibWVkaWF0ZWssbXQ4NTE2LXdkdCIsICJt
ZWRpYXRlayxtdDY1ODktd2R0IjogZm9yIE1UODUxNg0KPiA+ICsJIm1lZGlhdGVrLG10ODE5Mi13
ZHQiOiBmb3IgTVQ4MTkyDQo+ID4gICANCj4gPiAgIC0gcmVnIDogU3BlY2lmaWVzIGJhc2UgcGh5
c2ljYWwgYWRkcmVzcyBhbmQgc2l6ZSBvZiB0aGUgcmVnaXN0ZXJzLg0KPiA+ICAgDQo+ID4gDQoN
Cg==

