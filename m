Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 766C324F102
	for <lists+linux-watchdog@lfdr.de>; Mon, 24 Aug 2020 04:14:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727961AbgHXCOQ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 23 Aug 2020 22:14:16 -0400
Received: from spam.zju.edu.cn ([61.164.42.155]:18030 "EHLO zju.edu.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727839AbgHXCOP (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 23 Aug 2020 22:14:15 -0400
Received: by ajax-webmail-mail-app3 (Coremail) ; Mon, 24 Aug 2020 10:13:49
 +0800 (GMT+08:00)
X-Originating-IP: [210.32.144.184]
Date:   Mon, 24 Aug 2020 10:13:49 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From:   dinghao.liu@zju.edu.cn
To:     "Guenter Roeck" <linux@roeck-us.net>
Cc:     kjlu@umn.edu, "Wim Van Sebroeck" <wim@linux-watchdog.org>,
        "Alexander Sverdlin" <alexander.sverdlin@nokia.com>,
        "Krzysztof Sobota" <krzysztof.sobota@nokia.com>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH] watchdog: Fix double-free in watchdog_cdev_register
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.12 build 20200616(0f5d8152)
 Copyright (c) 2002-2020 www.mailtech.cn zju.edu.cn
In-Reply-To: <03f9c262-3174-21e4-2211-df9fb2097457@roeck-us.net>
References: <20200823071338.15209-1-dinghao.liu@zju.edu.cn>
 <03f9c262-3174-21e4-2211-df9fb2097457@roeck-us.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <21aff512.26d4.1741e3e3bef.Coremail.dinghao.liu@zju.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: cC_KCgDXLvVdIkNfoUgbAw--.43095W
X-CM-SenderInfo: qrrzjiaqtzq6lmxovvfxof0/1tbiAgUCBlZdtPpD7wAAsq
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJTRUUUbGCS07vEb7Iv0x
        C_Cr1lV2xY67kC6x804xWlV2xY67CY07I20VC2zVCF04k26cxKx2IYs7xG6rWj6s0DMIAI
        bVAFxVCF77xC64kEw24lV2xY67C26IkvcIIF6IxKo4kEV4ylV2xY628lY4IE4IxF12IF4w
        CS07vE84x0c7CEj48ve4kI8wCS07vE84ACjcxK6xIIjxv20xvE14v26w1j6s0DMIAIbVA2
        z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJr0_GcWlV2xY628EF7xvwVC2z280aVAFwI0_Gc
        CE3s1lV2xY628EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wCS07vEe2I262IYc4CY6c8I
        j28IcVAaY2xG8wCS07vE5I8CrVACY4xI64kE6c02F40Ex7xfMIAIbVAv7VC0I7IYx2IY67
        AKxVWUJVWUGwCS07vEYx0Ex4A2jsIE14v26r1j6r4UMIAIbVAm72CE4IkC6x0Yz7v_Jr0_
        Gr1lV2xY6x02cVAKzwCS07vEc2xSY4AK67AK6r4UMIAIbVCY0x0Ix7I2Y4AK64vIr41lV2
        xY6xAIw28IcVCjz48v1sIEY20_GFWkJr1UJwCS07vE4x8a6x804xWlV2xY6xC20s026xCa
        FVCjc4AY6r1j6r4UMIAIbVC20s026c02F40E14v26r1j6r18MIAIbVC20s026x8GjcxK67
        AKxVWUGVWUWwCS07vEx4CE17CEb7AF67AKxVWUAVWUtwCS07vEIxAIcVC0I7IYx2IY67AK
        xVWUJVWUCwCS07vEIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIAIbVCI42IY6xAIw2
        0EY4v20xvaj40_WFyUJVCq3wCS07vEIxAIcVC2z280aVAFwI0_Jr0_Gr1lV2xY6IIF0xvE
        x4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUU==
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

