Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 632032880A8
	for <lists+linux-watchdog@lfdr.de>; Fri,  9 Oct 2020 05:20:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731016AbgJIDUj (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 8 Oct 2020 23:20:39 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:42891 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725969AbgJIDUj (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 8 Oct 2020 23:20:39 -0400
X-UUID: 02d41083b76443f5884cd135d8bceada-20201009
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=8x82X3U41FRr0ndtEJggoVTK3rtF9FH609MgK5Y3YKI=;
        b=C5dtBUzrcA44cIe97RzoP3n2bPyH0tWhN2HYEOE0+wfuAp95c4A1xvNIDv4MYR753TM1mE/Z70w+gYc2SoRVaVsxAuScR89OphGIAp95392JcaO+cG+qFHdxbvBsTOHp9Prrsrw2HgtLvZR7tzHd6IT/ksXtSDNe5YILCPjjN1A=;
X-UUID: 02d41083b76443f5884cd135d8bceada-20201009
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw02.mediatek.com
        (envelope-from <crystal.guo@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 602999587; Fri, 09 Oct 2020 11:20:25 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs07n2.mediatek.inc
 (172.21.101.141) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 9 Oct
 2020 11:20:22 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 9 Oct 2020 11:20:22 +0800
Message-ID: <1602213621.14806.43.camel@mhfsdcap03>
Subject: Re: [v5,0/4] watchdog: mt8192: add wdt support
From:   Crystal Guo <crystal.guo@mediatek.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     Matthias Brugger <matthias.bgg@gmail.com>,
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
        Wim Van Sebroeck <wim@linux-watchdog.org>
Date:   Fri, 9 Oct 2020 11:20:21 +0800
In-Reply-To: <9d493ec4-6b3e-12a1-01f3-34c09a826290@roeck-us.net>
References: <20200929032005.15169-1-crystal.guo@mediatek.com>
         <71e21cfd-fd44-2cf9-cf8a-f83dc1b0cc89@gmail.com>
         <20201001151639.GC64648@roeck-us.net>
         <89835d94-7f26-bdc3-4760-af00978aba44@gmail.com>
         <9d493ec4-6b3e-12a1-01f3-34c09a826290@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

T24gRnJpLCAyMDIwLTEwLTAyIGF0IDIyOjQxICswODAwLCBHdWVudGVyIFJvZWNrIHdyb3RlOg0K
PiBPbiAxMC8yLzIwIDI6NTEgQU0sIE1hdHRoaWFzIEJydWdnZXIgd3JvdGU6DQo+ID4gDQo+ID4g
DQo+ID4gT24gMDEvMTAvMjAyMCAxNzoxNiwgR3VlbnRlciBSb2VjayB3cm90ZToNCj4gPj4gT24g
VGh1LCBPY3QgMDEsIDIwMjAgYXQgMDQ6MjM6MDJQTSArMDIwMCwgTWF0dGhpYXMgQnJ1Z2dlciB3
cm90ZToNCj4gPj4+IEhpIENyeXN0YWwsDQo+ID4+Pg0KPiA+Pj4gSXQgc2VlbXMgeW91IGZvcmdv
dCB0byBzZW5kIHRoZSBlbWFpbCB0byBvbmUgb2YgdGhlIG1haW50YWluZXJzLCBXaW0uDQo+ID4+
PiBQbGVhc2UgbWFrZSBzdXJlIHlvdSBhZGQgYWxsIHRoZSBtYWludGFpbmVycyBmcm9tIGdldF9t
YWludGFpbmVycy5wbCB3aGVuDQo+ID4+PiB5b3Ugc2VuZCBhIHNlcmllcy4NCj4gPj4+DQo+ID4+
PiBSZWdhcmRzLA0KPiA+Pj4gTWF0dGhpYXMNCj4gPj4+DQo+ID4+PiBPbiAyOS8wOS8yMDIwIDA1
OjIwLCBDcnlzdGFsIEd1byB3cm90ZToNCj4gPj4+PiB2NSBjaGFuZ2VzOg0KPiA+Pj4+IGZpeCB0
eXBvcyBvbjoNCj4gPj4+PiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzExNjk3
NDkzLw0KPiA+Pj4+DQo+ID4+Pj4gdjQgY2hhbmdlczoNCj4gPj4+PiByZXZpc2UgY29tbWl0IG1l
c3NhZ2VzLg0KPiA+Pj4+DQo+ID4+Pj4gdjMgY2hhbmdlczoNCj4gPj4+PiBodHRwczovL3BhdGNo
d29yay5rZXJuZWwub3JnL3BhdGNoLzExNjkyNzMxLw0KPiA+Pj4+IGh0dHBzOi8vcGF0Y2h3b3Jr
Lmtlcm5lbC5vcmcvcGF0Y2gvMTE2OTI3NjcvDQo+ID4+Pj4gaHR0cHM6Ly9wYXRjaHdvcmsua2Vy
bmVsLm9yZy9wYXRjaC8xMTY5MjcyOS8NCj4gPj4+PiBodHRwczovL3BhdGNod29yay5rZXJuZWwu
b3JnL3BhdGNoLzExNjkyNzcxLw0KPiA+Pj4+IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcv
cGF0Y2gvMTE2OTI3MzMvDQo+ID4+DQo+ID4+IFRoaXMgaXMgbGVzcyB0aGFuIGhlbHBmdWwuIEl0
IGRvZXNuJ3QgdGVsbCBtZSBhbnl0aGluZy4gSXQgZXhwZWN0cyBtZSB0bw0KPiA+PiBnbyBiYWNr
IHRvIHRoZSBlYXJsaWVyIHZlcnNpb25zLCBkb3dubG9hZCB0aGVtLCBhbmQgcnVuIGEgZGlmZiwg
dG8gZmlndXJlDQo+ID4+IG91dCB3aGF0IGNoYW5nZWQuIFRoYXQgbWVhbnMgdGhlIHBhdGNoIG9y
IHBhdGNoIHNlcmllcyBlbmRzIGF0IHRoZSBib3R0b20NCj4gPj4gb2YgbXkgcGlsZSBvZiBwYXRj
aGVzIHRvIHJldmlldy4gV2hpY2gsIGFzIGl0IGhhcHBlbnMsIGlzIHF1aXRlIGRlZXAuDQo+ID4+
DQo+ID4+IEkgd2lsbCByZXZpZXcgdGhpcyBhbmQgc2ltaWxhciBwYXRjaGVzIHdpdGhvdXQgY2hh
bmdlIGxvZyBhZnRlciAoYW5kIG9ubHkNCj4gPj4gYWZ0ZXIpIEkgaGF2ZSByZXZpZXdlZCBhbGwg
b3RoZXIgcGF0Y2hlcyBpbiBteSBxdWV1ZS4NCj4gPj4NCj4gPiANCj4gPiBJIHVuZGVyc3RhbmQg
eW91ciBjb21tZW50cyBvbiBoYXJkIHRvIHVuZGVyc3RhbmQgY2hhbmdlIGxvZy4gQnV0IEkgdGhp
bmsgeW91IGFjdGVkIHRvIHF1aWNrIHRvIHB1dCB0aGlzIHNlcmllcyB0byB0aGUgZW5kIG9mIHlv
dXIgcXVldWUuIEknbGwgdHJ5IHRvIGV4cGxhaW46DQo+ID4gDQo+ID4gSW4gdjQgeW91IGdhdmUg
eW91ciBBY2tlZC1ieSBhbmQgUmV2aWV3ZWQtYnkgZm9yIHRoZSBwYXRjaGVzIHRoYXQgaW4gdGhp
cyBzZXJpZXMgYXJlIDMvNCBbMV0gYW5kIDQvNCBbMl0gcmVzcGVjdGl2ZWx5LiBZb3UgYWxzbyBn
YXZlIHlvdXIgUmV2aWV3ZWQtYnkgZm9yIDEvNCBbM10uDQo+ID4gDQo+ID4gSW4gdjQgeW91IHN0
YXRlZCB0aGF0IHlvdSB3YW50ZWQgdG8gd2FpdCBmb3IgYSByZXZpZXcgZnJvbSBSb2IgZm9yIHRo
ZSBiaW5kaW5nIGNoYW5nZXMuIE9idmlvdXNseSBpdCdzIHVwIHRvIHlvdSB0byBoYW5kbGUgdGhh
dCB0aGUgd2F5IHlvdSB3YW50LiBGcm9tIG15IHBvaW50IG9mIHZpZXcgdGhlc2UgYXJlIHJhdGhl
ciB0cml2aWFsIGNoYW5nZXMuDQo+ID4gDQo+IA0KPiBUaGF0IG1heSBiZSBjb3JyZWN0LCBidXQg
SSBhbSBub3QgYSBEVCBleHBlcnQsIGFuZCBpdCBoYXBwZW5lZCBvZnRlbiBlbm91Z2gNCj4gdGhh
dCBJIGFwcHJvdmVkIGEgRFQgY2hhbmdlIGFuZCBSb2IgbGF0ZXIgcmFpc2VkIGNvbmNlcm5zIHRo
YXQgSSBkb24ndCBkbyBpdA0KPiBhbnltb3JlLg0KPiANCj4gPiBJbiAxLzQgYXJlIGRlbGV0aW5n
IGNvbXBhdGlibGUgZmFsbGJhY2tzIGluIHRoZSBiaW5kaW5ncywgYXMgdGhlIGRyaXZlciBwcm92
aWRlcyBTb0Mgc3BlY2lmaWMgcGxhdGZvcm0gZGF0YSwgd2hpY2ggeW91IHJldmlld2VkLg0KPiA+
IA0KPiA+IE9uZSBjYW4gYXJndWUgdGhhdCB0aGlzIHdpbGwgYnJlYWsgb2xkZXIgZGV2aWNldHJl
ZSBiaW5kaW5ncyBiZWNhdXNlIHRoZSBkcml2ZXIgdXNpbmcgdGhlIGZhbGxiYWNrIHdvdWxkIHdv
cmsgZXhjZXB0IGZvciB0aGUgdG9wZ3J1IHJlc2V0IGNvbnRyb2xsZXIuIEJ1dCBJIHRoaW5rIHRo
aXMgaXMgdGhlIGpvYiBvZiB0aGUgbWFpbnRhaW5lciBvZiB0aGUgZHJpdmVyIGFzIFJvYiB3b24n
dCBiZSBhYmxlIHRvIGxvb2sgaW50byBhbGwgdGhlIGRyaXZlciBjb2RlIHRvIGRlY2lkZSBpZiBh
bnkgY2hhbmdlIHRvIHRoZSBiaW5kaW5ncyBpcyBiYWNrd2FyZCBjb21wYXRpYmxlLiBXaXRoIHlv
dXIgUmV2aWV3ZWQtYnkgSSB1bmRlcnN0YW5kIHRoYXQgeW91IGFyZSBPSyB3aXRoIHRoaXMgY2hh
bmdlLiBBcyBTb0MgbWFpbnRhaW5lciBJJ20gZmluZSB3aXRoIHRoZSBjaGFuZ2UuIE1UMjcwMSBp
cyBhIFNvQyB0aGF0J3Mgbm90IGF2YWlsYWJsZSB0byB0aGUgZ2VuZXJhbCBwdWJsaWMuIE1UODE4
MyBpcyBhdmFpbGFibGUsIGJ1dCBvbmx5IG9uIGNocm9tZWJvb2tzIGFuZCBJIGRvbid0IGV4cGVj
dCBhbnlib2R5IHRvIHVzZSBhbiBvbGRlciBrZXJuZWwgd2l0aG91dCB3YXRjaGRvZyBkcml2ZXIg
c3VwcG9ydCBmb3IgbXQ4MTgzIChlbmFibGVtZW50IGlzIHN0aWxsIG9uZ29pbmcpLiBBY3R1YWxs
eSBJIHRvb2sgdGhlIERUUyBjb3VudGVyIHBhcnQgYWxyZWFkeSB0aHJvdWdoIG15IHRyZWUsIHdo
aWNoIHdhcyBhbiBlcnJvciwgYXMgd2Ugbm93IGhhdmUgYSBEVFMgd2hpY2ggZG9lcyBub3QgaG9s
ZCB0byB0aGUgYmluZGluZyBkZXNjcmlwdGlvbiAodW50aWwgYW5kIGlmIHlvdSBhY2NlcHQgMS80
KS4NCj4gPiANCj4gPiBUaGUgb25seSBwYXRjaCBtaXNzaW5nIHBhdGNoIGlzIG5vdyAyLzQsIHdo
ZXJlIENyeXN0YWwgYWRkZWQgeW91ciBSZXZpZXdlZC1ieSB3aGljaCB5b3UgbmV2ZXIgZ2F2ZS4g
QnV0IGl0IGp1c3QgYWRkcyB0aGUgY29tcGF0aWJsZSB0byB0aGUgYmluZGluZyBmb3IgYSBkcml2
ZXIgeW91IGFscmVhZHkgZ2F2ZSB5b3VyIFJldmlld2VkLWJ5LiBTbyBJIHRoaW5rIHRoaXMgdGhl
IHNlcmllcyBhY3R1YWxseSBqdXN0IGZhbGwgdGhyb3VnaCB0aGUgY3JhY2tzLg0KPiA+IA0KPiA+
IFNvcnJ5IGZvciB0aGUgbG9uZyBtYWlsLCBidXQgaWYgeW91IGdvdCB1bnRpbCBoZXJlLCBJIGhv
cGUgSSB3YXMgYWJsZSB0byBjb252aW5jZSB5b3UgdG8ganVzdCBtZXJnZSB0aGUgc2VyaWVzIDop
DQo+ID4gDQo+IA0KPiBJZiBteSBSZXZpZXdlZC1ieSBpcyBpbmRlZWQgaW4gYWxsIHBhdGNoZXMs
IGFzIHlvdSBzdGF0ZSwgZXZlbiBpZiBJIGRpZG4ndCBnaXZlIGl0DQo+IHRvIHNvbWUgb2YgdGhv
c2UgYW5kIHRoZSBzdWJtaXR0ZXIganVzdCBhZGRlZCBpdCAoaXMgdGhhdCBhY2NlcHRhYmxlIG5v
d2FkYXlzID8pLA0KPiB0aGVyZSBzaG91bGQgYmUgbm8gcHJvYmxlbSBhbmQgV2ltIHNob3VsZCBw
aWNrIHVwIHRoZSBzZXJpZXMuIEFuZCBpZiB0aGUgc3VibWl0dGVyDQo+IGhhZCBib3RoZXJlZCB0
byB3cml0ZSBhIHByb3BlciBjaGFuZ2UgbG9nIGluc3RlYWQgb2YgZXhwZWN0aW5nIG1lIHRvIGRv
IHRoZSB3b3JrDQo+IEkgd291bGQgaGF2ZSBub3RpY2VkIHJpZ2h0IGF3YXkuDQo+IA0KPiBObywg
dGhpcyB3YXMgdmVyeSBhcHByb3ByaWF0ZWx5IHB1dCB0byB0aGUgZW5kIG9mIG15IHJldmlldyBx
dWV1ZS4NCj4gDQo+IEd1ZW50ZXINCg0KU29ycnkgdG8gY2F1c2UgeW91IHRyb3VibGUsIEkgd2ls
bCBwYXkgYXR0ZW50aW9uIHRvIHRoZXNlIHBvaW50cyBpbiB0aGUNCmZ1dHVyZS4gDQoNCkNyeXN0
YWwNCg0K

