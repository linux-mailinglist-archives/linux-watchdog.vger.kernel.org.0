Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B586436D062
	for <lists+linux-watchdog@lfdr.de>; Wed, 28 Apr 2021 03:52:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238777AbhD1Bwp (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 27 Apr 2021 21:52:45 -0400
Received: from m176149.mail.qiye.163.com ([59.111.176.149]:40703 "EHLO
        m176149.mail.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229888AbhD1Bwp (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 27 Apr 2021 21:52:45 -0400
Received: from vivo.com (wm-9.qy.internal [127.0.0.1])
        by m176149.mail.qiye.163.com (Hmail) with ESMTP id E1F5F282E56;
        Wed, 28 Apr 2021 09:51:58 +0800 (CST)
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Message-ID: <ADUA9AALDva0XEeX2p71l4rW.3.1619574718914.Hmail.wangqing@vivo.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: =?UTF-8?B?UmU6W1BBVENIIFY5IDAvMl0gd2F0Y2hkb2c6IG10azogc3VwcG9ydCBwcmUtdGltZW91dCB3aGVuIHRoZSBiYXJrIGlycSBpcyBhdmFpbGFibGU=?=
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2016-163.com
X-Originating-IP: 36.152.145.182
In-Reply-To: <1619315527-8171-1-git-send-email-wangqing@vivo.com>
MIME-Version: 1.0
Received: from wangqing@vivo.com( [36.152.145.182) ] by ajax-webmail ( [127.0.0.1] ) ; Wed, 28 Apr 2021 09:51:58 +0800 (GMT+08:00)
From:   =?UTF-8?B?546L5pOO?= <wangqing@vivo.com>
Date:   Wed, 28 Apr 2021 09:51:58 +0800 (GMT+08:00)
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
        oVCBIfWUFZQxgeQlZJTE8eSUkeTB5KSx1VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
        hKTFVLWQY+
X-HM-Sender-Digest: e1kJHlYWEh9ZQU1ISktDS0pKTkxLN1dZDB4ZWUEPCQ4eV1kSHx4VD1lB
        WUc6Py46Qjo6Nz8NGksjPh4jSQtMShdPCSxVSFVKTUpCTkxPTEpCSU9OVTMWGhIXVQwaFRwKEhUc
        Ow0SDRRVGBQWRVlXWRILWUFZSE1VSk5JVUpPTlVKQ0lZV1kIAVlBSEtOTDcG
X-HM-Tid: 0a79162d01d39395kuwse1f5f282e56
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Cj5Vc2UgdGhlIGJhcmsgaW50ZXJydXB0IGFzIHRoZSBwcmV0aW1lb3V0IG5vdGlmaWVyIGlmIGF2
YWlsYWJsZS4KPlRoZSBwcmV0aW1lb3V0IG5vdGlmaWNhdGlvbiBzaGFsbCBvY2N1ciBhdCB0aW1l
b3V0LXNlYy8yLgo+Cj5XYW5nIFFpbmcgKDIpOgo+ICB3YXRjaGRvZzogbXRrOiBzdXBwb3J0IHBy
ZS10aW1lb3V0IHdoZW4gdGhlIGJhcmsgaXJxIGlzIGF2YWlsYWJsZQo+ICBkb2M6IG10ay13ZHQ6
IHN1cHBvcnQgcHJlLXRpbWVvdXQgd2hlbiB0aGUgYmFyayBpcnEgaXMgYXZhaWxhYmxlCj4KPiAu
Li4vZGV2aWNldHJlZS9iaW5kaW5ncy93YXRjaGRvZy9tdGstd2R0LnR4dCAgICAgICB8ICA1ICsr
Cj4gZHJpdmVycy93YXRjaGRvZy9tdGtfd2R0LmMgICAgICAgICAgICAgICAgICAgICAgICAgfCA3
NyArKysrKysrKysrKysrKysrKysrKy0tCj4gMiBmaWxlcyBjaGFuZ2VkLCA3NyBpbnNlcnRpb25z
KCspLCA1IGRlbGV0aW9ucygtKQo+Cj4tLSAKPjIuNy40Cj4KCkhpIEd1ZW50ZXI6ClBsZWFzZSBo
ZWxwIHJldmlldyB0aGlzIHZlcnNpb24sIGlmIHRoZXJlIGlzIG5vIHByb2JsZW0sIApjYW4geW91
IHBpY2sgdXAgdG8gdGhlIG5leHQgYnJhbmNoPwoKVGhhbmtzLApRaW5nDQoNCg==
