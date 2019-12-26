Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E713612AAD4
	for <lists+linux-watchdog@lfdr.de>; Thu, 26 Dec 2019 08:43:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726105AbfLZHnT (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 26 Dec 2019 02:43:19 -0500
Received: from Mailgw01.mediatek.com ([1.203.163.78]:8377 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725878AbfLZHnT (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 26 Dec 2019 02:43:19 -0500
X-UUID: 91fe2b47c2174602a4589969c5fea97d-20191226
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=B8FgD3ZrjisgjSkL3JaHceiILrlLNx2yrKhwr8RakCI=;
        b=LZdR0xLrEYvhQJGiDA3Mue8i2JMovgNzQ6JSwmdkVunNdVu5g16UY4b002ZkDZrKeOkDIil+AgRb4p9gyjb4yRweZJYwQQhzqVfr6SJAMeTSH6gQTYr+0iKQ9X097YLztJtWKa+9Qoon34gxo9W8ZOM2vSqo23WQrLiHgKFSRio=;
X-UUID: 91fe2b47c2174602a4589969c5fea97d-20191226
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <yong.liang@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 930369363; Thu, 26 Dec 2019 15:42:37 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Thu, 26 Dec
 2019 15:42:07 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 26 Dec 2019 15:42:28 +0800
Message-ID: <1577346109.20923.3.camel@mhfsdcap03>
Subject: Re: [PATCH v6 2/2] watchdog: mtk_wdt: mt8183: Add reset controller
From:   Yong Liang <yong.liang@mediatek.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>
CC:     Jiaxin Yu =?UTF-8?Q?=28=E4=BF=9E=E5=AE=B6=E9=91=AB=29?= 
        <Jiaxin.Yu@mediatek.com>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Yingjoe Chen =?UTF-8?Q?=28=E9=99=B3=E8=8B=B1=E6=B4=B2=29?= 
        <Yingjoe.Chen@mediatek.com>, "sboyd@kernel.org" <sboyd@kernel.org>
Date:   Thu, 26 Dec 2019 15:41:49 +0800
In-Reply-To: <fe8b8b2aac6d92a1d7ffc32ea012db9898ab6857.camel@pengutronix.de>
References: <1576081356-18298-1-git-send-email-jiaxin.yu@mediatek.com>
         <1576081356-18298-3-git-send-email-jiaxin.yu@mediatek.com>
         <fe8b8b2aac6d92a1d7ffc32ea012db9898ab6857.camel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 8574F099F3B0AD104410C800107372672A0E4739F5A4B188550EFA2C7F63128E2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

T24gVGh1LCAyMDE5LTEyLTEyIGF0IDAwOjQ0ICswODAwLCBQaGlsaXBwIFphYmVsIHdyb3RlOg0K
PiBIaSwNCj4gDQo+IE9uIFRodSwgMjAxOS0xMi0xMiBhdCAwMDoyMiArMDgwMCwgSmlheGluIFl1
IHdyb3RlOg0KPiA+IEZyb206ICJ5b25nLmxpYW5nIiA8eW9uZy5saWFuZ0BtZWRpYXRlay5jb20+
DQo+ID4gDQo+ID4gQWRkIHJlc2V0IGNvbnRyb2xsZXIgQVBJIGluIHdhdGNoZG9nIGRyaXZlci4N
Cj4gPiBCZXNpZGVzIHdhdGNoZG9nLCBNVEsgdG9wcmd1IG1vZHVsZSBhbHNhIHByb3ZpZGUgc3Vi
LXN5c3RlbSAoZWcsIGF1ZGlvLA0KPiA+IGNhbWVyYSwgY29kZWMgYW5kIGNvbm5lY3Rpdml0eSkg
c29mdHdhcmUgcmVzZXQgZnVuY3Rpb25hbGl0eS4NCj4gDQo+IERvIGFueSBvZiB0aGUgbGlzdGVk
IHN1Yi1zeXN0ZW1zIHVzZSB0aGUgcmVzZXRfY29udHJvbF9yZXNldCgpDQo+IGZ1bmN0aW9uYWxp
dHk/IElzIHRoZXJlIG5vIGRlbGF5IHJlcXVpcmVtZW50IGJldHdlZW4gYXNzZXJ0IGFuZA0KPiBk
ZWFzc2VydD8gT3RoZXJ3aXNlIGl0IHdvdWxkIGJlIHNhZmVyIG5vdCB0byBpbXBsZW1lbnQgdGhl
IC5yZXNldCgpDQo+IG9wZXJhdGlvbiBhdCBhbGwuDQo+IA0KPiA+IEF1ZGlvIHVzZSB0aGlzIHJl
c2V0IEFQSSB0byByZXNldCBhdWRpbywgYW5kIGl0IHdvcmtzIHdlbGwuDQogICAgSXQgaXMgbm8g
bmVlZCB0byBhZGQgZGVsYXkgYmV0d2VlbiBhc3NlcnQgYW5kIGRlYXNzZXJ0Lg0KDQo+ID4gU2ln
bmVkLW9mZi1ieTogeW9uZy5saWFuZyA8eW9uZy5saWFuZ0BtZWRpYXRlay5jb20+DQo+ID4gLS0t
DQo+ID4gIGRyaXZlcnMvd2F0Y2hkb2cvS2NvbmZpZyAgIHwgICAxICsNCj4gPiAgZHJpdmVycy93
YXRjaGRvZy9tdGtfd2R0LmMgfCAxMDkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrLQ0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDEwOSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvd2F0Y2hkb2cvS2NvbmZpZyBiL2Ry
aXZlcnMvd2F0Y2hkb2cvS2NvbmZpZw0KPiA+IGluZGV4IDJlMDdjYWFiOWRiMi4uNjI5MjQ5ZmU1
MzA1IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvd2F0Y2hkb2cvS2NvbmZpZw0KPiA+ICsrKyBi
L2RyaXZlcnMvd2F0Y2hkb2cvS2NvbmZpZw0KPiA+IEBAIC03MTcsNiArNzE3LDcgQEAgY29uZmln
IE1FRElBVEVLX1dBVENIRE9HDQo+ID4gIAl0cmlzdGF0ZSAiTWVkaWF0ZWsgU29DcyB3YXRjaGRv
ZyBzdXBwb3J0Ig0KPiA+ICAJZGVwZW5kcyBvbiBBUkNIX01FRElBVEVLIHx8IENPTVBJTEVfVEVT
VA0KPiA+ICAJc2VsZWN0IFdBVENIRE9HX0NPUkUNCj4gPiArCXNlbGVjdCBSRVNFVF9DT05UUk9M
TEVSDQo+ID4gIAloZWxwDQo+ID4gIAkgIFNheSBZIGhlcmUgdG8gaW5jbHVkZSBzdXBwb3J0IGZv
ciB0aGUgd2F0Y2hkb2cgdGltZXINCj4gPiAgCSAgaW4gTWVkaWF0ZWsgU29Dcy4NCj4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy93YXRjaGRvZy9tdGtfd2R0LmMgYi9kcml2ZXJzL3dhdGNoZG9nL210
a193ZHQuYw0KPiA+IGluZGV4IDljM2QwMDMzMjYwZC4uNjY3MzgwMDMxZGZkIDEwMDY0NA0KPiA+
IC0tLSBhL2RyaXZlcnMvd2F0Y2hkb2cvbXRrX3dkdC5jDQo+ID4gKysrIGIvZHJpdmVycy93YXRj
aGRvZy9tdGtfd2R0LmMNCj4gPiBAQCAtOSw2ICs5LDkgQEANCj4gPiAgICogQmFzZWQgb24gc3Vu
eGlfd2R0LmMNCj4gPiAgICovDQo+ID4gIA0KPiA+ICsjaW5jbHVkZSA8ZHQtYmluZGluZ3MvcmVz
ZXQtY29udHJvbGxlci9tdDI3MTItcmVzZXRzLmg+DQo+ID4gKyNpbmNsdWRlIDxkdC1iaW5kaW5n
cy9yZXNldC1jb250cm9sbGVyL210ODE4My1yZXNldHMuaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4
L2RlbGF5Lmg+DQo+ID4gICNpbmNsdWRlIDxsaW51eC9lcnIuaD4NCj4gPiAgI2luY2x1ZGUgPGxp
bnV4L2luaXQuaD4NCj4gPiAgI2luY2x1ZGUgPGxpbnV4L2lvLmg+DQo+ID4gQEAgLTE2LDEwICsx
OSwxMiBAQA0KPiA+ICAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+DQo+ID4gICNpbmNsdWRlIDxs
aW51eC9tb2R1bGVwYXJhbS5oPg0KPiA+ICAjaW5jbHVkZSA8bGludXgvb2YuaD4NCj4gPiArI2lu
Y2x1ZGUgPGxpbnV4L29mX2RldmljZS5oPg0KPiA+ICAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1f
ZGV2aWNlLmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9yZXNldC1jb250cm9sbGVyLmg+DQo+ID4g
KyNpbmNsdWRlIDxsaW51eC9zbGFiLmg+DQo+IA0KPiBXaGF0IGlzIHRoaXMgcmVxdWlyZWQgZm9y
Pw0KDQogIEl0IGlzIG5vIHVzZS4gSSB3aWxsIHJlbW92ZSBpdC4NCj4gDQo+ID4gICNpbmNsdWRl
IDxsaW51eC90eXBlcy5oPg0KPiA+ICAjaW5jbHVkZSA8bGludXgvd2F0Y2hkb2cuaD4NCj4gPiAt
I2luY2x1ZGUgPGxpbnV4L2RlbGF5Lmg+DQo+ID4NCj4gPiAgI2RlZmluZSBXRFRfTUFYX1RJTUVP
VVQJCTMxDQo+ID4gICNkZWZpbmUgV0RUX01JTl9USU1FT1VUCQkxDQo+ID4gQEAgLTQ0LDYgKzQ5
LDkgQEANCj4gPiAgI2RlZmluZSBXRFRfU1dSU1QJCTB4MTQNCj4gPiAgI2RlZmluZSBXRFRfU1dS
U1RfS0VZCQkweDEyMDkNCj4gPiAgDQo+ID4gKyNkZWZpbmUgV0RUX1NXU1lTUlNUCQkweDE4VQ0K
PiA+ICsjZGVmaW5lIFdEVF9TV1NZU19SU1RfS0VZCTB4ODgwMDAwMDANCj4gPiArDQo+ID4gICNk
ZWZpbmUgRFJWX05BTUUJCSJtdGstd2R0Ig0KPiA+ICAjZGVmaW5lIERSVl9WRVJTSU9OCQkiMS4w
Ig0KPiA+ICANCj4gPiBAQCAtNTMsOCArNjEsOTcgQEAgc3RhdGljIHVuc2lnbmVkIGludCB0aW1l
b3V0Ow0KPiA+ICBzdHJ1Y3QgbXRrX3dkdF9kZXYgew0KPiA+ICAJc3RydWN0IHdhdGNoZG9nX2Rl
dmljZSB3ZHRfZGV2Ow0KPiA+ICAJdm9pZCBfX2lvbWVtICp3ZHRfYmFzZTsNCj4gPiArCXNwaW5s
b2NrX3QgbG9jazsgLyogcHJvdGVjdHMgV0RUX1NXU1lTUlNUIHJlZyAqLw0KPiA+ICsJc3RydWN0
IHJlc2V0X2NvbnRyb2xsZXJfZGV2IHJjZGV2Ow0KPiA+ICt9Ow0KPiA+ICsNCj4gPiArc3RydWN0
IG10a193ZHRfZGF0YSB7DQo+ID4gKwlpbnQgaW5mcmFjZmdfc3dfcnN0X251bTsNCj4gDQo+IFRo
aXMgaXMgbm90IHVzZWQgYXQgYWxsLCBiZXR0ZXIgcmVtb3ZlIGl0Lg0KICBJIHdpbGwgcmVtb3Zl
IGl0Lg0KPiANCj4gPiArCWludCB0b3ByZ3Vfc3dfcnN0X251bTsNCj4gPiArfTsNCj4gPiArDQo+
ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX3dkdF9kYXRhIG10MjcxMl9kYXRhID0gew0KPiA+
ICsJLnRvcHJndV9zd19yc3RfbnVtID0gTVQyNzEyX1RPUFJHVV9TV19SU1RfTlVNLA0KPiA+ICt9
Ow0KPiA+ICsNCj4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfd2R0X2RhdGEgbXQ4MTgzX2Rh
dGEgPSB7DQo+ID4gKwkuaW5mcmFjZmdfc3dfcnN0X251bSA9IE1UODE4M19JTkZSQUNGR19TV19S
U1RfTlVNLA0KPiANCj4gU2FtZSBhcyBhYm92ZS4NCiAgSSB3aWxsIHJlbW92ZSBpdC4NCj4gDQo+
ID4gKwkudG9wcmd1X3N3X3JzdF9udW0gPSBNVDgxODNfVE9QUkdVX1NXX1JTVF9OVU0sDQo+ID4g
K307DQo+ID4gKw0KPiA+ICtzdGF0aWMgaW50IHRvcHJndV9yZXNldF91cGRhdGUoc3RydWN0IHJl
c2V0X2NvbnRyb2xsZXJfZGV2ICpyY2RldiwNCj4gPiArCQkJICAgICAgIHVuc2lnbmVkIGxvbmcg
aWQsIGJvb2wgYXNzZXJ0KQ0KPiA+ICt7DQo+ID4gKwl1bnNpZ25lZCBpbnQgdG1wOw0KPiA+ICsJ
dW5zaWduZWQgbG9uZyBmbGFnczsNCj4gPiArDQo+IA0KPiBUaGlzIGVtcHR5IGxpbmUgY2FuIGJl
IHJlbW92ZWQuDQogIEkgd2lsbCByZW1vdmUgaXQuDQo+IA0KPiA+ICsJc3RydWN0IG10a193ZHRf
ZGV2ICpkYXRhID0NCj4gPiArCQkgY29udGFpbmVyX29mKHJjZGV2LCBzdHJ1Y3QgbXRrX3dkdF9k
ZXYsIHJjZGV2KTsNCj4gPiArDQo+ID4gKwlzcGluX2xvY2tfaXJxc2F2ZSgmZGF0YS0+bG9jaywg
ZmxhZ3MpOw0KPiA+ICsNCj4gPiArCXRtcCA9IHJlYWRsKGRhdGEtPndkdF9iYXNlICsgV0RUX1NX
U1lTUlNUKTsNCj4gPiArCWlmIChhc3NlcnQpDQo+ID4gKwkJdG1wIHw9IEJJVChpZCk7DQo+ID4g
KwllbHNlDQo+ID4gKwkJdG1wICY9IH5CSVQoaWQpOw0KPiA+ICsJdG1wIHw9IFdEVF9TV1NZU19S
U1RfS0VZOw0KPiA+ICsJd3JpdGVsKHRtcCwgZGF0YS0+d2R0X2Jhc2UgKyBXRFRfU1dTWVNSU1Qp
Ow0KPiA+ICsNCj4gPiArCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmRhdGEtPmxvY2ssIGZsYWdz
KTsNCj4gPiArDQo+ID4gKwlyZXR1cm4gMDsNCj4gPiArfQ0KPiA+ICsNCj4gPiArc3RhdGljIGlu
dCB0b3ByZ3VfcmVzZXRfYXNzZXJ0KHN0cnVjdCByZXNldF9jb250cm9sbGVyX2RldiAqcmNkZXYs
DQo+ID4gKwkJCSAgICAgICB1bnNpZ25lZCBsb25nIGlkKQ0KPiA+ICt7DQo+ID4gKwlyZXR1cm4g
dG9wcmd1X3Jlc2V0X3VwZGF0ZShyY2RldiwgaWQsIHRydWUpOw0KPiA+ICt9DQo+ID4gKw0KPiA+
ICtzdGF0aWMgaW50IHRvcHJndV9yZXNldF9kZWFzc2VydChzdHJ1Y3QgcmVzZXRfY29udHJvbGxl
cl9kZXYgKnJjZGV2LA0KPiA+ICsJCQkJIHVuc2lnbmVkIGxvbmcgaWQpDQo+ID4gK3sNCj4gPiAr
CXJldHVybiB0b3ByZ3VfcmVzZXRfdXBkYXRlKHJjZGV2LCBpZCwgZmFsc2UpOw0KPiA+ICt9DQo+
ID4gKw0KPiA+ICtzdGF0aWMgaW50IHRvcHJndV9yZXNldChzdHJ1Y3QgcmVzZXRfY29udHJvbGxl
cl9kZXYgKnJjZGV2LA0KPiA+ICsJCQl1bnNpZ25lZCBsb25nIGlkKQ0KPiA+ICt7DQo+ID4gKwlp
bnQgcmV0Ow0KPiA+ICsNCj4gPiArCXJldCA9IHRvcHJndV9yZXNldF9hc3NlcnQocmNkZXYsIGlk
KTsNCj4gPiArCWlmIChyZXQpDQo+ID4gKwkJcmV0dXJuIHJldDsNCj4gPiArDQo+ID4gKwlyZXR1
cm4gdG9wcmd1X3Jlc2V0X2RlYXNzZXJ0KHJjZGV2LCBpZCk7DQo+ID4gK30NCj4gDQo+IEFzIG1l
bnRpb25lZCBhYm92ZSwgaXMgdGhpcyBuZWVkZWQ/IERvZXMgdGhpcyB3b3JrIGZvciBhbGwgbW9k
dWxlcz8NCj4gT25seSBpbXBsZW1lbnQgdGhpcyBpZiB5b3UgYXJlIHN1cmUgYm90aCBhcmUgdHJ1
ZS4NCiAgSSB0aGluayBpdCdzIHNhZmUuIE1hbnkgbW9kdWxlcyBoYXMgdXNlZCBpdCBpbiBNVEsg
aW5zaWRlLg0KPiANCj4gcmVnYXJkcw0KPiBQaGlsaXBwDQo+IA0KDQo=

