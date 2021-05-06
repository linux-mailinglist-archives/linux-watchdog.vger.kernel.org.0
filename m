Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A441A374D1F
	for <lists+linux-watchdog@lfdr.de>; Thu,  6 May 2021 03:57:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230033AbhEFB6I (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 5 May 2021 21:58:08 -0400
Received: from mail-m176231.qiye.163.com ([59.111.176.231]:15368 "EHLO
        mail-m176231.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbhEFB6I (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 5 May 2021 21:58:08 -0400
X-Greylist: delayed 338 seconds by postgrey-1.27 at vger.kernel.org; Wed, 05 May 2021 21:58:07 EDT
Received: from vivo.com (localhost [127.0.0.1])
        by mail-m176231.qiye.163.com (Hmail) with ESMTP id 3D56A6C00CF;
        Thu,  6 May 2021 09:51:30 +0800 (CST)
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Message-ID: <APgAqgAuDm48oWX*tq6AkKqd.3.1620265890239.Hmail.wangqing@vivo.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: =?UTF-8?B?UmU6UmU6IFtQQVRDSCBWOSAxLzJdIHdhdGNoZG9nOiBtdGs6IHN1cHBvcnQgcHJlLXRpbWVvdXQgd2hlbiB0aGUgYmFyayBpcnEgaXMgYXZhaWxhYmxl?=
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2016-163.com
X-Originating-IP: 36.152.145.182
In-Reply-To: <45ff044d-80ff-9001-1d4f-d39d0ae63060@roeck-us.net>
MIME-Version: 1.0
Received: from wangqing@vivo.com( [36.152.145.182) ] by ajax-webmail ( [127.0.0.1] ) ; Thu, 6 May 2021 09:51:30 +0800 (GMT+08:00)
From:   =?UTF-8?B?546L5pOO?= <wangqing@vivo.com>
Date:   Thu, 6 May 2021 09:51:30 +0800 (GMT+08:00)
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
        oVCBIfWUFZQh0aQlYaGUhPTh5OHkJCHUJVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
        hKQ1VLWQY+
X-HM-Sender-Digest: e1kJHlYWEh9ZQU1ISU9KTUlPQ0JON1dZDB4ZWUEPCQ4eV1kSHx4VD1lB
        WUc6Kxw6Chw6Dj8WT0MULCNRDwpNOhAwCh9VSFVKTUlLSU1OQ0JLTkpLVTMWGhIXVQwaFRwKEhUc
        Ow0SDRRVGBQWRVlXWRILWUFZSE1VSk5JVUpPTlVKQ0lZV1kIAVlBSExOTDcG
X-HM-Tid: 0a793f5f71d1d9a9kuws3d56a6c00cf
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Cj5PbiA0LzI0LzIxIDY6NTIgUE0sIFdhbmcgUWluZyB3cm90ZToKPj4gVXNlIHRoZSBiYXJrIGlu
dGVycnVwdCBhcyB0aGUgcHJldGltZW91dCBub3RpZmllciBpZiBhdmFpbGFibGUuCj4+IAo+PiBX
aGVuIHRoZSB3YXRjaGRvZyB0aW1lciBleHBpcmVzIGluIGR1YWwgbW9kZSwgYW4gaW50ZXJydXB0
IHdpbGwgYmUKPj4gdHJpZ2dlcmVkIGZpcnN0LCB0aGVuIHRoZSB0aW1pbmcgcmVzdGFydHMuIFRo
ZSByZXNldCBzaWduYWwgd2lsbCBiZQo+PiBpbml0aWF0ZWQgd2hlbiB0aGUgdGltZXIgZXhwaXJl
cyBhZ2Fpbi4KPj4gCj4+IFRoZSBwcmV0aW1lb3V0IG5vdGlmaWNhdGlvbiBzaGFsbCBvY2N1ciBh
dCB0aW1lb3V0LXNlYy8yLgo+PiAKPj4gVjI6Cj4+IC0gcGFuaWMoKSBieSBkZWZhdWx0IGlmIFdB
VENIRE9HX1BSRVRJTUVPVVRfR09WIGlzIG5vdCBlbmFibGVkLgo+PiAKPj4gVjM6Cj4+IC0gTW9k
aWZ5IHRoZSBwcmV0aW1lb3V0IGJlaGF2aW9yLCBtYW51YWxseSByZXNldCBhZnRlciB0aGUgcHJl
dGltZW91dAo+PiAtIGlzIHByb2Nlc3NlZCBhbmQgd2FpdCB1bnRpbCB0aW1lb3V0Lgo+PiAKPj4g
VjQ6Cj4+IC0gUmVtb3ZlIHByZXRpbWVvdXQgcmVsYXRlZCBwcm9jZXNzaW5nLiAKPj4gLSBBZGQg
ZHVhbCBtb2RlIGNvbnRyb2wgc2VwYXJhdGVseS4KPj4gCj4+IFY1Ogo+PiAtIEZpeCBzb21lIGZv
cm1hdHRpbmcgYW5kIHByaW50aW5nIHByb2JsZW1zLgo+PiAKPj4gVjY6Cj4+IC0gUmVhbGl6ZSBw
cmV0aW1lb3V0IHByb2Nlc3NpbmcgdGhyb3VnaCBkdWFsbW9kZS4KPj4gCj4+IFY3Ogo+PiAtIEFk
ZCBzZXRfcHJldGltZW91dCgpLgo+PiAKPj4gVjgvVjk6Cj4+IC0gRml4IHNvbWUgZm9ybWF0dGlu
ZyBwcm9ibGVtcy4KPj4gCj4+IFNpZ25lZC1vZmYtYnk6IFdhbmcgUWluZyA8d2FuZ3FpbmdAdml2
by5jb20+Cj4KPlJldmlld2VkLWJ5OiBHdWVudGVyIFJvZWNrIDxsaW51eEByb2Vjay11cy5uZXQ+
Cj4KPk5vdGUgdGhhdCB0aGUgdmVyc2lvbiBoaXN0b3J5IHNob3VsZCBiZSBhZnRlciAiLS0tIi4K
Pgo+R3VlbnRlcgo+CgpUaGFua3MsIEd1ZW50ZXIuCkFuZCB3aGF0IGRvIEkgbmVlZCB0byBkbyBp
ZiBJIHdhbnQgbWVyZ2UgaW50byB0aGUgbmV4dC10cmVlPwoKUWluZwoNCg0K
