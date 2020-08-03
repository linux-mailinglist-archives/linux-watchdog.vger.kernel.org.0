Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9EE223A021
	for <lists+linux-watchdog@lfdr.de>; Mon,  3 Aug 2020 09:16:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725861AbgHCHPv (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 3 Aug 2020 03:15:51 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:38599 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725831AbgHCHPv (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 3 Aug 2020 03:15:51 -0400
X-UUID: f4ffb50abf1b4c5c8a1058b85745fd28-20200803
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=UzIoA2ysnfBcZNVziS897PQDQ/2KuLvwQgA3q2i0GJY=;
        b=GfoefXQ3SdLHjV0aruE7AATe9oECvc+NTpJ+GgQhUTR4l9mGA987PoWZm/anPc+6czag73n/DckCs5FVaDtfZUIM8W7ng/JKUv5GIpVhXFd+DmesLgBpNyWElzx2UHthOLAjMVTMm2lTPNCDhcg8rFw6iPzbDAHhm3JA5A/NXPg=;
X-UUID: f4ffb50abf1b4c5c8a1058b85745fd28-20200803
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <crystal.guo@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 756827328; Mon, 03 Aug 2020 15:15:48 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 3 Aug 2020 15:15:45 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 3 Aug 2020 15:15:44 +0800
From:   Crystal Guo <crystal.guo@mediatek.com>
To:     <linux@roeck-us.net>, <robh+dt@kernel.org>,
        <matthias.bgg@gmail.com>
CC:     <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
        <seiya.wang@mediatek.com>, Crystal Guo <crystal.guo@mediatek.com>
Subject: [v4,1/5] dt-binding: mediatek: watchdog: fix the description of compatible
Date:   Mon, 3 Aug 2020 15:14:57 +0800
Message-ID: <20200803071501.30634-2-crystal.guo@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200803071501.30634-1-crystal.guo@mediatek.com>
References: <20200803071501.30634-1-crystal.guo@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

VGhlIHdhdGNoZG9nIGRyaXZlciBmb3IgTVQyNzEyIGFuZCBNVDgxODMgcmVsaWVzIG9uIERUIGRh
dGEsIHNvDQp0aGUgZmFsbGJhY2sgY29tcGF0aWJsZSBNVDY1ODkgd29uJ3Qgd29yay4NCg0KU2ln
bmVkLW9mZi1ieTogQ3J5c3RhbCBHdW8gPGNyeXN0YWwuZ3VvQG1lZGlhdGVrLmNvbT4NClJldmll
d2VkLWJ5OiBNYXR0aGlhcyBCcnVnZ2VyIDxtYXR0aGlhcy5iZ2dAZ21haWwuY29tPg0KLS0tDQog
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3dhdGNoZG9nL210ay13ZHQudHh0IHwg
NCArKy0tDQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkN
Cg0KZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy93YXRjaGRv
Zy9tdGstd2R0LnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy93YXRjaGRv
Zy9tdGstd2R0LnR4dA0KaW5kZXggNGRkMzZiZDNmMWFkLi40NWVlZGMyYzMxNDEgMTAwNjQ0DQot
LS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvd2F0Y2hkb2cvbXRrLXdkdC50
eHQNCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy93YXRjaGRvZy9tdGst
d2R0LnR4dA0KQEAgLTQsMTMgKzQsMTMgQEAgUmVxdWlyZWQgcHJvcGVydGllczoNCiANCiAtIGNv
bXBhdGlibGUgc2hvdWxkIGNvbnRhaW46DQogCSJtZWRpYXRlayxtdDI3MDEtd2R0IiwgIm1lZGlh
dGVrLG10NjU4OS13ZHQiOiBmb3IgTVQyNzAxDQotCSJtZWRpYXRlayxtdDI3MTItd2R0IiwgIm1l
ZGlhdGVrLG10NjU4OS13ZHQiOiBmb3IgTVQyNzEyDQorCSJtZWRpYXRlayxtdDI3MTItd2R0Ijog
Zm9yIE1UMjcxMg0KIAkibWVkaWF0ZWssbXQ2NTg5LXdkdCI6IGZvciBNVDY1ODkNCiAJIm1lZGlh
dGVrLG10Njc5Ny13ZHQiLCAibWVkaWF0ZWssbXQ2NTg5LXdkdCI6IGZvciBNVDY3OTcNCiAJIm1l
ZGlhdGVrLG10NzYyMi13ZHQiLCAibWVkaWF0ZWssbXQ2NTg5LXdkdCI6IGZvciBNVDc2MjINCiAJ
Im1lZGlhdGVrLG10NzYyMy13ZHQiLCAibWVkaWF0ZWssbXQ2NTg5LXdkdCI6IGZvciBNVDc2MjMN
CiAJIm1lZGlhdGVrLG10NzYyOS13ZHQiLCAibWVkaWF0ZWssbXQ2NTg5LXdkdCI6IGZvciBNVDc2
MjkNCi0JIm1lZGlhdGVrLG10ODE4My13ZHQiLCAibWVkaWF0ZWssbXQ2NTg5LXdkdCI6IGZvciBN
VDgxODMNCisJIm1lZGlhdGVrLG10ODE4My13ZHQiOiBmb3IgTVQ4MTgzDQogCSJtZWRpYXRlayxt
dDg1MTYtd2R0IiwgIm1lZGlhdGVrLG10NjU4OS13ZHQiOiBmb3IgTVQ4NTE2DQogDQogLSByZWcg
OiBTcGVjaWZpZXMgYmFzZSBwaHlzaWNhbCBhZGRyZXNzIGFuZCBzaXplIG9mIHRoZSByZWdpc3Rl
cnMuDQotLSANCjIuMTguMA0K

