Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 213E622AB60
	for <lists+linux-watchdog@lfdr.de>; Thu, 23 Jul 2020 11:09:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728175AbgGWJIi (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 23 Jul 2020 05:08:38 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:54423 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726127AbgGWJIh (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 23 Jul 2020 05:08:37 -0400
X-UUID: 996cd9ff55234ef9a6b6ba5f2e0742cf-20200723
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=E28fbb5ne1MmlUXosoO8B39FMtBz2eDLvLgvsB/y8Gg=;
        b=hasDjezS+1moNcJDTn/jBBtVZgiYCJxlAZGCeQ4rJT8372DbcXUdIAaNe0IaMkv1SwN+gmgtQpkVLEPVwkA31/MljtlVMilGhx1JveTs9Z2KROoTumEIGKYksp/pQHz35qYYNVS9SGMRTrOkXCmFFfT1kyja8J4Jpo1+pj4r6ro=;
X-UUID: 996cd9ff55234ef9a6b6ba5f2e0742cf-20200723
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
        (envelope-from <seiya.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 291139438; Thu, 23 Jul 2020 17:08:34 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 17:08:32 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 23 Jul 2020 17:08:32 +0800
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
Subject: [PATCH 3/4] watchdog: mt8192: add wdt support
Date:   Thu, 23 Jul 2020 17:07:30 +0800
Message-ID: <20200723090731.4482-4-seiya.wang@mediatek.com>
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

RnJvbTogQ3J5c3RhbCBHdW8gPGNyeXN0YWwuZ3VvQG1lZGlhdGVrLmNvbT4NCg0KYWRkIGRyaXZl
ciBzZXR0aW5nIHRvIHN1cHBvcnQgbXQ4MTkyIHdkdA0KDQpTaWduZWQtb2ZmLWJ5OiBDcnlzdGFs
IEd1byA8Y3J5c3RhbC5ndW9AbWVkaWF0ZWsuY29tPg0KLS0tDQogZHJpdmVycy93YXRjaGRvZy9t
dGtfd2R0LmMgfCA1ICsrKysrDQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQ0KDQpk
aWZmIC0tZ2l0IGEvZHJpdmVycy93YXRjaGRvZy9tdGtfd2R0LmMgYi9kcml2ZXJzL3dhdGNoZG9n
L210a193ZHQuYw0KaW5kZXggZDZhNjM5M2Y2MDlkLi5hZDIzNTk2MTcwYWYgMTAwNjQ0DQotLS0g
YS9kcml2ZXJzL3dhdGNoZG9nL210a193ZHQuYw0KKysrIGIvZHJpdmVycy93YXRjaGRvZy9tdGtf
d2R0LmMNCkBAIC03Niw2ICs3NiwxMCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG10a193ZHRfZGF0
YSBtdDgxODNfZGF0YSA9IHsNCiAJLnRvcHJndV9zd19yc3RfbnVtID0gTVQ4MTgzX1RPUFJHVV9T
V19SU1RfTlVNLA0KIH07DQogDQorc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfd2R0X2RhdGEgbXQ4
MTkyX2RhdGEgPSB7DQorCS50b3ByZ3Vfc3dfcnN0X251bSA9IDIzLA0KK307DQorDQogc3RhdGlj
IGludCB0b3ByZ3VfcmVzZXRfdXBkYXRlKHN0cnVjdCByZXNldF9jb250cm9sbGVyX2RldiAqcmNk
ZXYsDQogCQkJICAgICAgIHVuc2lnbmVkIGxvbmcgaWQsIGJvb2wgYXNzZXJ0KQ0KIHsNCkBAIC0z
MjIsNiArMzI2LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgbXRrX3dkdF9k
dF9pZHNbXSA9IHsNCiAJeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDI3MTItd2R0IiwgLmRh
dGEgPSAmbXQyNzEyX2RhdGEgfSwNCiAJeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDY1ODkt
d2R0IiB9LA0KIAl7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE4My13ZHQiLCAuZGF0YSA9
ICZtdDgxODNfZGF0YSB9LA0KKwl7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE5Mi13ZHQi
LCAuZGF0YSA9ICZtdDgxOTJfZGF0YSB9LA0KIAl7IC8qIHNlbnRpbmVsICovIH0NCiB9Ow0KIE1P
RFVMRV9ERVZJQ0VfVEFCTEUob2YsIG10a193ZHRfZHRfaWRzKTsNCi0tIA0KMi4xNC4xDQo=

