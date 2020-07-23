Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41EDD22AB56
	for <lists+linux-watchdog@lfdr.de>; Thu, 23 Jul 2020 11:08:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726303AbgGWJIA (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 23 Jul 2020 05:08:00 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:62859 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725846AbgGWJIA (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 23 Jul 2020 05:08:00 -0400
X-UUID: 609ee1b2215c485ab6481c4575604080-20200723
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=fQAlYTu7jimnOiNSbIQbC1bv/gLKYWyftON61ys5CAk=;
        b=Lk9rxwToEFLLsTkehhDeBHCo0H0jZUGXf0jbhFpJldHRQI8qrBLvNBH0Xy5rpLVyACJxlHz+XahoaimFd//B/8+W42p7chWSbgoOf1nFlwtTNl6bujE1p4QVn5xxqNXMUXvKvLjqpsJL9E5WClRSquxSQKdCn3fHPI+gKjGhwVM=;
X-UUID: 609ee1b2215c485ab6481c4575604080-20200723
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
        (envelope-from <seiya.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1782811880; Thu, 23 Jul 2020 17:07:54 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 17:07:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 23 Jul 2020 17:07:46 +0800
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
        <srv_heupstream@mediatek.com>
Subject: [PATCH 0/4] Add basic node support for Mediatek MT8192 SoC 
Date:   Thu, 23 Jul 2020 17:07:27 +0800
Message-ID: <20200723090731.4482-1-seiya.wang@mediatek.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

DQpNVDgxOTIgaXMgYSBTb0MgYmFzZWQgb24gNjRiaXQgQVJNdjggYXJjaGl0ZWN0dXJlLg0KSXQg
Y29udGFpbnMgNCBDQTU1IGFuZCA0IENBNzYgY29yZXMuDQpNVDgxOTIgc2hhcmUgbWFueSBIVyBJ
UCB3aXRoIE1UNjV4eCBzZXJpZXMuDQpUaGlzIHBhdGNoc2V0IHdhcyB0ZXN0ZWQgb24gTVQ4MTky
IGV2YWx1YXRpb24gYm9hcmQgYW5kIHVzZSBjb3JyZWN0IGNsb2NrIHRvIHNoZQ0KbGwuDQoNCkJh
c2VkIG9uIHY1LjgtcmMxDQoNCkNyeXN0YWwgR3VvICgyKToNCiAgd2F0Y2hkb2c6IG10ODE5Mjog
YWRkIHdkdCBzdXBwb3J0DQogIGR0LWJpbmRpbmc6IG1lZGlhdGVrOiBtdDgxOTI6IHVwZGF0ZSBt
dGstd2R0IGRvY3VtZW50DQoNClNlaXlhIFdhbmcgKDIpOg0KICBhcm02NDogZHRzOiBBZGQgTWVk
aWF0ZWsgU29DIE1UODE5MiBhbmQgZXZhbHVhdGlvbiBib2FyZCBkdHMgYW5kDQogICAgTWFrZWZp
bGUNCiAgZHQtYmluZGluZ3M6IHNlcmlhbDogQWRkIGNvbXBhdGlibGUgZm9yIE1lZGlhdGVrIE1U
ODE5Mg0KLS0tDQpUaGlzIHBhdGNoIGRlcGVuZHMgb24NCltQQVRDSCAxLzNdIGR0LWJpbmRpbmdz
OiBwaW5jdHJsOiBtdDgxOTI6IGFkZCBwaW5jdHJsIGZpbGUNCltQQVRDSCAyLzNdIGR0LWJpbmRp
bmdzOiBwaW5jdHJsOiBtdDgxOTI6IGFkZCBiaW5kaW5nIGRvY3VtZW50DQpbUEFUQ0ggdjIgMy80
XSBkdC1iaW5kaW5nczogbWVkaWF0ZWs6IGFkZCBjb21wYXRpYmxlIGZvciBNVDY4NzMvODE5MiBw
d3JhcA0KW1BBVENIIHYyIDEvMl0gZHQtYmluZGluZ3M6IHNwaTogdXBkYXRlIGJpbmRpbmdzIGZv
ciBNVDgxOTIgU29DDQpbUEFUQ0ggMi80XSBjbGs6IG1lZGlhdGVrOiBBZGQgZHQtYmluZGluZ3Mg
Zm9yIE1UODE5MiBjbG9ja3MNCltQQVRDSCAxLzRdIGR0LWJpbmRpbmdzOiBBUk06IE1lZGlhdGVr
OiBEb2N1bWVudCBiaW5kaW5ncyBmb3IgTVQ4MTkyDQoNClBsZWFzZSBhbHNvIGFjY2VwdCB0aGlz
IHBhdGNoIHRvZ2V0aGVyIHdpdGggWzFdWzJdWzNdWzRdWzVdWzZdDQp0byBhdm9pZCBidWlsZCBh
bmQgZHQgYmluZGluZyBjaGVjayBlcnJvci4NCg0KWzFdIGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL3BpcGVybWFpbC9saW51eC1tZWRpYXRlay8yMDIwLUp1bHkvMDE0MDQyLmh0bWwNClsyXSBo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9waXBlcm1haWwvbGludXgtbWVkaWF0ZWsvMjAyMC1K
dWx5LzAxNDA0My5odG1sDQpbM10gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvcGlwZXJtYWls
L2xpbnV4LW1lZGlhdGVrLzIwMjAtSnVseS8wMTQ1NDYuaHRtbA0KWzRdIGh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL3BpcGVybWFpbC9saW51eC1tZWRpYXRlay8yMDIwLUp1bHkvMDE0NDA2Lmh0
bWwNCls1XSBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9waXBlcm1haWwvbGludXgtbWVkaWF0
ZWsvMjAyMC1KdWx5LzAxNDQ1MC5odG1sDQpbNl0gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
cGlwZXJtYWlsL2xpbnV4LW1lZGlhdGVrLzIwMjAtSnVseS8wMTQ0NTEuaHRtbA0KLS0tDQogLi4u
L2RldmljZXRyZWUvYmluZGluZ3Mvc2VyaWFsL210ay11YXJ0LnR4dCAgICAgICAgfCAgIDEgKw0K
IC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3dhdGNoZG9nL210ay13ZHQudHh0ICAgICAgIHwgICAy
ICsNCiBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL01ha2VmaWxlICAgICAgICAgICAgICB8
ICAgMSArDQogYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTItZXZiLmR0cyAgICAg
ICAgfCAgMjkgKw0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTkyLmR0c2kgICAg
ICAgICAgIHwgNjYzICsrKysrKysrKysrKysrKysrKysrKw0KIGRyaXZlcnMvd2F0Y2hkb2cvbXRr
X3dkdC5jICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA1ICsNCiA2IGZpbGVzIGNoYW5nZWQs
IDcwMSBpbnNlcnRpb25zKCspDQogY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtNjQvYm9vdC9k
dHMvbWVkaWF0ZWsvbXQ4MTkyLWV2Yi5kdHMNCiBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9hcm02
NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTIuZHRzaQ0KDQotLQ0KMi4xNC4xDQo=

