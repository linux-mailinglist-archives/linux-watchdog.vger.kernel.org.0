Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A71CD231B49
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Jul 2020 10:35:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726710AbgG2Ifi (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 29 Jul 2020 04:35:38 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:44615 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726336AbgG2Ifi (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 29 Jul 2020 04:35:38 -0400
X-UUID: 4e4ab3a91fca403f94f31a95a30ab41b-20200729
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=Ia1XARyByvYXLRx9mXxEAiykte60Wo0wfVOMz7hQaag=;
        b=Rl600GB3WJS55HmIodQw2NddouKCMuQpzR3iK/EXrxGrXxktCQVCSUdqNxWi618HKp2lXzNforX5An9nlGrPahLi4nYoxVPnkja1gCH6bT2rLJRMYCQcu+idXxOst7WGBd4R+EnceL/k4k0zyhVkq9BEwhjH+AproaFgZnSGAjk=;
X-UUID: 4e4ab3a91fca403f94f31a95a30ab41b-20200729
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
        (envelope-from <crystal.guo@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 444962580; Wed, 29 Jul 2020 16:35:33 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs07n1.mediatek.inc
 (172.21.101.16) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 29 Jul
 2020 16:35:32 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 29 Jul 2020 16:35:30 +0800
Message-ID: <1596011707.11360.9.camel@mhfsdcap03>
Subject: Re: [v2,2/3] dt-bindings: watchdog: add a new head file for toprgu
 reset-controllers
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
Date:   Wed, 29 Jul 2020 16:35:07 +0800
In-Reply-To: <72d317ef-7f69-9e61-b1d5-23d660c58560@gmail.com>
References: <1596004249-28655-1-git-send-email-crystal.guo@mediatek.com>
         <1596004249-28655-3-git-send-email-crystal.guo@mediatek.com>
         <fb7ef8a7-5bbc-8e4b-7a23-c84f151587ba@gmail.com>
         <1596010313.11360.2.camel@mhfsdcap03>
         <72d317ef-7f69-9e61-b1d5-23d660c58560@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

T24gV2VkLCAyMDIwLTA3LTI5IGF0IDE2OjE1ICswODAwLCBNYXR0aGlhcyBCcnVnZ2VyIHdyb3Rl
Og0KPiANCj4gT24gMjkvMDcvMjAyMCAxMDoxMSwgQ3J5c3RhbCBHdW8gd3JvdGU6DQo+ID4gT24g
V2VkLCAyMDIwLTA3LTI5IGF0IDE1OjQyICswODAwLCBNYXR0aGlhcyBCcnVnZ2VyIHdyb3RlOg0K
PiA+PiBIaSBDcnlzdGFsLA0KPiA+Pg0KPiA+PiBPbiAyOS8wNy8yMDIwIDA4OjMwLCBDcnlzdGFs
IEd1byB3cm90ZToNCj4gPj4+IG1lcmdlIGFsbCB0aGUgcmVzZXQgbnVtYmVycyBpbiBvbmUgaGVh
ZCBmaWxlLg0KPiA+Pj4NCj4gPj4+IFNpZ25lZC1vZmYtYnk6IENyeXN0YWwgR3VvIDxjcnlzdGFs
Lmd1b0BtZWRpYXRlay5jb20+DQo+ID4+PiAtLS0NCj4gPj4+ICAgIGluY2x1ZGUvZHQtYmluZGlu
Z3MvcmVzZXQtY29udHJvbGxlci9tdGstcmVzZXRzLmggfCAxMyArKysrKysrKysrKysrDQo+ID4+
PiAgICAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKQ0KPiA+Pj4gICAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IGluY2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQtY29udHJvbGxlci9tdGstcmVzZXRz
LmgNCj4gPj4+DQo+ID4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kdC1iaW5kaW5ncy9yZXNldC1j
b250cm9sbGVyL210ay1yZXNldHMuaCBiL2luY2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQtY29udHJv
bGxlci9tdGstcmVzZXRzLmgNCj4gPj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4+PiBpbmRl
eCAwMDAwMDAwLi5kNzNhNGJhDQo+ID4+PiAtLS0gL2Rldi9udWxsDQo+ID4+PiArKysgYi9pbmNs
dWRlL2R0LWJpbmRpbmdzL3Jlc2V0LWNvbnRyb2xsZXIvbXRrLXJlc2V0cy5oDQo+ID4+PiBAQCAt
MCwwICsxLDEzIEBADQo+ID4+PiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAg
Ki8NCj4gPj4+ICsvKg0KPiA+Pj4gKyAqIENvcHlyaWdodCAoQykgMjAyMCBNZWRpYXRlayBJbmMu
DQo+ID4+PiArICoNCj4gPj4+ICsgKi8NCj4gPj4+ICsNCj4gPj4+ICsjaWZuZGVmIF9EVF9CSU5E
SU5HU19SRVNFVF9DT05UUk9MTEVSX01USw0KPiA+Pj4gKyNkZWZpbmUgX0RUX0JJTkRJTkdTX1JF
U0VUX0NPTlRST0xMRVJfTVRLDQo+ID4+PiArDQo+ID4+PiArI2RlZmluZSBNVDI3MTJfVE9QUkdV
X1NXX1JTVF9OVU0JMTENCj4gPj4+ICsjZGVmaW5lIE1UODE4M19UT1BSR1VfU1dfUlNUX05VTSAg
ICAgICAgMTkNCj4gPj4NCj4gPj4gTWF5YmUgSSBkaWRuJ3QgZXhwbGFpbiBteXNlbGYgcHJvcGVy
bHkuIFdlIHdhbnQgdG8gaGF2ZSBhbGwgcmVzZXRzIGluIG9uZSBmaWxlDQo+ID4+IGFuZCBkbyBu
b3Qgd2FudCB0byBoYXZlIHRoZSByZXNldHMgZm9yIHRoZSB3YXRjaGRvZyBpbiBhIGRpZmZlcmVu
dCBmaWxlLiBUaGF0DQo+ID4+IG1lYW5zIEkgZG9uJ3QgdGhpbiB5b3VyIHBhdGNoIGlzIGNvcnJl
Y3QgYW5kIHRoZSBlZmZvcnQgc2hvdWxkIGJlIGFiYW5kb25lZC4NCj4gPj4NCj4gPj4gUmVnYXJk
cywNCj4gPj4gTWF0dGhpYXMNCj4gPiANCj4gPiBEbyB5b3UgbWVhbiB0byBrZWVwIHRoZSBjdXJy
ZW50IHdheSB1bmNoYW5nZWQ/IEZvciBleGFtcGxlLCB3aXRoIGEgbmV3DQo+ID4gU09DIDgxOTIs
IHNob3VsZCBhZGQgYSBuZXcgaGVhZCBmaWxlIG10ODE5Ml9yZXNldHMuaCBmb3IgdGhlIHJlc2V0
cw0KPiA+IG51bWJlcnMuDQo+ID4gDQo+IA0KPiBFeGFjdGx5Lg0KPiANCj4gUmVnYXJkcywNCj4g
TWF0dGhpYXMNCg0KT0ssIGJ1dCB0aGUgZHQtYmluZGluZyBtdGstd2R0LnR4dCBzdGlsbCBuZWVk
IHRvIHVwZGF0ZSwgcGxlYXNlIGhlbHAgbWUNCnRvIHJldmlldywgbWFueSB0aGFua3N+DQoNCg==

