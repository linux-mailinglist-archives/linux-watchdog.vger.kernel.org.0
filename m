Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53851141B9F
	for <lists+linux-watchdog@lfdr.de>; Sun, 19 Jan 2020 04:23:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726619AbgASDXA (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 18 Jan 2020 22:23:00 -0500
Received: from mailgw02.mediatek.com ([1.203.163.81]:42200 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725497AbgASDXA (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 18 Jan 2020 22:23:00 -0500
X-UUID: cbf1c8442ccc4d1eb8a13a21161e6f20-20200119
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=hm6lnO5QlH7ot9sHtfmnJSN7OgWXnD6EkGNxaWdllRs=;
        b=FkHOHZ/EcjJX2+j4NzjxK2Lt9lkpdVjYoA2xmw3wdB2Uy54cRQgc/bL0BVOLaejNmhPccquQVxnvplIUbRqo0KAdowGUnuBwYfw/YBLlbARvdlGapiJ2rjNUAX+fpHS/aJFeKYHmQBGwrgsQF6xbpWd3tkCHfBq80LU83QavIyQ=;
X-UUID: cbf1c8442ccc4d1eb8a13a21161e6f20-20200119
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <yong.liang@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 1018494963; Sun, 19 Jan 2020 11:22:45 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Sun, 19 Jan
 2020 11:21:28 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Sun, 19 Jan 2020 11:22:51 +0800
Message-ID: <1579404156.27500.1.camel@mhfsdcap03>
Subject: Re: [PATCH v12 3/4] watchdog: mtk_wdt: mt8183: Add reset controller
From:   Yong Liang <yong.liang@mediatek.com>
To:     Matthias Brugger <matthias.bgg@gmail.com>
CC:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chang-An Chen =?UTF-8?Q?=28=E9=99=B3=E6=98=B6=E5=AE=89=29?= 
        <Chang-An.Chen@mediatek.com>,
        Freddy Hsin =?UTF-8?Q?=28=E8=BE=9B=E6=81=92=E8=B1=90=29?= 
        <Freddy.Hsin@mediatek.com>,
        Jiaxin Yu =?UTF-8?Q?=28=E4=BF=9E=E5=AE=B6=E9=91=AB=29?= 
        <Jiaxin.Yu@mediatek.com>,
        Yingjoe Chen =?UTF-8?Q?=28=E9=99=B3=E8=8B=B1=E6=B4=B2=29?= 
        <Yingjoe.Chen@mediatek.com>, "sboyd@kernel.org" <sboyd@kernel.org>
Date:   Sun, 19 Jan 2020 11:22:36 +0800
In-Reply-To: <372a4c8e-2ff1-3424-069c-7d359e1f16f1@gmail.com>
References: <20200115085828.27791-1-yong.liang@mediatek.com>
         <20200115085828.27791-4-yong.liang@mediatek.com>
         <372a4c8e-2ff1-3424-069c-7d359e1f16f1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 9A9910F4F12A5AE0331104063D22AC4683A93A64C642237FABC1506255239E8F2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

T24gVGh1LCAyMDIwLTAxLTE2IGF0IDAwOjE4ICswODAwLCBNYXR0aGlhcyBCcnVnZ2VyIHdyb3Rl
Og0KPiANCj4gT24gMTUvMDEvMjAyMCAwOTo1OCwgWW9uZyBMaWFuZyB3cm90ZToNCj4gPiBGcm9t
OiAieW9uZy5saWFuZyIgPHlvbmcubGlhbmdAbWVkaWF0ZWsuY29tPg0KPiA+IA0KPiA+IEFkZCBy
ZXNldCBjb250cm9sbGVyIEFQSSBpbiB3YXRjaGRvZyBkcml2ZXIuDQo+ID4gQmVzaWRlcyB3YXRj
aGRvZywgTVRLIHRvcHJndSBtb2R1bGUgYWxzYSBwcm92aWRlIHN1Yi1zeXN0ZW0gKGVnLCBhdWRp
bywNCj4gPiBjYW1lcmEsIGNvZGVjIGFuZCBjb25uZWN0aXZpdHkpIHNvZnR3YXJlIHJlc2V0IGZ1
bmN0aW9uYWxpdHkuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogeW9uZy5saWFuZyA8eW9uZy5s
aWFuZ0BtZWRpYXRlay5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogSmlheGluIFl1IDxqaWF4aW4u
eXVAbWVkaWF0ZWsuY29tPg0KPiA+IFJldmlld2VkLWJ5OiBZaW5nam9lIENoZW4gPHlpbmdqb2Uu
Y2hlbkBtZWRpYXRlay5jb20+DQo+ID4gUmV2aWV3ZWQtYnk6IFBoaWxpcHAgWmFiZWwgPHAuemFi
ZWxAcGVuZ3V0cm9uaXguZGU+DQo+IA0KPiBBY2tlZC1ieTogTWF0dGhpYXMgQnJ1Z2dlciA8bWF0
dGhpYXMuYmdnQGdtYWlsLmNvbT4NCg0KICBNYXkgSSBuZWVkIHNlbmQgYSBuZXcgcGF0Y2ggd2hp
dGggdGhpcyB0YWc/DQo+IA0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL3dhdGNoZG9nL210a193ZHQu
YyB8IDk5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystDQo+ID4gIDEgZmls
ZSBjaGFuZ2VkLCA5OCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4gDQo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvd2F0Y2hkb2cvbXRrX3dkdC5jIGIvZHJpdmVycy93YXRjaGRvZy9t
dGtfd2R0LmMNCj4gPiBpbmRleCA5YzNkMDAzMzI2MGQuLmU4OGFhY2IwNDA0ZCAxMDA2NDQNCj4g
PiAtLS0gYS9kcml2ZXJzL3dhdGNoZG9nL210a193ZHQuYw0KPiA+ICsrKyBiL2RyaXZlcnMvd2F0
Y2hkb2cvbXRrX3dkdC5jDQo+ID4gQEAgLTksNiArOSw4IEBADQo+ID4gICAqIEJhc2VkIG9uIHN1
bnhpX3dkdC5jDQo+ID4gICAqLw0KPiA+ICANCj4gPiArI2luY2x1ZGUgPGR0LWJpbmRpbmdzL3Jl
c2V0LWNvbnRyb2xsZXIvbXQ4MTgzLXJlc2V0cy5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgvZGVs
YXkuaD4NCj4gPiAgI2luY2x1ZGUgPGxpbnV4L2Vyci5oPg0KPiA+ICAjaW5jbHVkZSA8bGludXgv
aW5pdC5oPg0KPiA+ICAjaW5jbHVkZSA8bGludXgvaW8uaD4NCj4gPiBAQCAtMTYsMTAgKzE4LDEx
IEBADQo+ID4gICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4NCj4gPiAgI2luY2x1ZGUgPGxpbnV4
L21vZHVsZXBhcmFtLmg+DQo+ID4gICNpbmNsdWRlIDxsaW51eC9vZi5oPg0KPiA+ICsjaW5jbHVk
ZSA8bGludXgvb2ZfZGV2aWNlLmg+DQo+ID4gICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZp
Y2UuaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L3Jlc2V0LWNvbnRyb2xsZXIuaD4NCj4gPiAgI2lu
Y2x1ZGUgPGxpbnV4L3R5cGVzLmg+DQo+ID4gICNpbmNsdWRlIDxsaW51eC93YXRjaGRvZy5oPg0K
PiA+IC0jaW5jbHVkZSA8bGludXgvZGVsYXkuaD4NCj4gPiAgDQo+ID4gICNkZWZpbmUgV0RUX01B
WF9USU1FT1VUCQkzMQ0KPiA+ICAjZGVmaW5lIFdEVF9NSU5fVElNRU9VVAkJMQ0KPiA+IEBAIC00
NCw2ICs0Nyw5IEBADQo+ID4gICNkZWZpbmUgV0RUX1NXUlNUCQkweDE0DQo+ID4gICNkZWZpbmUg
V0RUX1NXUlNUX0tFWQkJMHgxMjA5DQo+ID4gIA0KPiA+ICsjZGVmaW5lIFdEVF9TV1NZU1JTVAkJ
MHgxOFUNCj4gPiArI2RlZmluZSBXRFRfU1dTWVNfUlNUX0tFWQkweDg4MDAwMDAwDQo+ID4gKw0K
PiA+ICAjZGVmaW5lIERSVl9OQU1FCQkibXRrLXdkdCINCj4gPiAgI2RlZmluZSBEUlZfVkVSU0lP
TgkJIjEuMCINCj4gPiAgDQo+ID4gQEAgLTUzLDggKzU5LDkwIEBAIHN0YXRpYyB1bnNpZ25lZCBp
bnQgdGltZW91dDsNCj4gPiAgc3RydWN0IG10a193ZHRfZGV2IHsNCj4gPiAgCXN0cnVjdCB3YXRj
aGRvZ19kZXZpY2Ugd2R0X2RldjsNCj4gPiAgCXZvaWQgX19pb21lbSAqd2R0X2Jhc2U7DQo+ID4g
KwlzcGlubG9ja190IGxvY2s7IC8qIHByb3RlY3RzIFdEVF9TV1NZU1JTVCByZWcgKi8NCj4gPiAr
CXN0cnVjdCByZXNldF9jb250cm9sbGVyX2RldiByY2RldjsNCj4gPiArfTsNCj4gPiArDQo+ID4g
K3N0cnVjdCBtdGtfd2R0X2RhdGEgew0KPiA+ICsJaW50IHRvcHJndV9zd19yc3RfbnVtOw0KPiA+
ICB9Ow0KPiA+ICANCj4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfd2R0X2RhdGEgbXQ4MTgz
X2RhdGEgPSB7DQo+ID4gKwkudG9wcmd1X3N3X3JzdF9udW0gPSBNVDgxODNfVE9QUkdVX1NXX1JT
VF9OVU0sDQo+ID4gK307DQo+ID4gKw0KPiA+ICtzdGF0aWMgaW50IHRvcHJndV9yZXNldF91cGRh
dGUoc3RydWN0IHJlc2V0X2NvbnRyb2xsZXJfZGV2ICpyY2RldiwNCj4gPiArCQkJICAgICAgIHVu
c2lnbmVkIGxvbmcgaWQsIGJvb2wgYXNzZXJ0KQ0KPiA+ICt7DQo+ID4gKwl1bnNpZ25lZCBpbnQg
dG1wOw0KPiA+ICsJdW5zaWduZWQgbG9uZyBmbGFnczsNCj4gPiArCXN0cnVjdCBtdGtfd2R0X2Rl
diAqZGF0YSA9DQo+ID4gKwkJIGNvbnRhaW5lcl9vZihyY2Rldiwgc3RydWN0IG10a193ZHRfZGV2
LCByY2Rldik7DQo+ID4gKw0KPiA+ICsJc3Bpbl9sb2NrX2lycXNhdmUoJmRhdGEtPmxvY2ssIGZs
YWdzKTsNCj4gPiArDQo+ID4gKwl0bXAgPSByZWFkbChkYXRhLT53ZHRfYmFzZSArIFdEVF9TV1NZ
U1JTVCk7DQo+ID4gKwlpZiAoYXNzZXJ0KQ0KPiA+ICsJCXRtcCB8PSBCSVQoaWQpOw0KPiA+ICsJ
ZWxzZQ0KPiA+ICsJCXRtcCAmPSB+QklUKGlkKTsNCj4gPiArCXRtcCB8PSBXRFRfU1dTWVNfUlNU
X0tFWTsNCj4gPiArCXdyaXRlbCh0bXAsIGRhdGEtPndkdF9iYXNlICsgV0RUX1NXU1lTUlNUKTsN
Cj4gPiArDQo+ID4gKwlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZkYXRhLT5sb2NrLCBmbGFncyk7
DQo+ID4gKw0KPiA+ICsJcmV0dXJuIDA7DQo+ID4gK30NCj4gPiArDQo+ID4gK3N0YXRpYyBpbnQg
dG9wcmd1X3Jlc2V0X2Fzc2VydChzdHJ1Y3QgcmVzZXRfY29udHJvbGxlcl9kZXYgKnJjZGV2LA0K
PiA+ICsJCQkgICAgICAgdW5zaWduZWQgbG9uZyBpZCkNCj4gPiArew0KPiA+ICsJcmV0dXJuIHRv
cHJndV9yZXNldF91cGRhdGUocmNkZXYsIGlkLCB0cnVlKTsNCj4gPiArfQ0KPiA+ICsNCj4gPiAr
c3RhdGljIGludCB0b3ByZ3VfcmVzZXRfZGVhc3NlcnQoc3RydWN0IHJlc2V0X2NvbnRyb2xsZXJf
ZGV2ICpyY2RldiwNCj4gPiArCQkJCSB1bnNpZ25lZCBsb25nIGlkKQ0KPiA+ICt7DQo+ID4gKwly
ZXR1cm4gdG9wcmd1X3Jlc2V0X3VwZGF0ZShyY2RldiwgaWQsIGZhbHNlKTsNCj4gPiArfQ0KPiA+
ICsNCj4gPiArc3RhdGljIGludCB0b3ByZ3VfcmVzZXQoc3RydWN0IHJlc2V0X2NvbnRyb2xsZXJf
ZGV2ICpyY2RldiwNCj4gPiArCQkJdW5zaWduZWQgbG9uZyBpZCkNCj4gPiArew0KPiA+ICsJaW50
IHJldDsNCj4gPiArDQo+ID4gKwlyZXQgPSB0b3ByZ3VfcmVzZXRfYXNzZXJ0KHJjZGV2LCBpZCk7
DQo+ID4gKwlpZiAocmV0KQ0KPiA+ICsJCXJldHVybiByZXQ7DQo+ID4gKw0KPiA+ICsJcmV0dXJu
IHRvcHJndV9yZXNldF9kZWFzc2VydChyY2RldiwgaWQpOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICtz
dGF0aWMgY29uc3Qgc3RydWN0IHJlc2V0X2NvbnRyb2xfb3BzIHRvcHJndV9yZXNldF9vcHMgPSB7
DQo+ID4gKwkuYXNzZXJ0ID0gdG9wcmd1X3Jlc2V0X2Fzc2VydCwNCj4gPiArCS5kZWFzc2VydCA9
IHRvcHJndV9yZXNldF9kZWFzc2VydCwNCj4gPiArCS5yZXNldCA9IHRvcHJndV9yZXNldCwNCj4g
PiArfTsNCj4gPiArDQo+ID4gK3N0YXRpYyBpbnQgdG9wcmd1X3JlZ2lzdGVyX3Jlc2V0X2NvbnRy
b2xsZXIoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiwNCj4gPiArCQkJCQkgICAgaW50IHJz
dF9udW0pDQo+ID4gK3sNCj4gPiArCWludCByZXQ7DQo+ID4gKwlzdHJ1Y3QgbXRrX3dkdF9kZXYg
Km10a193ZHQgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsNCj4gPiArDQo+ID4gKwlzcGlu
X2xvY2tfaW5pdCgmbXRrX3dkdC0+bG9jayk7DQo+ID4gKw0KPiA+ICsJbXRrX3dkdC0+cmNkZXYu
b3duZXIgPSBUSElTX01PRFVMRTsNCj4gPiArCW10a193ZHQtPnJjZGV2Lm5yX3Jlc2V0cyA9IHJz
dF9udW07DQo+ID4gKwltdGtfd2R0LT5yY2Rldi5vcHMgPSAmdG9wcmd1X3Jlc2V0X29wczsNCj4g
PiArCW10a193ZHQtPnJjZGV2Lm9mX25vZGUgPSBwZGV2LT5kZXYub2Zfbm9kZTsNCj4gPiArCXJl
dCA9IGRldm1fcmVzZXRfY29udHJvbGxlcl9yZWdpc3RlcigmcGRldi0+ZGV2LCAmbXRrX3dkdC0+
cmNkZXYpOw0KPiA+ICsJaWYgKHJldCAhPSAwKQ0KPiA+ICsJCWRldl9lcnIoJnBkZXYtPmRldiwN
Cj4gPiArCQkJImNvdWxkbid0IHJlZ2lzdGVyIHdkdCByZXNldCBjb250cm9sbGVyOiAlZFxuIiwg
cmV0KTsNCj4gPiArCXJldHVybiByZXQ7DQo+ID4gK30NCj4gPiArDQo+ID4gIHN0YXRpYyBpbnQg
bXRrX3dkdF9yZXN0YXJ0KHN0cnVjdCB3YXRjaGRvZ19kZXZpY2UgKndkdF9kZXYsDQo+ID4gIAkJ
CSAgIHVuc2lnbmVkIGxvbmcgYWN0aW9uLCB2b2lkICpkYXRhKQ0KPiA+ICB7DQo+ID4gQEAgLTE1
NSw2ICsyNDMsNyBAQCBzdGF0aWMgaW50IG10a193ZHRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rl
dmljZSAqcGRldikNCj4gPiAgew0KPiA+ICAJc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRl
djsNCj4gPiAgCXN0cnVjdCBtdGtfd2R0X2RldiAqbXRrX3dkdDsNCj4gPiArCWNvbnN0IHN0cnVj
dCBtdGtfd2R0X2RhdGEgKndkdF9kYXRhOw0KPiA+ICAJaW50IGVycjsNCj4gPiAgDQo+ID4gIAlt
dGtfd2R0ID0gZGV2bV9remFsbG9jKGRldiwgc2l6ZW9mKCptdGtfd2R0KSwgR0ZQX0tFUk5FTCk7
DQo+ID4gQEAgLTE5MCw2ICsyNzksMTMgQEAgc3RhdGljIGludCBtdGtfd2R0X3Byb2JlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ID4gIAlkZXZfaW5mbyhkZXYsICJXYXRjaGRvZyBl
bmFibGVkICh0aW1lb3V0PSVkIHNlYywgbm93YXlvdXQ9JWQpXG4iLA0KPiA+ICAJCSBtdGtfd2R0
LT53ZHRfZGV2LnRpbWVvdXQsIG5vd2F5b3V0KTsNCj4gPiAgDQo+ID4gKwl3ZHRfZGF0YSA9IG9m
X2RldmljZV9nZXRfbWF0Y2hfZGF0YShkZXYpOw0KPiA+ICsJaWYgKHdkdF9kYXRhKSB7DQo+ID4g
KwkJZXJyID0gdG9wcmd1X3JlZ2lzdGVyX3Jlc2V0X2NvbnRyb2xsZXIocGRldiwNCj4gPiArCQkJ
CQkJICAgICAgIHdkdF9kYXRhLT50b3ByZ3Vfc3dfcnN0X251bSk7DQo+ID4gKwkJaWYgKGVycikN
Cj4gPiArCQkJcmV0dXJuIGVycjsNCj4gPiArCX0NCj4gPiAgCXJldHVybiAwOw0KPiA+ICB9DQo+
ID4gIA0KPiA+IEBAIC0yMTksNiArMzE1LDcgQEAgc3RhdGljIGludCBtdGtfd2R0X3Jlc3VtZShz
dHJ1Y3QgZGV2aWNlICpkZXYpDQo+ID4gIA0KPiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2Rl
dmljZV9pZCBtdGtfd2R0X2R0X2lkc1tdID0gew0KPiA+ICAJeyAuY29tcGF0aWJsZSA9ICJtZWRp
YXRlayxtdDY1ODktd2R0IiB9LA0KPiA+ICsJeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgx
ODMtd2R0IiwgLmRhdGEgPSAmbXQ4MTgzX2RhdGEgfSwNCj4gPiAgCXsgLyogc2VudGluZWwgKi8g
fQ0KPiA+ICB9Ow0KPiA+ICBNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBtdGtfd2R0X2R0X2lkcyk7
DQo+ID4gDQoNCg==

