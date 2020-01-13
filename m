Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1DECE138DF7
	for <lists+linux-watchdog@lfdr.de>; Mon, 13 Jan 2020 10:42:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727494AbgAMJl5 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 13 Jan 2020 04:41:57 -0500
Received: from mailgw02.mediatek.com ([1.203.163.81]:57382 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725978AbgAMJl5 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 13 Jan 2020 04:41:57 -0500
X-UUID: d4f4942aaa794b93ac2c4d6174355c9d-20200113
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=S0IU+IlcBs9/Y/kx+XkqovfN2BvG7GbCFGZg+SIoQY8=;
        b=GoFdUuDxf6ZePGlRa9Ume0doVpfMw1s5gYrZHzoqWXjEa/xWS6BxUH/FkNeRWGWqfNWlKpQQV+XTozXD/GopKX2ihcpuEABYJ48eNEr5YB9AjHyDfdMiZy0jiPSXJx2u3fMFxpW1gbwTfQoTnfMReUHrisFwCmZtqG8do4XrVak=;
X-UUID: d4f4942aaa794b93ac2c4d6174355c9d-20200113
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <yong.liang@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 288412862; Mon, 13 Jan 2020 17:41:50 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Mon, 13 Jan
 2020 17:40:36 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 13 Jan 2020 17:41:10 +0800
Message-ID: <1578908504.20923.25.camel@mhfsdcap03>
Subject: Re: [PATCH v3 1/2] amr64: dts: modify mt8183.dtsi
From:   Yong Liang <yong.liang@mediatek.com>
To:     Nicolas Boichat <drinkcat@chromium.org>
CC:     Matthias Brugger <matthias.bgg@gmail.com>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Devicetree List <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        Jiaxin Yu =?UTF-8?Q?=28=E4=BF=9E=E5=AE=B6=E9=91=AB=29?= 
        <Jiaxin.Yu@mediatek.com>,
        "Sj Huang =?UTF-8?Q?=28=E9=BB=83=E4=BF=A1=E7=92=8B=29?=" 
        <sj.huang@mediatek.com>
Date:   Mon, 13 Jan 2020 17:41:44 +0800
In-Reply-To: <CANMq1KCLGx2K5qSVJLFkFqYjghVk40HaZcBeUmSxpBSJQAMOzg@mail.gmail.com>
References: <20191227141405.3396-1-yong.liang@mediatek.com>
         <20191227141405.3396-2-yong.liang@mediatek.com>
         <CANMq1KD=jAPn4Y7zQZrsg9FB7Cq6tNX0R8OF4qX21Sjy2=0Naw@mail.gmail.com>
         <CANMq1KB4PzAUdp03go0Ur_khi2bM3+oNUhHtMK=--V6DmGXiDA@mail.gmail.com>
         <2bbd8f47-fe68-574c-cbe9-bcc680dd4c84@gmail.com>
         <CANMq1KCXMUP=5ijqLsZ67MvO2ROFkG0vSX64KqmWtYKm7w8f2g@mail.gmail.com>
         <CANMq1KCLGx2K5qSVJLFkFqYjghVk40HaZcBeUmSxpBSJQAMOzg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 8790C72DB21B4EEB78AB1FFA7DCBD2718DE0EE4272E3427235AA391B91F06AFE2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

T24gTW9uLCAyMDIwLTAxLTEzIGF0IDE0OjI3ICswODAwLCBOaWNvbGFzIEJvaWNoYXQgd3JvdGU6
DQo+ICtKaWF4aW4gK1NqIEh1YW5nDQo+IA0KPiBPbiBNb24sIEphbiAxMywgMjAyMCBhdCAxMjo0
NCBQTSBOaWNvbGFzIEJvaWNoYXQgPGRyaW5rY2F0QGNocm9taXVtLm9yZz4gd3JvdGU6DQo+ID4N
Cj4gPiBPbiBGcmksIEphbiAxMCwgMjAyMCBhdCA2OjA5IFBNIE1hdHRoaWFzIEJydWdnZXIgPG1h
dHRoaWFzLmJnZ0BnbWFpbC5jb20+IHdyb3RlOg0KPiA+ID4gW3NuaXBdDQo+ID4gPiBUaGF0J3Mg
YWxsIGEgYml0IGNvbmZ1c2luZywgSSB0aG91Z2h0IHdlIGFyZSBmaW5lIHRvIGFkZCB0aGUgcmVz
ZXQgY2VsbHMgdG8NCj4gPiA+IGluZnJhY2ZnIGFzIHdlIGhhdmUgdGhlIHJlc2V0cyBkZWZpbmVk
IGluDQo+ID4gPiA2NGViYjU3YTNkZjYgKCJjbGs6IHJlc2V0OiBNb2RpZnkgcmVzZXQtY29udHJv
bGxlciBkcml2ZXIiKQ0KPiA+DQo+ID4gWW91J3JlIHJpZ2h0LCB3ZSdyZSBmaW5lLiBCdXQgYXQg
bGVhc3QgaW4gdGhlb3J5LCB3ZSBzaG91bGQgc3RpbGwgaGF2ZQ0KPiA+IHRoZSBiaW5kaW5nIGRv
Y3VtZW50YXRpb24gdGhhdCBJIGxpbmtlZCBhYm92ZS4NCj4gPg0KPiA+IEkgd2lsbCB0cnkgdG8g
cGljayB1cCBhbGwgdGhlIHJlcXVpcmVkIHBhdGNoZXMsIHNwbGl0IHRoZW0gYWNyb3NzDQo+ID4g
ODE4My8yNzEyIGFuZCByZXNlbmQgYXMgb25lIHNlcmllcy4NCj4gDQo+IE9rYXksIHN1bW1hcnkg
b2YgdGhlIHBhdGNoZXMsIHRoZXJlIGFyZSAyIHNlcmllczoNCj4gDQo+IGh0dHBzOi8vcGF0Y2h3
b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTEzMTEyMzcvDQo+IFsxLjFdIFt2MywxLzJdIGFtcjY0OiBk
dHM6IG1vZGlmeSBtdDgxODMuZHRzaQ0KPiAgID0+IFBhcnRpYWxseSBhcHBsaWVkIHRvIE1hdHRo
aWFzJyB2NS41LW5leHQvZHRzNjQNCj4gICA9PiBPdGhlciBwYXJ0IGRlcGVuZCBvbiBbMS4yXSwg
bmVlZHMgdG8gYmUgYXBwbGllZA0KPiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNo
LzExMzExMjQxLw0KPiBbMS4yXSBbdjMsMi8yXSBkdC1iaW5kaW5nczogbXQ4MTgzOiBBZGQgd2F0
Y2hkb2cgZHQtYmluZGluZw0KPiAgID0+IFBlbmRpbmcgR3VlbnRlci9XaW0NCj4gDQo+IGh0dHBz
Oi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvY292ZXIvMTEzMjY3NTcvDQo+IFsyLjBdIFtQQVRDSCB2
MTEgMC8zXSBBU29DOiBtdDgxODM6IGZpeCBhdWRpbyBwbGF5YmFjayBzbG93bHkgYWZ0ZXIgcGxh
eWJhY2sNCj4gWzIuMV0gW1BBVENIIHYxMSAxLzNdIGR0LWJpbmRpbmdzOiBtZWRpYXRlazogbXQ4
MTgzOiBBZGQgI3Jlc2V0LWNlbGxzDQo+ICAgPT4gSU1ITyBhZGRpbmcgbXQyNzEyIGNvbXBhdGli
bGUgc2hvdWxkIGJlIGFub3RoZXIgcGF0Y2gNCj4gICA9PiBEZXBlbmRzIG9uIFsxLjJdDQo+ICAg
PT4gVGFncyBzaG91bGQgYmUgYWxsIGRyb3BwZWQNCj4gWzIuMl0gW1BBVENIIHYxMSAyLzNdIHdh
dGNoZG9nOiBtdGtfd2R0OiBtdDgxODM6IEFkZCByZXNldCBjb250cm9sbGVyDQo+ICAgPT4gSXNz
dWVzIGFib3V0IHRhZ3MNCj4gWzIuM10gW1BBVENIIHYxMSAzLzNdIHdhdGNoZG9nOiBtdGtfd2R0
OiBtdDI3MTI6IEFkZCByZXNldCBjb250cm9sbGVyDQo+ICAgPT4gSXNzdWVzIGFib3V0IHRhZ3MN
Cj4gDQo+IEppYXhpbi9Zb25nIExpYW5nL01hdHRoaWFzOiBQbGVhc2UgbGV0IG1lIGtub3csIEkn
bSBoYXBweSB0byBwaWNrIHVwDQo+IHRoZSBwYXRjaGVzLCBjbGVhbiB0aGVtIHVwIGFuZCByZXNl
bmQgdGhlbSwgaWYgeW91IHRoaW5rIHRoYXQgaGVscHMuDQo+IA0KICBbMS4yXSBbdjMsMi8yXSBk
dC1iaW5kaW5nczogbXQ4MTgzOiBBZGQgd2F0Y2hkb2cgZHQtYmluZGluZw0KICAtPiBJdCBpcyBu
byB1c2UsIEkgd2lsbCBzZW5kIDgxODMgaW4gamlheGluJ3MgcGF0Y2gNCiAgICAgV2Ugd2FudCB0
byBzZW5kIGppYXhpbidzIHBhdGNoIHByaW9yaXRpbHkuIFNvIHlvdSBjYW4gbWVyZ2UNCmppYXhp
bidzIHBhdGNoIGZpcnN0bHkuDQo+IA0KPiA+ID4gVGhhdCdzIHdoeSBJIHRvb2sgdGhpcyBwYXJ0
IGZyb206DQo+ID4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1tZWRpYXRlay8yMDE5
MTIyNjA5MzkzMC4yMjQxMy0xLXlvbmcubGlhbmdAbWVkaWF0ZWsuY29tLw0KPiA+ID4NCj4gPiA+
IFBsZWFzZSBsZXQgbWUga25vdyBpZiBJJ20gd3JvbmcgYW5kIEknbGwgZHJvcCBpdC4NCj4gPiA+
DQo+ID4gPiBSZWdhcmRzLA0KPiA+ID4gTWF0dGhpYXMNCj4gPiA+DQo+ID4gPiA+Pj4gMi4gQWRk
IHdhdGNoZG9nIGRldmljZSBub2RlDQo+ID4gPiA+DQo+ID4gPiA+IENhbiB3ZSBoYXZlIGEgcGF0
Y2ggd2l0aCBqdXN0IHRoaXMgY2hhbmdlIGluc3RlYWQsIHNpbmNlIHlvdSdyZQ0KPiA+ID4gPiBz
ZW5kaW5nIHRoZSBiaW5kaW5nIHdpdGggaXQuDQo+ID4gPiA+DQo+ID4gPiA+Pj4NCj4gPiA+ID4+
PiBTaWduZWQtb2ZmLWJ5OiB5b25nLmxpYW5nIDx5b25nLmxpYW5nQG1lZGlhdGVrLmNvbT4NCj4g
PiA+ID4+DQo+ID4gPiA+PiBUZXN0ZWQtYnk6IE5pY29sYXMgQm9pY2hhdCA8ZHJpbmtjYXRAY2hy
b21pdW0ub3JnPg0KPiA+ID4gPj4NCj4gPiA+ID4+PiAtLS0NCj4gPiA+ID4+PiAgYXJjaC9hcm02
NC9ib290L2R0cy9tZWRpYXRlay9tdDgxODMuZHRzaSB8IDggKysrKysrKysNCj4gPiA+ID4+PiAg
MSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQ0KPiA+ID4gPj4+IFtzbmlwXQ0KDQo=