PiBPbiA4LzIzLzIwIDEyOjEzIEFNLCBEaW5naGFvIExpdSB3cm90ZToKPiA+IFdoZW4gbWlzY19y
ZWdpc3RlcigpIGZhaWxzLCB3ZF9kYXRhIHdpbGwgYmUgcmVsZWFzZWQgYnkgdGhlCj4gPiByZWxl
YXNlIGNhbGxiYWNrIGZ1bmN0aW9uIHdhdGNoZG9nX2NvcmVfZGF0YV9yZWxlYXNlKCksIHNvCj4g
PiB3ZSBkb24ndCBuZWVkIHRvIGZyZWUgaXQgYWdhaW4uIEJ1dCB3aGVuIHdhdGNoZG9nX2t3b3Jr
ZXIgaXMKPiA+IE5VTEwsIHdlIHNob3VsZCBmcmVlIHdkX2RhdGEgdG8gcHJldmVudCBtZW1sZWFr
Lgo+ID4gCj4gPiBGaXhlczogY2IzNmUyOWJiMGU0YiAoIndhdGNoZG9nOiBpbml0aWFsaXplIGRl
dmljZSBiZWZvcmUgbWlzY19yZWdpc3RlciIpCj4gPiBTaWduZWQtb2ZmLWJ5OiBEaW5naGFvIExp
dSA8ZGluZ2hhby5saXVAemp1LmVkdS5jbj4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvd2F0Y2hkb2cv
d2F0Y2hkb2dfZGV2LmMgfCA1ICsrKy0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvd2F0Y2hk
b2cvd2F0Y2hkb2dfZGV2LmMgYi9kcml2ZXJzL3dhdGNoZG9nL3dhdGNoZG9nX2Rldi5jCj4gPiBp
bmRleCA2Nzk4YWRkYWJkNWEuLjhlZTc4ZTI2ZmViMSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMv
d2F0Y2hkb2cvd2F0Y2hkb2dfZGV2LmMKPiA+ICsrKyBiL2RyaXZlcnMvd2F0Y2hkb2cvd2F0Y2hk
b2dfZGV2LmMKPiA+IEBAIC05OTQsOCArOTk0LDEwIEBAIHN0YXRpYyBpbnQgd2F0Y2hkb2dfY2Rl
dl9yZWdpc3RlcihzdHJ1Y3Qgd2F0Y2hkb2dfZGV2aWNlICp3ZGQpCj4gPiAgCXdkX2RhdGEtPndk
ZCA9IHdkZDsKPiA+ICAJd2RkLT53ZF9kYXRhID0gd2RfZGF0YTsKPiA+ICAKPiA+IC0JaWYgKElT
X0VSUl9PUl9OVUxMKHdhdGNoZG9nX2t3b3JrZXIpKQo+ID4gKwlpZiAoSVNfRVJSX09SX05VTEwo
d2F0Y2hkb2dfa3dvcmtlcikpIHsKPiA+ICsJCWtmcmVlKHdkX2RhdGEpOwo+IAo+IFRoaXMgc2hv
dWxkIGJlIGEgc2VwYXJhdGUgcGF0Y2gsIHdpdGgKPiAKPiBGaXhlczogNjY0YTM5MjM2ZTcxOCAo
IndhdGNoZG9nOiBJbnRyb2R1Y2UgaGFyZHdhcmUgbWF4aW11bSBoZWFydGJlYXQgaW4gd2F0Y2hk
b2cgY29yZSIpCj4gCgpUaGFuayB5b3UgZm9yIHlvdXIgYWR2aWNlLiBJIHdpbGwgc2VuZCBhIG5l
dyBwYXRjaCB0byBmaXggdGhpcyBzb29uLgoKPiA+ICAJCXJldHVybiAtRU5PREVWOwo+ID4gKwl9
Cj4gPiAgCj4gPiAgCWRldmljZV9pbml0aWFsaXplKCZ3ZF9kYXRhLT5kZXYpOwo+ID4gIAl3ZF9k
YXRhLT5kZXYuZGV2dCA9IE1LREVWKE1BSk9SKHdhdGNoZG9nX2RldnQpLCB3ZGQtPmlkKTsKPiA+
IEBAIC0xMDIxLDcgKzEwMjMsNiBAQCBzdGF0aWMgaW50IHdhdGNoZG9nX2NkZXZfcmVnaXN0ZXIo
c3RydWN0IHdhdGNoZG9nX2RldmljZSAqd2RkKQo+ID4gIAkJCQlwcl9lcnIoIiVzOiBhIGxlZ2Fj
eSB3YXRjaGRvZyBtb2R1bGUgaXMgcHJvYmFibHkgcHJlc2VudC5cbiIsCj4gPiAgCQkJCQl3ZGQt
PmluZm8tPmlkZW50aXR5KTsKPiA+ICAJCQlvbGRfd2RfZGF0YSA9IE5VTEw7Cj4gPiAtCQkJa2Zy
ZWUod2RfZGF0YSk7Cj4gCj4gQXJlIHlvdSBzdXJlIGFib3V0IHRoaXMgPyBwdXRfZGV2aWNlKCkg
aXNuJ3QgY2FsbGVkIG9uICZ3ZF9kYXRhLT5kZXYKPiAodW5saWtlIHRoZSBjb2RlIGZ1cnRoZXIg
YmVsb3cpLiBIb3cgZG8geW91IHRyaWdnZXIgdGhlIGRvdWJsZSBmcmVlLAo+IG9yLCBpbiBvdGhl
ciB3b3JkcywgaG93IGlzIHdhdGNoZG9nX2NvcmVfZGF0YV9yZWxlYXNlKCkgZXZlciBjYWxsZWQK
PiBpbiB0aGlzIGNvZGUgcGF0aCA/Cj4gCj4gZGV2aWNlX2luaXRpYWxpemUoKSBzYXlzOgo+IAlO
T1RFOiBVc2UgcHV0X2RldmljZSgpIHRvIGdpdmUgdXAgeW91ciByZWZlcmVuY2UgaW5zdGVhZCBv
ZiBmcmVlaW5nCj4gCUBkZXYgZGlyZWN0bHkgb25jZSB5b3UgaGF2ZSBjYWxsZWQgdGhpcyBmdW5j
dGlvbi4KPiBzbyBpdCBsb29rcyBsaWtlIHB1dF9kZXZpY2UoKSBzaG91bGQgYmUgY2FsbGVkIGlu
c3RlYWQgb2Yga2ZyZWUoKS4KPiAKCllvdSBhcmUgcmlnaHQuIFRoZSBjYWxsYmFjayB3aWxsIGZy
ZWUgd2RfZGF0YS0+ZGV2IGFmdGVyIGFsbCByZWZlcmVuY2VzCmhhdmUgZ29uZSBhd2F5LiBTbyB3
ZSBzaG91bGQgdXNlIHB1dF9kZXZpY2UoKSBoZXJlLiBJIHdpbGwgZml4IHRoaXMgc29vbi4KClJl
Z2FyZHMsCkRpbmdoYW8=
