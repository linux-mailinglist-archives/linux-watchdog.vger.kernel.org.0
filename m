Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1561D231C6B
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Jul 2020 12:02:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726718AbgG2KCd (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 29 Jul 2020 06:02:33 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:32203 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726367AbgG2KCc (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 29 Jul 2020 06:02:32 -0400
X-UUID: fbde7f677bbc460f9226cfa1b4c7a8f4-20200729
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=nMlj/ciqiz0ftrSPz+slGtkt6GT8sQPqj5i3PVbtgeo=;
        b=AAJ3Zo+jebdZZt/xfj7OrJzwGE2R+kaB2YLbCoxTiJf8S/lTui23TKw/MucyXZfzWILWODH5xp3aJiJXGKsFuhLMuE22y6zM49qL42hNsTJVHtzB5gVHoU+uPiseIUNRZI5UlGHY36IOF0rdLzN906v4Daq7loFvJ4NWoQaQrqk=;
X-UUID: fbde7f677bbc460f9226cfa1b4c7a8f4-20200729
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
        (envelope-from <crystal.guo@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 929946019; Wed, 29 Jul 2020 18:02:29 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 29 Jul 2020 18:02:28 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 29 Jul 2020 18:02:27 +0800
From:   Crystal Guo <crystal.guo@mediatek.com>
To:     <linux@roeck-us.net>, <robh+dt@kernel.org>,
        <matthias.bgg@gmail.com>
CC:     <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
        <seiya.wang@mediatek.com>, <erin.lo@mediatek.com>,
        Crystal Guo <crystal.guo@mediatek.com>
Subject: [v2,1/3] dt-binding: mediatek: mt8192: update mtk-wdt document
Date:   Wed, 29 Jul 2020 18:02:00 +0800
Message-ID: <1596016922-13184-2-git-send-email-crystal.guo@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1596016922-13184-1-git-send-email-crystal.guo@mediatek.com>
References: <1596016922-13184-1-git-send-email-crystal.guo@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

dXBkYXRlIG10ay13ZHQgZG9jdW1lbnQgZm9yIE1UODE5MiBwbGF0Zm9ybQ0KDQpTaWduZWQtb2Zm
LWJ5OiBDcnlzdGFsIEd1byA8Y3J5c3RhbC5ndW9AbWVkaWF0ZWsuY29tPg0KLS0tDQogRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3dhdGNoZG9nL210ay13ZHQudHh0IHwgNSArKyst
LQ0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQoNCmRp
ZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvd2F0Y2hkb2cvbXRr
LXdkdC50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvd2F0Y2hkb2cvbXRr
LXdkdC50eHQNCmluZGV4IDRkZDM2YmQuLmUzNmJhNjAgMTAwNjQ0DQotLS0gYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvd2F0Y2hkb2cvbXRrLXdkdC50eHQNCisrKyBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy93YXRjaGRvZy9tdGstd2R0LnR4dA0KQEAgLTQs
MTQgKzQsMTUgQEAgUmVxdWlyZWQgcHJvcGVydGllczoNCiANCiAtIGNvbXBhdGlibGUgc2hvdWxk
IGNvbnRhaW46DQogCSJtZWRpYXRlayxtdDI3MDEtd2R0IiwgIm1lZGlhdGVrLG10NjU4OS13ZHQi
OiBmb3IgTVQyNzAxDQotCSJtZWRpYXRlayxtdDI3MTItd2R0IiwgIm1lZGlhdGVrLG10NjU4OS13
ZHQiOiBmb3IgTVQyNzEyDQorCSJtZWRpYXRlayxtdDI3MTItd2R0IjogZm9yIE1UMjcxMg0KIAki
bWVkaWF0ZWssbXQ2NTg5LXdkdCI6IGZvciBNVDY1ODkNCiAJIm1lZGlhdGVrLG10Njc5Ny13ZHQi
LCAibWVkaWF0ZWssbXQ2NTg5LXdkdCI6IGZvciBNVDY3OTcNCiAJIm1lZGlhdGVrLG10NzYyMi13
ZHQiLCAibWVkaWF0ZWssbXQ2NTg5LXdkdCI6IGZvciBNVDc2MjINCiAJIm1lZGlhdGVrLG10NzYy
My13ZHQiLCAibWVkaWF0ZWssbXQ2NTg5LXdkdCI6IGZvciBNVDc2MjMNCiAJIm1lZGlhdGVrLG10
NzYyOS13ZHQiLCAibWVkaWF0ZWssbXQ2NTg5LXdkdCI6IGZvciBNVDc2MjkNCi0JIm1lZGlhdGVr
LG10ODE4My13ZHQiLCAibWVkaWF0ZWssbXQ2NTg5LXdkdCI6IGZvciBNVDgxODMNCisJIm1lZGlh
dGVrLG10ODE4My13ZHQiOiBmb3IgTVQ4MTgzDQogCSJtZWRpYXRlayxtdDg1MTYtd2R0IiwgIm1l
ZGlhdGVrLG10NjU4OS13ZHQiOiBmb3IgTVQ4NTE2DQorCSJtZWRpYXRlayxtdDgxOTItd2R0Ijog
Zm9yIE1UODE5Mg0KIA0KIC0gcmVnIDogU3BlY2lmaWVzIGJhc2UgcGh5c2ljYWwgYWRkcmVzcyBh
bmQgc2l6ZSBvZiB0aGUgcmVnaXN0ZXJzLg0KIA0KLS0gDQoxLjguMS4xLmRpcnR5DQo=

