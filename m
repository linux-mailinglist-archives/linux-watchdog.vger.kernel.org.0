Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E526927BB73
	for <lists+linux-watchdog@lfdr.de>; Tue, 29 Sep 2020 05:22:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727217AbgI2DWv (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 28 Sep 2020 23:22:51 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:54507 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726944AbgI2DWv (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 28 Sep 2020 23:22:51 -0400
X-UUID: 297f1e5280614e3e8f2f0965afb039e9-20200929
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=V0XHyqq4D13l/tJUvNmzHj4e1uk9k7au8T5F6+FRuGc=;
        b=B8JCwCQTaqIP94ONHLOrY5Ww+qP77xd76TTWdy8k0mC60EODGY6eHe0Fj1oRgo6qjkF88KA6no1gBacCnVwlo0gowTgKWTJXUrbRAN/js3Fda6YiaewpxgO+fd6kzbFmYfE7nK7HE0NiiRrHHdxgjAbyJHqPtvQO+7CKN82LMHk=;
X-UUID: 297f1e5280614e3e8f2f0965afb039e9-20200929
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw02.mediatek.com
        (envelope-from <crystal.guo@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 89498040; Tue, 29 Sep 2020 11:22:44 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 29 Sep 2020 11:22:44 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 29 Sep 2020 11:22:41 +0800
From:   Crystal Guo <crystal.guo@mediatek.com>
To:     <linux@roeck-us.net>, <robh+dt@kernel.org>,
        <matthias.bgg@gmail.com>
CC:     <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
        <seiya.wang@mediatek.com>, Crystal Guo <crystal.guo@mediatek.com>
Subject: [v5,2/4] dt-binding: mediatek: mt8192: update mtk-wdt document
Date:   Tue, 29 Sep 2020 11:20:03 +0800
Message-ID: <20200929032005.15169-3-crystal.guo@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200929032005.15169-1-crystal.guo@mediatek.com>
References: <20200929032005.15169-1-crystal.guo@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

dXBkYXRlIG10ay13ZHQgZG9jdW1lbnQgZm9yIE1UODE5MiBwbGF0Zm9ybQ0KDQpTaWduZWQtb2Zm
LWJ5OiBDcnlzdGFsIEd1byA8Y3J5c3RhbC5ndW9AbWVkaWF0ZWsuY29tPg0KUmV2aWV3ZWQtYnk6
IE1hdHRoaWFzIEJydWdnZXIgPG1hdHRoaWFzLmJnZ0BnbWFpbC5jb20+DQpSZXZpZXdlZC1ieTog
R3VlbnRlciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0Pg0KLS0tDQogRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3dhdGNoZG9nL210ay13ZHQudHh0IHwgMSArDQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspDQoNCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3Mvd2F0Y2hkb2cvbXRrLXdkdC50eHQgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3Mvd2F0Y2hkb2cvbXRrLXdkdC50eHQNCmluZGV4IDQ1ZWVkYzJjMzE0MS4u
ZTM2YmE2MGRlODI5IDEwMDY0NA0KLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3dhdGNoZG9nL210ay13ZHQudHh0DQorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3Mvd2F0Y2hkb2cvbXRrLXdkdC50eHQNCkBAIC0xMiw2ICsxMiw3IEBAIFJlcXVpcmVk
IHByb3BlcnRpZXM6DQogCSJtZWRpYXRlayxtdDc2Mjktd2R0IiwgIm1lZGlhdGVrLG10NjU4OS13
ZHQiOiBmb3IgTVQ3NjI5DQogCSJtZWRpYXRlayxtdDgxODMtd2R0IjogZm9yIE1UODE4Mw0KIAki
bWVkaWF0ZWssbXQ4NTE2LXdkdCIsICJtZWRpYXRlayxtdDY1ODktd2R0IjogZm9yIE1UODUxNg0K
KwkibWVkaWF0ZWssbXQ4MTkyLXdkdCI6IGZvciBNVDgxOTINCiANCiAtIHJlZyA6IFNwZWNpZmll
cyBiYXNlIHBoeXNpY2FsIGFkZHJlc3MgYW5kIHNpemUgb2YgdGhlIHJlZ2lzdGVycy4NCiANCi0t
IA0KMi4xOC4wDQo=

