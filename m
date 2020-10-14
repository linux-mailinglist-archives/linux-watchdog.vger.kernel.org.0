Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2114728E11C
	for <lists+linux-watchdog@lfdr.de>; Wed, 14 Oct 2020 15:19:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729536AbgJNNTp (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 14 Oct 2020 09:19:45 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:53234 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726810AbgJNNTp (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 14 Oct 2020 09:19:45 -0400
X-UUID: 0897a8009ae84ab2adfe51b8aa15057e-20201014
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=XOh+CwCYnhs9kvGtToUoQb1luTda6cidr+gGJX2AfNc=;
        b=Qx8r96ZxOjLt+yhdA67wqvpogE/2DYeyYfLIP6wIZD4weIgSJTjaSydJHKzwQxEH2onM3lEEddBWwXQhWKM1twwG6YYtcblfRnp9JuNQ18xdbfKbLJeBrS0yrnkLdhwQdxHcxE2ZqmJZfxzkKiyJ+15kBiUNOf3usCMxL0i74j8=;
X-UUID: 0897a8009ae84ab2adfe51b8aa15057e-20201014
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
        (envelope-from <crystal.guo@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1391071074; Wed, 14 Oct 2020 21:19:42 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Oct 2020 21:19:39 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 14 Oct 2020 21:19:38 +0800
From:   Crystal Guo <crystal.guo@mediatek.com>
To:     <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
CC:     <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
        <seiya.wang@mediatek.com>, Crystal Guo <crystal.guo@mediatek.com>
Subject: [v6,2/4] dt-binding: mediatek: mt8192: update mtk-wdt document
Date:   Wed, 14 Oct 2020 21:19:34 +0800
Message-ID: <20201014131936.20584-3-crystal.guo@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201014131936.20584-1-crystal.guo@mediatek.com>
References: <20201014131936.20584-1-crystal.guo@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

dXBkYXRlIG10ay13ZHQgZG9jdW1lbnQgZm9yIE1UODE5MiBwbGF0Zm9ybQ0KDQpTaWduZWQtb2Zm
LWJ5OiBDcnlzdGFsIEd1byA8Y3J5c3RhbC5ndW9AbWVkaWF0ZWsuY29tPg0KLS0tDQogRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3dhdGNoZG9nL210ay13ZHQudHh0IHwgMSArDQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQoNCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvd2F0Y2hkb2cvbXRrLXdkdC50eHQgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvd2F0Y2hkb2cvbXRrLXdkdC50eHQNCmluZGV4IDQ1ZWVk
YzJjMzE0MS4uZTM2YmE2MGRlODI5IDEwMDY0NA0KLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3dhdGNoZG9nL210ay13ZHQudHh0DQorKysgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3Mvd2F0Y2hkb2cvbXRrLXdkdC50eHQNCkBAIC0xMiw2ICsxMiw3IEBA
IFJlcXVpcmVkIHByb3BlcnRpZXM6DQogCSJtZWRpYXRlayxtdDc2Mjktd2R0IiwgIm1lZGlhdGVr
LG10NjU4OS13ZHQiOiBmb3IgTVQ3NjI5DQogCSJtZWRpYXRlayxtdDgxODMtd2R0IjogZm9yIE1U
ODE4Mw0KIAkibWVkaWF0ZWssbXQ4NTE2LXdkdCIsICJtZWRpYXRlayxtdDY1ODktd2R0IjogZm9y
IE1UODUxNg0KKwkibWVkaWF0ZWssbXQ4MTkyLXdkdCI6IGZvciBNVDgxOTINCiANCiAtIHJlZyA6
IFNwZWNpZmllcyBiYXNlIHBoeXNpY2FsIGFkZHJlc3MgYW5kIHNpemUgb2YgdGhlIHJlZ2lzdGVy
cy4NCiANCi0tIA0KMi4xOC4wDQo=

