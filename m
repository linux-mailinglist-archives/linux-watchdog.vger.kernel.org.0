Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DE38104D40
	for <lists+linux-watchdog@lfdr.de>; Thu, 21 Nov 2019 09:07:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726270AbfKUIHh (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 21 Nov 2019 03:07:37 -0500
Received: from cnshjsmin03.alcatel-sbell.com.cn ([116.246.26.71]:23357 "EHLO
        cnshjsmin03.nokia-sbell.com" rhost-flags-OK-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S1726165AbfKUIHh (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 21 Nov 2019 03:07:37 -0500
X-AuditID: ac189297-c7bff7000000115a-a5-5dd645b2ee44
Received: from CNSHPPEXCH1606.nsn-intra.net (Unknown_Domain [135.251.51.106])
        (using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client did not present a certificate)
        by cnshjsmin03.nokia-sbell.com (Symantec Messaging Gateway) with SMTP id 89.A4.04442.2B546DD5; Thu, 21 Nov 2019 16:07:14 +0800 (HKT)
Received: from CNSHPPEXCH1601.nsn-intra.net (135.251.51.101) by
 CNSHPPEXCH1606.nsn-intra.net (135.251.51.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 21 Nov 2019 16:07:13 +0800
Received: from CNSHPPEXCH1601.nsn-intra.net ([135.251.51.101]) by
 CNSHPPEXCH1601.nsn-intra.net ([135.251.51.101]) with mapi id 15.01.1713.007;
 Thu, 21 Nov 2019 16:07:13 +0800
From:   "Wang, Peng 1. (NSB - CN/Hangzhou)" <peng.1.wang@nokia-sbell.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] watchdog: make DesignWare watchdog allow users to set
 bigger timeout value
Thread-Topic: [PATCH] watchdog: make DesignWare watchdog allow users to set
 bigger timeout value
Thread-Index: AdWfimD0awmuxWORQi2dTd1MQDV31P//8UQA//7z6PCAAbruAP//MECw
Date:   Thu, 21 Nov 2019 08:07:13 +0000
Message-ID: <2ba1cd4773c84ce28512aacde17034ed@nokia-sbell.com>
References: <13477f08400047c1b32030b2680a4241@nokia-sbell.com>
 <20191120171512.GA28255@roeck-us.net>
 <9128f42a3e4347f2adfccb8aa2833e2e@nokia-sbell.com>
 <b0fcaae6-c9da-f551-5af4-ff112b08e851@roeck-us.net>
In-Reply-To: <b0fcaae6-c9da-f551-5af4-ff112b08e851@roeck-us.net>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [135.251.51.115]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprNIsWRmVeSWpSXmKPExsXS/ts4S3eT67VYg9bD4haXd81hs7ixbh+7
        xZOFZ5gsHr/8x+zA4rFyzRpWj53fG9g9Pm+SC2CO4rJJSc3JLEst0rdL4Mo4e2orY8ErrYp9
        s3kbGO9odjFycEgImEhc/qjaxcjFISRwiEni4b2lrBDOX0aJ3vUtUM4mRokvi/uAHE4ONgF3
        iaZN69hAbBEBNYnmUy1sIEXMArsZJeY2vmEBSQgLJEpcf3GeCaIoSeLGw/8sELabxMz538Bs
        FgFViU93v4MN4hWwk7i07Ck7xLaLjBIzFj4GS3AKOEjsPDkDrIFRQFZi2qP7YEOZBcQlbj2Z
        D2ZLCAhILNlznhnCFpV4+fgfK8RvShJ9G5hATGYBTYn1u/QhOhUlpnQ/ZIdYKyhxcuYTlgmM
        YrOQDJ2F0DELSccsJB0LGFlWMUon5xVnZBXnZuYZGOvl5WdnJuoWJ6Xm5Ogl5+duYgRG2RqJ
        SdN3MB474H2IUYCDUYmHN0PjaqwQa2JZcWXuIUYJDmYlEd4916/ECvGmJFZWpRblxxeV5qQW
        H2KU5mBREudtmbwwVkggPbEkNTs1tSC1CCbLxMEp1cC4xbW4VXSJ90LLCCmrylWiButk3hm8
        6L0jHfz6dKwpi8KX1kMhPo0xxvo84Tb/6tyWdd1/9ehGbZrXxgCn9lVn++67u/ndWrKx71Hi
        4+sN9nKn1jBfOst7IU2s0MJnhgRLcSav7Sd528vhySwBcmef/pM4/4qlduXyA9tiHnwLVd9/
        PPHNqe1KLMUZiYZazEXFiQDpES7wrgIAAA==
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

QWN0dWFsbHksIHRoaXMgZnVuY3Rpb24gaXMgdXNlZCBieSB3YXRjaGRvZ19kZXYuYywgdGhlIHRp
bWVvdXQgdmFsdWUgaW4gd2RkIGlzIGFscmVhZHkgbW9kaWZpZWQgdGhlcmUuIA0KYnV0IHllcywg
eW91IGFyZSByaWdodCwgZGVjaWRlIHRoZSBhY3R1YWwgdGltZW91dCB2YWx1ZSBoZXJlIGlzIG1v
cmUgcmVhc29uYWJsZS4gOikNCg0KdGhhbmtzLA0KUGVuZyBXYW5nDQotLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KRnJvbTogR3VlbnRlciBSb2VjayBbbWFpbHRvOmdyb2VjazdAZ21haWwuY29t
XSBPbiBCZWhhbGYgT2YgR3VlbnRlciBSb2Vjaw0KU2VudDogVGh1cnNkYXksIE5vdmVtYmVyIDIx
LCAyMDE5IDExOjQxIEFNDQpUbzogV2FuZywgUGVuZyAxLiAoTlNCIC0gQ04vSGFuZ3pob3UpIDxw
ZW5nLjEud2FuZ0Bub2tpYS1zYmVsbC5jb20+DQpDYzogd2ltQGxpbnV4LXdhdGNoZG9nLm9yZzsg
bGludXgtd2F0Y2hkb2dAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwu
b3JnDQpTdWJqZWN0OiBSZTogW1BBVENIXSB3YXRjaGRvZzogbWFrZSBEZXNpZ25XYXJlIHdhdGNo
ZG9nIGFsbG93IHVzZXJzIHRvIHNldCBiaWdnZXIgdGltZW91dCB2YWx1ZQ0KDQpPbiAxMS8yMC8x
OSA1OjI5IFBNLCBXYW5nLCBQZW5nIDEuIChOU0IgLSBDTi9IYW5nemhvdSkgd3JvdGU6DQo+IEhp
IEd1ZW50ZXIsDQo+IA0KPiBUaGFuayB5b3UgZm9yIHlvdXIgdGltZS4NCj4gLSBJIHdpbGwgcmVt
b3ZlIHRoZSB1bm5lY2Vzc2FyeSB7fQ0KPiAtIHdkZC0+bWF4X2h3X2hlYXJ0YmVhdF9tcyBpcyB0
aGUgbWF4IHRpbWVvdXQgdmFsdWUgd2hpY2ggSFcgY2FuIHN1cHBvcnQsIHRoaXMgdmFsdWUgaXMg
bGltaXRlZCBhY2NvcmRpbmcgdG8gdGhlIGlucHV0IGNsb2NrLCBzYXkuIEl0IG9ubHkgc3VwcG9y
dHMgMjAgc2Vjb25kcywgaWYgdXNlcnMgcmVxdWlyZXMgdG8gc2V0IHRpbWVvdXQgdG8gYmUgc2F5
LiA2MCBzZWNvbmRzLCB0aGUgd2F0Y2hkb2cgZGV2aWNlIGRyaXZlciAnd2F0Y2hkb2dfZGV2LmMn
IGNoZWNrcyBpZiB3ZGQtPnRpbWVvdXQgaXMgYmlnZ2VyIHRoYW4gd2RkLT5tYXhfaHdfaGVhcnRi
ZWF0X21zLCBpZiB5ZXMsIHdhdGNoZG9nX2Rldi5jIGZlZWRzIHRoZSB3YXRjaGRvZyBieSBhIHdv
cmtlciBxdWV1ZSBpdHNlbGYgdG8gaGVscCB0byBmZWVkIHRoZSB3YXRjaGRvZyBiZWZvcmUgNjAg
c2Vjb25kcyBlbGFwc2UuIEhlcmUgdGhlIGlzc3VlIG9mIGR3X3dkdC5jIGlzIHRoYXQsIHRoZSBv
cmlnaW5hbCBjb2RlcyB1cGRhdGUgd2RkLT50aW1lb3V0IHRvIHRoZSB2YWx1ZSB3aGljaCBIVyBj
YW4gc3VwcG9ydCwgd2hpY2ggbWVhbnMgaWYgdXNlcnMgcmVxdWlyZXMgNjAgc2Vjb25kcyB0byBi
ZSB0aGUgdGltZW91dCwgdGhlbiBkd193ZHQuYyB1cGRhdGVzIHRoZSB0aW1lb3V0IHZhbHVlIHRv
IDIwIHNlY29uZHMsIHRoaXMgbWFrZXMgdGhlICJmZWVkaW5nIGhlbHBlciIgbWVjaGFuaXNtIGlu
IHdhdGNoZG9nX2Rldi5jIG5vdCB0YWtlIGVmZmVjdC4gVGhhdCdzIHdoeSBJIGFkZCB0aGlzIGNo
ZWNrLg0KPiANCg0KWWVzLCBJIHVuZGVyc3RhbmQgeW91IG5lZWQgYSBjaGVjay4gV2hhdCBJIGFt
IHNheWluZyBpcyB0aGF0IHRoZSBjaGVjayBpcyB3cm9uZy4NCg0KWW91IG5lZWQgc29tZXRoaW5n
IGxpa2UNCg0KCWlmICh0b3BfcyA+IERXX1dEVF9NQVhfVE9QKQ0KCQl3ZHQtPnRpbWVvdXQgPSB0
b3BfczsNCgllbHNlDQoJCXdkdC0+dGltZW91dCA9IGR3X3dkdF90b3BfaW5fc2Vjb25kcyhkd193
ZHQsIHRvcF92YWwpOw0KDQpHdWVudGVyDQoNCj4gVGhhbmtzLA0KPiBQZW5nIFdhbmcNCj4gDQo+
IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEd1ZW50ZXIgUm9lY2sgW21haWx0
bzpncm9lY2s3QGdtYWlsLmNvbV0gT24gQmVoYWxmIE9mIEd1ZW50ZXIgDQo+IFJvZWNrDQo+IFNl
bnQ6IFRodXJzZGF5LCBOb3ZlbWJlciAyMSwgMjAxOSAxOjE1IEFNDQo+IFRvOiBXYW5nLCBQZW5n
IDEuIChOU0IgLSBDTi9IYW5nemhvdSkgPHBlbmcuMS53YW5nQG5va2lhLXNiZWxsLmNvbT4NCj4g
Q2M6IHdpbUBsaW51eC13YXRjaGRvZy5vcmc7IGxpbnV4LXdhdGNoZG9nQHZnZXIua2VybmVsLm9y
ZzsgDQo+IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRD
SF0gd2F0Y2hkb2c6IG1ha2UgRGVzaWduV2FyZSB3YXRjaGRvZyBhbGxvdyB1c2VycyB0byANCj4g
c2V0IGJpZ2dlciB0aW1lb3V0IHZhbHVlDQo+IA0KPiBPbiBXZWQsIE5vdiAyMCwgMjAxOSBhdCAx
MDowNzo1N0FNICswMDAwLCBXYW5nLCBQZW5nIDEuIChOU0IgLSBDTi9IYW5nemhvdSkgd3JvdGU6
DQo+PiAgRnJvbSAxZDA1MWI3YzA4MTA4Mzc1MWRjMGJhYjk3ZDNhYjllZmJiYTBmNGE3IE1vbiBT
ZXAgMTcgMDA6MDA6MDAgDQo+PiAyMDAxDQo+PiBGcm9tOiBQZW5nIFdhbmcgPHBlbmcuMS53YW5n
QG5va2lhLXNiZWxsLmNvbT4NCj4+IERhdGU6IFdlZCwgMjAgTm92IDIwMTkgMTU6MTI6NTkgKzA4
MDANCj4+IFN1YmplY3Q6IFtQQVRDSF0gd2F0Y2hkb2c6IG1ha2UgRGVzaWduV2FyZSB3YXRjaGRv
ZyBhbGxvdyB1c2VycyB0byANCj4+IHNldCBiaWdnZXIgIHRpbWVvdXQgdmFsdWUNCj4+DQo+PiB3
YXRjaGRvZ19kZXYuYyBwcm92aWRlcyBtZWFucyB0byBhbGxvdyB1c2VycyB0byBzZXQgYmlnZ2Vy
IHRpbWVvdXQgDQo+PiB2YWx1ZSB0aGFuIEhXIGNhbiBzdXBwb3J0LCBtYWtlIERlc2lnbldhcmUg
d2F0Y2hkb2cgYWxpZ24gd2l0aCB0aGlzLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IFBlbmcgV2Fu
ZyA8cGVuZy4xLndhbmdAbm9raWEtc2JlbGwuY29tPg0KPj4gLS0tDQo+PiAgIGRyaXZlcnMvd2F0
Y2hkb2cvZHdfd2R0LmMgfCAxMSArKysrKysrKystLQ0KPj4gICAxIGZpbGUgY2hhbmdlZCwgOSBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L3dhdGNoZG9nL2R3X3dkdC5jIGIvZHJpdmVycy93YXRjaGRvZy9kd193ZHQuYyANCj4+IGluZGV4
IGZlZjdjNjEuLjg5MTFlNWUgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL3dhdGNoZG9nL2R3X3dk
dC5jDQo+PiArKysgYi9kcml2ZXJzL3dhdGNoZG9nL2R3X3dkdC5jDQo+PiBAQCAtMTEzLDggKzEx
MywxNSBAQCBzdGF0aWMgaW50IGR3X3dkdF9zZXRfdGltZW91dChzdHJ1Y3Qgd2F0Y2hkb2dfZGV2
aWNlICp3ZGQsIHVuc2lnbmVkIGludCB0b3BfcykNCj4+ICAgCSAqLw0KPj4gICAJd3JpdGVsKHRv
cF92YWwgfCB0b3BfdmFsIDw8IFdET0dfVElNRU9VVF9SQU5HRV9UT1BJTklUX1NISUZULA0KPj4g
ICAJICAgICAgIGR3X3dkdC0+cmVncyArIFdET0dfVElNRU9VVF9SQU5HRV9SRUdfT0ZGU0VUKTsN
Cj4+IC0NCj4+IC0Jd2RkLT50aW1lb3V0ID0gZHdfd2R0X3RvcF9pbl9zZWNvbmRzKGR3X3dkdCwg
dG9wX3ZhbCk7DQo+PiArDQo+PiArICAgIC8qDQo+PiArICAgICAqIEluIGNhc2UgdXNlcnMgc2V0
IGJpZ2dlciB0aW1lb3V0IHZhbHVlIHRoYW4gSFcgY2FuIHN1cHBvcnQsDQo+PiArICAgICAqIGtl
cm5lbCh3YXRjaGRvZ19kZXYuYykgaGVscHMgdG8gZmVlZCB3YXRjaGRvZyBiZWZvcmUNCj4+ICsg
ICAgICogd2RkLT50aW1lb3V0DQo+PiArICAgICAqLw0KPj4gKyAgICBpZiAoIHdkZC0+dGltZW91
dCAqIDEwMDAgPD0gd2RkLT5tYXhfaHdfaGVhcnRiZWF0X21zICkgew0KPj4gKwkgICAgd2RkLT50
aW1lb3V0ID0gZHdfd2R0X3RvcF9pbl9zZWNvbmRzKGR3X3dkdCwgdG9wX3ZhbCk7DQo+PiArICAg
IH0NCj4gDQo+IHsgfSBpcyB1bm5lY2Vzc2FyeSBoZXJlLiBBbHNvLCB0aGUgYWJvdmUgY29kZSBj
b21wYXJlcyB0aGUgX29sZF8gdGltZW91dCBhZ2FpbnQgdGhlIG1heGltdW0gc3VwcG9ydGVkIHRp
bWVvdXQsIHdoaWNoIGRvZXNuJ3QgbG9vayBjb3JyZWN0Lg0KPiANCj4gVGhhbmtzLA0KPiBHdWVu
dGVyDQo+IA0KPj4gICANCj4+ICAgCXJldHVybiAwOw0KPj4gICB9DQo+PiAtLQ0KPj4gMS44LjMu
MQ0KPj4NCj4gDQoNCg==
