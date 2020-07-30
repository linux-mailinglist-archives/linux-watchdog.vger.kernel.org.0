Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07969233038
	for <lists+linux-watchdog@lfdr.de>; Thu, 30 Jul 2020 12:22:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726814AbgG3KWb (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 30 Jul 2020 06:22:31 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:65477 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728897AbgG3KW1 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 30 Jul 2020 06:22:27 -0400
X-UUID: 50062b7bbd184cfe929dc849e34609b4-20200730
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=QDlQ0gnoVvfRjOVlPrmnQKeNq40xRyUCNuWe8BeV8Zo=;
        b=ry4XVuktaP/TGM/JbxU58QN150UIVkmG4RrcRpc9sdrqmGWT4UKJ955kXJCIfbZ24LW5bjXpDylDPYHLeEd6/Aucb6PdJEvENOgV1qWpAowegEMcayBVx2tkaYXNiyCDa0T6gTGHghNOEd+2IksRMXGaVPhjfBTkeIKu/M71sng=;
X-UUID: 50062b7bbd184cfe929dc849e34609b4-20200730
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw02.mediatek.com
        (envelope-from <crystal.guo@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1593641337; Thu, 30 Jul 2020 18:22:23 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 30 Jul 2020 18:22:19 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 30 Jul 2020 18:22:18 +0800
From:   Crystal Guo <crystal.guo@mediatek.com>
To:     <linux@roeck-us.net>, <robh+dt@kernel.org>,
        <matthias.bgg@gmail.com>
CC:     <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
        <seiya.wang@mediatek.com>, Crystal Guo <crystal.guo@mediatek.com>
Subject: [v3,3/5] dt-binding: mediatek: mt8192: update mtk-wdt document
Date:   Thu, 30 Jul 2020 18:21:48 +0800
Message-ID: <1596104510-11113-4-git-send-email-crystal.guo@mediatek.com>
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

dXBkYXRlIG10ay13ZHQgZG9jdW1lbnQgZm9yIE1UODE5MiBwbGF0Zm9ybQ0KDQpTaWduZWQtb2Zm
LWJ5OiBDcnlzdGFsIEd1byA8Y3J5c3RhbC5ndW9AbWVkaWF0ZWsuY29tPg0KLS0tDQogRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3dhdGNoZG9nL210ay13ZHQudHh0IHwgMSArDQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQoNCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvd2F0Y2hkb2cvbXRrLXdkdC50eHQgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvd2F0Y2hkb2cvbXRrLXdkdC50eHQNCmluZGV4IDQ1ZWVk
YzIuLmUzNmJhNjAgMTAwNjQ0DQotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3Mvd2F0Y2hkb2cvbXRrLXdkdC50eHQNCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy93YXRjaGRvZy9tdGstd2R0LnR4dA0KQEAgLTEyLDYgKzEyLDcgQEAgUmVxdWlyZWQg
cHJvcGVydGllczoNCiAJIm1lZGlhdGVrLG10NzYyOS13ZHQiLCAibWVkaWF0ZWssbXQ2NTg5LXdk
dCI6IGZvciBNVDc2MjkNCiAJIm1lZGlhdGVrLG10ODE4My13ZHQiOiBmb3IgTVQ4MTgzDQogCSJt
ZWRpYXRlayxtdDg1MTYtd2R0IiwgIm1lZGlhdGVrLG10NjU4OS13ZHQiOiBmb3IgTVQ4NTE2DQor
CSJtZWRpYXRlayxtdDgxOTItd2R0IjogZm9yIE1UODE5Mg0KIA0KIC0gcmVnIDogU3BlY2lmaWVz
IGJhc2UgcGh5c2ljYWwgYWRkcmVzcyBhbmQgc2l6ZSBvZiB0aGUgcmVnaXN0ZXJzLg0KIA0KLS0g
DQoxLjguMS4xLmRpcnR5DQo=

