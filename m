Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20A9F233036
	for <lists+linux-watchdog@lfdr.de>; Thu, 30 Jul 2020 12:22:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729077AbgG3KWZ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 30 Jul 2020 06:22:25 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:47266 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728897AbgG3KWY (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 30 Jul 2020 06:22:24 -0400
X-UUID: 30ef0792b6324cfe84793aa17270bdd4-20200730
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=43JS2ywwVdDeLI1qVoCoqy50NzYC0F+9yWEVszhkYxw=;
        b=FXrzGDF8/QNQOMseFgIUMCTP2M4EO3AIiTA3/0fKZ9MRb3l9JDY3v0ndBt2vVMdSBS73/VD6cYlE12cZFRHt7DWKqT1cHMixXhWKyHZVBBD64WFdIJRQEoaQeJ86up2mhhbcjWcnPU6MuV0BTX3KOU7r3RNNk8HmLIiWwDFyN2w=;
X-UUID: 30ef0792b6324cfe84793aa17270bdd4-20200730
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
        (envelope-from <crystal.guo@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1926846719; Thu, 30 Jul 2020 18:22:21 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 30 Jul 2020 18:22:17 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 30 Jul 2020 18:22:17 +0800
From:   Crystal Guo <crystal.guo@mediatek.com>
To:     <linux@roeck-us.net>, <robh+dt@kernel.org>,
        <matthias.bgg@gmail.com>
CC:     <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
        <seiya.wang@mediatek.com>, Crystal Guo <crystal.guo@mediatek.com>
Subject: [v3,1/5] dt-binding: mediatek: watchdog: fix the description of compatible
Date:   Thu, 30 Jul 2020 18:21:46 +0800
Message-ID: <1596104510-11113-2-git-send-email-crystal.guo@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1596104510-11113-1-git-send-email-crystal.guo@mediatek.com>
References: <1596104510-11113-1-git-send-email-crystal.guo@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

QmVzaWRlcyB3YXRjaGRvZywgbXQyNzEyIGFuZCBudDgxODMgYWxzbyBwcm92aWRlIHN1Yi1zeXN0
ZW0gc29mdHdhcmUNCnJlc2V0IGZlYXR1cmVzLiBCdXQgbXQ2NTg5IG5vdCBzdXBwb3J0IHRoaXMg
ZmVhdHVyZQ0KDQpTaWduZWQtb2ZmLWJ5OiBDcnlzdGFsIEd1byA8Y3J5c3RhbC5ndW9AbWVkaWF0
ZWsuY29tPg0KLS0tDQogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3dhdGNoZG9n
L210ay13ZHQudHh0IHwgNCArKy0tDQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy93YXRjaGRvZy9tdGstd2R0LnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy93YXRjaGRvZy9tdGstd2R0LnR4dA0KaW5kZXggNGRkMzZiZC4uNDVlZWRjMiAxMDA2
NDQNCi0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy93YXRjaGRvZy9tdGst
d2R0LnR4dA0KKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3dhdGNoZG9n
L210ay13ZHQudHh0DQpAQCAtNCwxMyArNCwxMyBAQCBSZXF1aXJlZCBwcm9wZXJ0aWVzOg0KIA0K
IC0gY29tcGF0aWJsZSBzaG91bGQgY29udGFpbjoNCiAJIm1lZGlhdGVrLG10MjcwMS13ZHQiLCAi
bWVkaWF0ZWssbXQ2NTg5LXdkdCI6IGZvciBNVDI3MDENCi0JIm1lZGlhdGVrLG10MjcxMi13ZHQi
LCAibWVkaWF0ZWssbXQ2NTg5LXdkdCI6IGZvciBNVDI3MTINCisJIm1lZGlhdGVrLG10MjcxMi13
ZHQiOiBmb3IgTVQyNzEyDQogCSJtZWRpYXRlayxtdDY1ODktd2R0IjogZm9yIE1UNjU4OQ0KIAki
bWVkaWF0ZWssbXQ2Nzk3LXdkdCIsICJtZWRpYXRlayxtdDY1ODktd2R0IjogZm9yIE1UNjc5Nw0K
IAkibWVkaWF0ZWssbXQ3NjIyLXdkdCIsICJtZWRpYXRlayxtdDY1ODktd2R0IjogZm9yIE1UNzYy
Mg0KIAkibWVkaWF0ZWssbXQ3NjIzLXdkdCIsICJtZWRpYXRlayxtdDY1ODktd2R0IjogZm9yIE1U
NzYyMw0KIAkibWVkaWF0ZWssbXQ3NjI5LXdkdCIsICJtZWRpYXRlayxtdDY1ODktd2R0IjogZm9y
IE1UNzYyOQ0KLQkibWVkaWF0ZWssbXQ4MTgzLXdkdCIsICJtZWRpYXRlayxtdDY1ODktd2R0Ijog
Zm9yIE1UODE4Mw0KKwkibWVkaWF0ZWssbXQ4MTgzLXdkdCI6IGZvciBNVDgxODMNCiAJIm1lZGlh
dGVrLG10ODUxNi13ZHQiLCAibWVkaWF0ZWssbXQ2NTg5LXdkdCI6IGZvciBNVDg1MTYNCiANCiAt
IHJlZyA6IFNwZWNpZmllcyBiYXNlIHBoeXNpY2FsIGFkZHJlc3MgYW5kIHNpemUgb2YgdGhlIHJl
Z2lzdGVycy4NCi0tIA0KMS44LjEuMS5kaXJ0eQ0K

