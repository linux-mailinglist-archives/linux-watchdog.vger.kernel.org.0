Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEFFE35AA74
	for <lists+linux-watchdog@lfdr.de>; Sat, 10 Apr 2021 05:11:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232855AbhDJDMB (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 9 Apr 2021 23:12:01 -0400
Received: from m176149.mail.qiye.163.com ([59.111.176.149]:53065 "EHLO
        m176149.mail.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229665AbhDJDMB (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 9 Apr 2021 23:12:01 -0400
Received: from vivo.com (wm-9.qy.internal [127.0.0.1])
        by m176149.mail.qiye.163.com (Hmail) with ESMTP id 72DB6282503;
        Sat, 10 Apr 2021 11:11:45 +0800 (CST)
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Message-ID: <AKoADwCwDn4bllbdA00CnKoA.3.1618024305455.Hmail.wangqing@vivo.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: =?UTF-8?B?UmU6UmU6IFtQQVRDSF0gd2F0Y2hkb2c6IG10azogc3VwcG9ydCBwcmUtdGltZW91dCB3aGVuIHRoZSBiYXJrIGlycSBpcyBhdmFpbGFibGU=?=
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2016-163.com
X-Originating-IP: 36.152.145.182
In-Reply-To: <95861c15-0294-ddda-6080-ca15f19eb048@roeck-us.net>
MIME-Version: 1.0
Received: from wangqing@vivo.com( [36.152.145.182) ] by ajax-webmail ( [127.0.0.1] ) ; Sat, 10 Apr 2021 11:11:45 +0800 (GMT+08:00)
From:   =?UTF-8?B?546L5pOO?= <wangqing@vivo.com>
Date:   Sat, 10 Apr 2021 11:11:45 +0800 (GMT+08:00)
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
        oVCBIfWUFZGU9OGFZMTR5PQkhCGh0eT09VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
        hKQ1VLWQY+
X-HM-Sender-Digest: e1kJHlYWEh9ZQU1JTEhOTkhCSUtLN1dZDB4ZWUEPCQ4eV1kSHx4VD1lB
        WUc6MBQ6Pww4DD8VTxkXFxkfOktLOBUwFDpVSFVKTUpDS0lPSEtOTE5JVTMWGhIXVQwaFRwKEhUc
        Ow0SDRRVGBQWRVlXWRILWUFZSE1VSk5JVUpPTlVKQ0lZV1kIAVlBT01PTDcG
X-HM-Tid: 0a78b9c393409395kuws72db6282503
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Cj5PbiA0LzkvMjEgNzo0MiBQTSwg546L5pOOIHdyb3RlOgo+PiAKPj4+IE9uIDQvOS8yMSAyOjU1
IEFNLCBXYW5nIFFpbmcgd3JvdGU6Cj4+Pj4gVXNlIHRoZSBiYXJrIGludGVycnVwdCBhcyB0aGUg
cHJldGltZW91dCBub3RpZmllciBpZiBhdmFpbGFibGUuCj4+Pj4KPj4+PiBCeSBkZWZhdWx0LCB0
aGUgcHJldGltZW91dCBub3RpZmljYXRpb24gc2hhbGwgb2NjdXIgb25lIHNlY29uZCBlYXJsaWVy
Cj4+Pj4gdGhhbiB0aGUgdGltZW91dC4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IFdhbmcgUWlu
ZyA8d2FuZ3FpbmdAdml2by5jb20+Cj4+Pj4gLS0tCj4+Pj4gIGRyaXZlcnMvd2F0Y2hkb2cvbXRr
X3dkdC5jIHwgNDcgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0t
LQo+Pj4+ICAxIGZpbGUgY2hhbmdlZCwgNDQgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkK
Pj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3dhdGNoZG9nL210a193ZHQuYyBiL2RyaXZl
cnMvd2F0Y2hkb2cvbXRrX3dkdC5jCj4+Pj4gaW5kZXggOTdjYTk5My4uOGI5MTljYwo+Pj4+IC0t
LSBhL2RyaXZlcnMvd2F0Y2hkb2cvbXRrX3dkdC5jCj4+Pj4gKysrIGIvZHJpdmVycy93YXRjaGRv
Zy9tdGtfd2R0LmMKPj4+PiBAQCAtMjUsNiArMjUsNyBAQAo+Pj4+ICAjaW5jbHVkZSA8bGludXgv
cmVzZXQtY29udHJvbGxlci5oPgo+Pj4+ICAjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4KPj4+PiAg
I2luY2x1ZGUgPGxpbnV4L3dhdGNoZG9nLmg+Cj4+Pj4gKyNpbmNsdWRlIDxsaW51eC9pbnRlcnJ1
cHQuaD4KPj4+PiAgCj4+Pj4gICNkZWZpbmUgV0RUX01BWF9USU1FT1VUCQkzMQo+Pj4+ICAjZGVm
aW5lIFdEVF9NSU5fVElNRU9VVAkJMQo+Pj4+IEBAIC0yMzQsMTggKzIzNSwzNSBAQCBzdGF0aWMg
aW50IG10a193ZHRfc3RhcnQoc3RydWN0IHdhdGNoZG9nX2RldmljZSAqd2R0X2RldikKPj4+PiAg
CXZvaWQgX19pb21lbSAqd2R0X2Jhc2UgPSBtdGtfd2R0LT53ZHRfYmFzZTsKPj4+PiAgCWludCBy
ZXQ7Cj4+Pj4gIAo+Pj4+IC0JcmV0ID0gbXRrX3dkdF9zZXRfdGltZW91dCh3ZHRfZGV2LCB3ZHRf
ZGV2LT50aW1lb3V0KTsKPj4+PiArCXJldCA9IG10a193ZHRfc2V0X3RpbWVvdXQod2R0X2Rldiwg
d2R0X2Rldi0+dGltZW91dCAtIHdkdF9kZXYtPnByZXRpbWVvdXQpOwo+Pj4KPj4+IFRoYXQgbG9v
a3Mgc3VzcGljaW91c2x5IGxpa2UgdGhlIHJlYWwgd2F0Y2hkb2cgd29uJ3QgaGFwcGVuIGF0IGFs
bC4KPj4+IFdoYXQgd2lsbCBoYXBwZW4gaWYgdGhlIHByZXRpbWVvdXQgZ292ZXJub3IgaXMgc2V0
IHRvIG5vbmUgPwo+Pj4KPj4+IEd1ZW50ZXIKPj4+Cj4+IFRoZSBwcmV0aW1lb3V0IGdvdmVybm9y
IGlzIHBhbmljIGJ5IGRlZmF1bHQuIElmIHByZXRpbWVvdXQgaXMgZW5hYmxlZCBhbmQgdGhlIGdv
dmVybm9yIGlzCj4+IHNldCB0byBub25lLCBpdCBtZWFucyB0aGUgdGltZW91dCBiZWhhdmlvciBk
b2VzIG5vdCBuZWVkIHRvIGJlIHByb2Nlc3NlZCwgb25seSBwcmludGluZy4KPj4gCj4KPlRoYXQg
d2FzIG5vdCBteSBxdWVzdGlvbi4gTXkgcXVlc3Rpb24gd2FzIGlmIHRoZSByZWFsIHRpbWVvdXQg
aGFwcGVucyBpbiB0aGF0IGNhc2UuCj4KPkd1ZW50ZXIKPgpZZXMsIHRoZSByZWFsIHRpbWVvdXQg
d2lsbCBoYXBwZW4uIEFmdGVyIFdEVCB0aW1lb3V0LCBJUlEgaXMgc2VudCBvdXQgaW5zdGVhZCBv
ZiAKcmVzZXQgc2lnbmFsIGZpcnN0LiBJbiBvcmRlciB0byBlbnN1cmUgdGhhdCBDUFUgZG9lcyBu
b3QgZ2V0IHN0dWNrIGFmdGVyIElSUSBpcyBzZW50IG91dCwgCldEVCB3aWxsIHRpbWUgYWdhaW4g
YW5kIHNlbmQgcmVzZXQgc2lnbmFsIHRvIHJlc2V0LgoKVGhhbmtzLgpRaW5nIFdhbmcuDQoNCg==
