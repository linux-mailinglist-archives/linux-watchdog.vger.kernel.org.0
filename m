Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F134435AD38
	for <lists+linux-watchdog@lfdr.de>; Sat, 10 Apr 2021 14:19:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234373AbhDJMTm (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 10 Apr 2021 08:19:42 -0400
Received: from m176149.mail.qiye.163.com ([59.111.176.149]:62508 "EHLO
        m176149.mail.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234262AbhDJMTl (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 10 Apr 2021 08:19:41 -0400
Received: from vivo.com (wm-9.qy.internal [127.0.0.1])
        by m176149.mail.qiye.163.com (Hmail) with ESMTP id 308D62829A6;
        Sat, 10 Apr 2021 20:19:22 +0800 (CST)
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Message-ID: <AD6AsgAeDkibbqIS7o2O1arH.3.1618057162190.Hmail.wangqing@vivo.com>
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
In-Reply-To: <45e40a84-9d98-87e7-659e-6c34834e6280@roeck-us.net>
MIME-Version: 1.0
Received: from wangqing@vivo.com( [36.152.145.182) ] by ajax-webmail ( [127.0.0.1] ) ; Sat, 10 Apr 2021 20:19:22 +0800 (GMT+08:00)
From:   =?UTF-8?B?546L5pOO?= <wangqing@vivo.com>
Date:   Sat, 10 Apr 2021 20:19:22 +0800 (GMT+08:00)
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
        oVCBIfWUFZQ0xPHVZCQx8dSElITUlOSRhVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
        hKQ1VLWQY+
X-HM-Sender-Digest: e1kJHlYWEh9ZQU1JTEhNT09ISUxLN1dZDB4ZWUEPCQ4eV1kSHx4VD1lB
        WUc6P006CBw6Hj8QEhkZCjIoTBRJNEoaCTNVSFVKTUpDS05MSk1JTk5IVTMWGhIXVQwaFRwKEhUc
        Ow0SDRRVGBQWRVlXWRILWUFZSE1VSk5JVUpPTlVKQ0lZV1kIAVlBTkNMTjcG
X-HM-Tid: 0a78bbb8edda9395kuws308d62829a6
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Cj5PbiA0LzkvMjEgODoxMSBQTSwg546L5pOOIHdyb3RlOgo+PiAKPj4+IE9uIDQvOS8yMSA3OjQy
IFBNLCDnjovmk44gd3JvdGU6Cj4+Pj4KPj4+Pj4gT24gNC85LzIxIDI6NTUgQU0sIFdhbmcgUWlu
ZyB3cm90ZToKPj4+Pj4+IFVzZSB0aGUgYmFyayBpbnRlcnJ1cHQgYXMgdGhlIHByZXRpbWVvdXQg
bm90aWZpZXIgaWYgYXZhaWxhYmxlLgo+Pj4+Pj4KPj4+Pj4+IEJ5IGRlZmF1bHQsIHRoZSBwcmV0
aW1lb3V0IG5vdGlmaWNhdGlvbiBzaGFsbCBvY2N1ciBvbmUgc2Vjb25kIGVhcmxpZXIKPj4+Pj4+
IHRoYW4gdGhlIHRpbWVvdXQuCj4+Pj4+Pgo+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogV2FuZyBRaW5n
IDx3YW5ncWluZ0B2aXZvLmNvbT4KPj4+Pj4+IC0tLQo+Pj4+Pj4gIGRyaXZlcnMvd2F0Y2hkb2cv
bXRrX3dkdC5jIHwgNDcgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Ky0tLQo+Pj4+Pj4gIDEgZmlsZSBjaGFuZ2VkLCA0NCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9u
cygtKQo+Pj4+Pj4KPj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3dhdGNoZG9nL210a193ZHQu
YyBiL2RyaXZlcnMvd2F0Y2hkb2cvbXRrX3dkdC5jCj4+Pj4+PiBpbmRleCA5N2NhOTkzLi44Yjkx
OWNjCj4+Pj4+PiAtLS0gYS9kcml2ZXJzL3dhdGNoZG9nL210a193ZHQuYwo+Pj4+Pj4gKysrIGIv
ZHJpdmVycy93YXRjaGRvZy9tdGtfd2R0LmMKPj4+Pj4+IEBAIC0yNSw2ICsyNSw3IEBACj4+Pj4+
PiAgI2luY2x1ZGUgPGxpbnV4L3Jlc2V0LWNvbnRyb2xsZXIuaD4KPj4+Pj4+ICAjaW5jbHVkZSA8
bGludXgvdHlwZXMuaD4KPj4+Pj4+ICAjaW5jbHVkZSA8bGludXgvd2F0Y2hkb2cuaD4KPj4+Pj4+
ICsjaW5jbHVkZSA8bGludXgvaW50ZXJydXB0Lmg+Cj4+Pj4+PiAgCj4+Pj4+PiAgI2RlZmluZSBX
RFRfTUFYX1RJTUVPVVQJCTMxCj4+Pj4+PiAgI2RlZmluZSBXRFRfTUlOX1RJTUVPVVQJCTEKPj4+
Pj4+IEBAIC0yMzQsMTggKzIzNSwzNSBAQCBzdGF0aWMgaW50IG10a193ZHRfc3RhcnQoc3RydWN0
IHdhdGNoZG9nX2RldmljZSAqd2R0X2RldikKPj4+Pj4+ICAJdm9pZCBfX2lvbWVtICp3ZHRfYmFz
ZSA9IG10a193ZHQtPndkdF9iYXNlOwo+Pj4+Pj4gIAlpbnQgcmV0Owo+Pj4+Pj4gIAo+Pj4+Pj4g
LQlyZXQgPSBtdGtfd2R0X3NldF90aW1lb3V0KHdkdF9kZXYsIHdkdF9kZXYtPnRpbWVvdXQpOwo+
Pj4+Pj4gKwlyZXQgPSBtdGtfd2R0X3NldF90aW1lb3V0KHdkdF9kZXYsIHdkdF9kZXYtPnRpbWVv
dXQgLSB3ZHRfZGV2LT5wcmV0aW1lb3V0KTsKPj4+Pj4KPj4+Pj4gVGhhdCBsb29rcyBzdXNwaWNp
b3VzbHkgbGlrZSB0aGUgcmVhbCB3YXRjaGRvZyB3b24ndCBoYXBwZW4gYXQgYWxsLgo+Pj4+PiBX
aGF0IHdpbGwgaGFwcGVuIGlmIHRoZSBwcmV0aW1lb3V0IGdvdmVybm9yIGlzIHNldCB0byBub25l
ID8KPj4+Pj4KPj4+Pj4gR3VlbnRlcgo+Pj4+Pgo+Pj4+IFRoZSBwcmV0aW1lb3V0IGdvdmVybm9y
IGlzIHBhbmljIGJ5IGRlZmF1bHQuIElmIHByZXRpbWVvdXQgaXMgZW5hYmxlZCBhbmQgdGhlIGdv
dmVybm9yIGlzCj4+Pj4gc2V0IHRvIG5vbmUsIGl0IG1lYW5zIHRoZSB0aW1lb3V0IGJlaGF2aW9y
IGRvZXMgbm90IG5lZWQgdG8gYmUgcHJvY2Vzc2VkLCBvbmx5IHByaW50aW5nLgo+Pj4+Cj4+Pgo+
Pj4gVGhhdCB3YXMgbm90IG15IHF1ZXN0aW9uLiBNeSBxdWVzdGlvbiB3YXMgaWYgdGhlIHJlYWwg
dGltZW91dCBoYXBwZW5zIGluIHRoYXQgY2FzZS4KPj4+Cj4+PiBHdWVudGVyCj4+Pgo+PiBZZXMs
IHRoZSByZWFsIHRpbWVvdXQgd2lsbCBoYXBwZW4uIEFmdGVyIFdEVCB0aW1lb3V0LCBJUlEgaXMg
c2VudCBvdXQgaW5zdGVhZCBvZiAKPj4gcmVzZXQgc2lnbmFsIGZpcnN0LiBJbiBvcmRlciB0byBl
bnN1cmUgdGhhdCBDUFUgZG9lcyBub3QgZ2V0IHN0dWNrIGFmdGVyIElSUSBpcyBzZW50IG91dCwg
Cj4+IFdEVCB3aWxsIHRpbWUgYWdhaW4gYW5kIHNlbmQgcmVzZXQgc2lnbmFsIHRvIHJlc2V0Lgo+
PiAKPgo+V2hlbiB3aWxsIHRoYXQgYmUsIG9yIGluIG90aGVyIHdvcmRzIGhvdyBkb2VzIHRoZSBj
aGlwIGtub3cgd2hlbiB0byB0aW1lIG91dCA/Cj5BZnRlciBhbGwsIG9ubHkgYSBzaW5nbGUgdGlt
ZW91dCB2YWx1ZSBpcyB3cml0dGVuIGludG8gdGhlIGNoaXAuIEkgZG9uJ3Qgc2VlIGhvdwo+aXQg
d291bGQga25vdyB0byByZXNldCB0aGUgY2hpcCBhZnRlciB3ZHRfZGV2LT50aW1lb3V0Lgo+Cj5H
dWVudGVyCj4KPgpTb3JyeSBJIG1hZGUgYSBtaXN0YWtlLCB0aGUgSVJRIGlzIHNlbnQgb3V0IGZp
cnN0LCB0aGVuIHRpbWUgYWdhaW4gYW5kIHJlc2V0IG9ubHkgd2hlbiAKV0RUX01PREVfSVJRX0VO
fFdEVF9NT0RFX0RVQUxfRU4gaXMgZW5hYmxlZC4gV0RUX01PREVfRFVBTF9FTiBtb2RlCmlzIGEg
c3BlY2lhbCBtb2RlLCBkZXBlbmRpbmcgb24gdGhlIHNwZWNpZmljIGNoaXAgZGVzaWduLgoKSWYg
V0RUX01PREVfSVJRX0VOfH5XRFRfTU9ERV9EVUFMX0VOIGFzIGRlc2NyaWJlZCBpbiBteSBwYXRj
aCwgaXQganVzdCBzZW50Cm91dCBJUlEgaW5zdGVhZCBvZiByZXNldCBzaWduYWwsIHRoZSByZWFs
IHRpbWVvdXQgd2lsbCBub3QgaGFwcGVuIGlmIHRoZSBwcmV0aW1lb3V0IApnb3Zlcm5vciBpcyBz
ZXQgdG8gbm9uZS4KCkFsc28sIH4oV0RUX01PREVfSVJRX0VOIHwgV0RUX01PREVfRFVBTF9FTikg
bWVhbnMgc2VuZCByZXNldCBzaWduYWwgZGlyZWN0bHkuCkl0IGRvZXMgbm90IHN1cHBvcnQgcHJl
dGltZW91dCBwcm9jZXNzaW5nLgoKVGhhbmtzClFpbmcgV2FuZw0KDQo=
