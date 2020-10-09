Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDC092880B9
	for <lists+linux-watchdog@lfdr.de>; Fri,  9 Oct 2020 05:32:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726629AbgJIDcO (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 8 Oct 2020 23:32:14 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:54877 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725852AbgJIDcN (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 8 Oct 2020 23:32:13 -0400
X-UUID: 8274023f4769476d8b4d0661c6ed9f3e-20201009
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=1HaRwt9KZRuG82gLiMzWVii7cTKcFQ+KMRXeg2N/U/U=;
        b=IoCv8G/jtIq6OJWcXSdQKwI6gNRtVFKOcU5Q6vwRUpHINNklfH5wPI3VWjGOmFfRFSSM8GQ6TcOkE1YUUACLI3fSxCtCvc+PDm4p15HexmJjldgHMHQHvD2VIrMkHmmdBx1frLG0+uc6vTdwqBchvqFraBf2XmMhiecknJQcGQs=;
X-UUID: 8274023f4769476d8b4d0661c6ed9f3e-20201009
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw01.mediatek.com
        (envelope-from <crystal.guo@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1934595384; Fri, 09 Oct 2020 11:32:07 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs07n2.mediatek.inc
 (172.21.101.141) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 9 Oct
 2020 11:32:04 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 9 Oct 2020 11:32:03 +0800
Message-ID: <1602214325.14806.49.camel@mhfsdcap03>
Subject: Re: [v5,2/4] dt-binding: mediatek: mt8192: update mtk-wdt document
From:   Crystal Guo <crystal.guo@mediatek.com>
To:     Matthias Brugger <matthias.bgg@gmail.com>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
CC:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        Seiya Wang =?UTF-8?Q?=28=E7=8E=8B=E8=BF=BA=E5=90=9B=29?= 
        <seiya.wang@mediatek.com>
Date:   Fri, 9 Oct 2020 11:32:05 +0800
In-Reply-To: <2199f623-ebfc-3585-2248-6698aef57d7b@gmail.com>
References: <20200929032005.15169-1-crystal.guo@mediatek.com>
         <20200929032005.15169-3-crystal.guo@mediatek.com>
         <2199f623-ebfc-3585-2248-6698aef57d7b@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

T24gRnJpLCAyMDIwLTEwLTAyIGF0IDE3OjI4ICswODAwLCBNYXR0aGlhcyBCcnVnZ2VyIHdyb3Rl
Og0KPiANCj4gT24gMjkvMDkvMjAyMCAwNToyMCwgQ3J5c3RhbCBHdW8gd3JvdGU6DQo+ID4gdXBk
YXRlIG10ay13ZHQgZG9jdW1lbnQgZm9yIE1UODE5MiBwbGF0Zm9ybQ0KPiA+IA0KPiA+IFNpZ25l
ZC1vZmYtYnk6IENyeXN0YWwgR3VvIDxjcnlzdGFsLmd1b0BtZWRpYXRlay5jb20+DQo+ID4gUmV2
aWV3ZWQtYnk6IE1hdHRoaWFzIEJydWdnZXIgPG1hdHRoaWFzLmJnZ0BnbWFpbC5jb20+DQo+ID4g
UmV2aWV3ZWQtYnk6IEd1ZW50ZXIgUm9lY2sgPGxpbnV4QHJvZWNrLXVzLm5ldD4NCj4gDQo+IFlv
dSBhZGRlZCBHdWVudGVycyBSZXZpZXdlZC1ieSBpbiB2NCBvZiB0aGlzIHNlcmllcywgYnV0IEkg
ZG9uJ3Qgc2VlIHRoYXQgb24gDQo+IEd1ZW50ZXIgcHJvdmlkZWQgdGhpcyB0YWcuIEluIHRoZSBm
dXR1cmUgcGxlYXNlIG1ha2Ugc3VyZSB0aGF0IHlvdSBkb24ndCBhZGQgDQo+IHRhZ3MgdG8geW91
ciBwYXRjaGVzIHRoYXQgd2VyZSBub3QgcHJvdmlkZWQuIFRoaXMgY3JlYXRlcyBncmVhdCBjb25m
dXNpb24uDQo+IA0KPiBSZWdhcmRzLA0KPiBNYXR0aGlhcw0KPiANCg0KSGkgR3VlbnRlciwNCg0K
U2hvdWxkIEkgcmVtb3ZlIHRoZSAiUmV2aWV3ZWQtYnk6R3VlbnRlciIgdGFnLCBhbmQgcmUtc3Vi
bWl0IHRoaXMgcGF0Y2gNCmZvciB5b3VyIHJldmlldywgb3Iga2VlcGluZyB0aGUgc3RhdHVzIHF1
byBhbmQgd2FpdCBmb3IgV2ltJ3MgY29tbWVudD8NCg0KVGhhbmtzDQpDcnlzdGFsDQo+ID4gLS0t
DQo+ID4gICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvd2F0Y2hkb2cvbXRrLXdk
dC50eHQgfCAxICsNCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPiA+IA0K
PiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvd2F0Y2hk
b2cvbXRrLXdkdC50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvd2F0Y2hk
b2cvbXRrLXdkdC50eHQNCj4gPiBpbmRleCA0NWVlZGMyYzMxNDEuLmUzNmJhNjBkZTgyOSAxMDA2
NDQNCj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvd2F0Y2hkb2cv
bXRrLXdkdC50eHQNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
d2F0Y2hkb2cvbXRrLXdkdC50eHQNCj4gPiBAQCAtMTIsNiArMTIsNyBAQCBSZXF1aXJlZCBwcm9w
ZXJ0aWVzOg0KPiA+ICAgCSJtZWRpYXRlayxtdDc2Mjktd2R0IiwgIm1lZGlhdGVrLG10NjU4OS13
ZHQiOiBmb3IgTVQ3NjI5DQo+ID4gICAJIm1lZGlhdGVrLG10ODE4My13ZHQiOiBmb3IgTVQ4MTgz
DQo+ID4gICAJIm1lZGlhdGVrLG10ODUxNi13ZHQiLCAibWVkaWF0ZWssbXQ2NTg5LXdkdCI6IGZv
ciBNVDg1MTYNCj4gPiArCSJtZWRpYXRlayxtdDgxOTItd2R0IjogZm9yIE1UODE5Mg0KPiA+ICAg
DQo+ID4gICAtIHJlZyA6IFNwZWNpZmllcyBiYXNlIHBoeXNpY2FsIGFkZHJlc3MgYW5kIHNpemUg
b2YgdGhlIHJlZ2lzdGVycy4NCj4gPiAgIA0KPiA+IA0KDQo=

