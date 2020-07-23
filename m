Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7856B22AB65
	for <lists+linux-watchdog@lfdr.de>; Thu, 23 Jul 2020 11:09:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728001AbgGWJIo (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 23 Jul 2020 05:08:44 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:19453 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726127AbgGWJIn (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 23 Jul 2020 05:08:43 -0400
X-UUID: a394200657ba4bb49d41679fa2ec77aa-20200723
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=LkLD6rKD+tyfSOxJ/tFfCgfVHNHDHHwbNbevew2fYZ4=;
        b=tBh0SDxEkPPTeQ8bV8EjBxN5n90HlyJbdD7ZbLv5syW+VDbcyoOtwWcvqh81YHLZ3gVivyEM1qE1trsYssbaB/uMOTPIX+y5mKBQ54kCYOlkSpBXl9e4NZvbDYGN8n2dzDs5V2bUtR6+QvoDkcs4JOVvmSagTjS0S6C+n/o/hSU=;
X-UUID: a394200657ba4bb49d41679fa2ec77aa-20200723
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
        (envelope-from <seiya.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 125551253; Thu, 23 Jul 2020 17:08:39 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 17:08:36 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 23 Jul 2020 17:08:37 +0800
From:   Seiya Wang <seiya.wang@mediatek.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
CC:     <linux-serial@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
        <srv_heupstream@mediatek.com>,
        Crystal Guo <crystal.guo@mediatek.com>
Subject: [PATCH 4/4] dt-binding: mediatek: mt8192: update mtk-wdt document
Date:   Thu, 23 Jul 2020 17:07:31 +0800
Message-ID: <20200723090731.4482-5-seiya.wang@mediatek.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20200723090731.4482-1-seiya.wang@mediatek.com>
References: <20200723090731.4482-1-seiya.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

RnJvbTogQ3J5c3RhbCBHdW8gPGNyeXN0YWwuZ3VvQG1lZGlhdGVrLmNvbT4NCg0KdXBkYXRlIG10
ay13ZHQgZG9jdW1lbnQgZm9yIE1UODE5MiBwbGF0Zm9ybQ0KDQpTaWduZWQtb2ZmLWJ5OiBDcnlz
dGFsIEd1byA8Y3J5c3RhbC5ndW9AbWVkaWF0ZWsuY29tPg0KLS0tDQogRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3dhdGNoZG9nL210ay13ZHQudHh0IHwgMiArKw0KIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCg0KZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy93YXRjaGRvZy9tdGstd2R0LnR4dCBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy93YXRjaGRvZy9tdGstd2R0LnR4dA0KaW5kZXggNGRkMzZiZDNmMWFk
Li5kNzYwY2E4YTYzMGUgMTAwNjQ0DQotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3Mvd2F0Y2hkb2cvbXRrLXdkdC50eHQNCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy93YXRjaGRvZy9tdGstd2R0LnR4dA0KQEAgLTEyLDYgKzEyLDggQEAgUmVxdWly
ZWQgcHJvcGVydGllczoNCiAJIm1lZGlhdGVrLG10NzYyOS13ZHQiLCAibWVkaWF0ZWssbXQ2NTg5
LXdkdCI6IGZvciBNVDc2MjkNCiAJIm1lZGlhdGVrLG10ODE4My13ZHQiLCAibWVkaWF0ZWssbXQ2
NTg5LXdkdCI6IGZvciBNVDgxODMNCiAJIm1lZGlhdGVrLG10ODUxNi13ZHQiLCAibWVkaWF0ZWss
bXQ2NTg5LXdkdCI6IGZvciBNVDg1MTYNCisJIm1lZGlhdGVrLG10ODE5Mi13ZHQiOiBmb3IgTVQ4
MTkyDQorDQogDQogLSByZWcgOiBTcGVjaWZpZXMgYmFzZSBwaHlzaWNhbCBhZGRyZXNzIGFuZCBz
aXplIG9mIHRoZSByZWdpc3RlcnMuDQogDQotLSANCjIuMTQuMQ0K

