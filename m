Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 075A127BB74
	for <lists+linux-watchdog@lfdr.de>; Tue, 29 Sep 2020 05:22:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727375AbgI2DWw (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 28 Sep 2020 23:22:52 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:54568 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726944AbgI2DWw (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 28 Sep 2020 23:22:52 -0400
X-UUID: 5873de4f9dde49769f835d3d1aeefb14-20200929
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=UUXMeFr2hHlJSZLi34HcTDGs0TPXgBJAsi0hvj0UIoM=;
        b=faeEEExfi/HkXMsHEV7WcCwAEEqxOgY2fn3LnRwlxPkG43SK1ZfofsSX3Yh18YZdy8op+CqGJnG4jGkv+HAwEK0Z5GxKwJ1sH1XiY5+an2BI6DT5xcnzlTWDUtzENbv2PdyHjAK04CdWNZoIPw04h3vbVhmmNmL4Fa73OP+ieds=;
X-UUID: 5873de4f9dde49769f835d3d1aeefb14-20200929
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
        (envelope-from <crystal.guo@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 957987250; Tue, 29 Sep 2020 11:22:49 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 29 Sep 2020 11:22:41 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 29 Sep 2020 11:22:40 +0800
From:   Crystal Guo <crystal.guo@mediatek.com>
To:     <linux@roeck-us.net>, <robh+dt@kernel.org>,
        <matthias.bgg@gmail.com>
CC:     <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
        <seiya.wang@mediatek.com>, Crystal Guo <crystal.guo@mediatek.com>
Subject: [v5,1/4] dt-binding: mediatek: watchdog: fix the description of compatible
Date:   Tue, 29 Sep 2020 11:20:02 +0800
Message-ID: <20200929032005.15169-2-crystal.guo@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200929032005.15169-1-crystal.guo@mediatek.com>
References: <20200929032005.15169-1-crystal.guo@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: AEDFD2495232231D73CA3DB330A350D1A49A6FA4DAF699D989BEA3844F8671392000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

VGhlIHdhdGNoZG9nIGRyaXZlciBmb3IgTVQyNzEyIGFuZCBNVDgxODMgcmVsaWVzIG9uIERUIGRh
dGEsIHNvDQp0aGUgZmFsbGJhY2sgY29tcGF0aWJsZSBNVDY1ODkgd29uJ3Qgd29yay4NCg0KU2ln
bmVkLW9mZi1ieTogQ3J5c3RhbCBHdW8gPGNyeXN0YWwuZ3VvQG1lZGlhdGVrLmNvbT4NClJldmll
d2VkLWJ5OiBNYXR0aGlhcyBCcnVnZ2VyIDxtYXR0aGlhcy5iZ2dAZ21haWwuY29tPg0KUmV2aWV3
ZWQtYnk6IEd1ZW50ZXIgUm9lY2sgPGxpbnV4QHJvZWNrLXVzLm5ldD4NCi0tLQ0KIERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy93YXRjaGRvZy9tdGstd2R0LnR4dCB8IDQgKystLQ0K
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQoNCmRpZmYg
LS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvd2F0Y2hkb2cvbXRrLXdk
dC50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvd2F0Y2hkb2cvbXRrLXdk
dC50eHQNCmluZGV4IDRkZDM2YmQzZjFhZC4uNDVlZWRjMmMzMTQxIDEwMDY0NA0KLS0tIGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3dhdGNoZG9nL210ay13ZHQudHh0DQorKysg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvd2F0Y2hkb2cvbXRrLXdkdC50eHQN
CkBAIC00LDEzICs0LDEzIEBAIFJlcXVpcmVkIHByb3BlcnRpZXM6DQogDQogLSBjb21wYXRpYmxl
IHNob3VsZCBjb250YWluOg0KIAkibWVkaWF0ZWssbXQyNzAxLXdkdCIsICJtZWRpYXRlayxtdDY1
ODktd2R0IjogZm9yIE1UMjcwMQ0KLQkibWVkaWF0ZWssbXQyNzEyLXdkdCIsICJtZWRpYXRlayxt
dDY1ODktd2R0IjogZm9yIE1UMjcxMg0KKwkibWVkaWF0ZWssbXQyNzEyLXdkdCI6IGZvciBNVDI3
MTINCiAJIm1lZGlhdGVrLG10NjU4OS13ZHQiOiBmb3IgTVQ2NTg5DQogCSJtZWRpYXRlayxtdDY3
OTctd2R0IiwgIm1lZGlhdGVrLG10NjU4OS13ZHQiOiBmb3IgTVQ2Nzk3DQogCSJtZWRpYXRlayxt
dDc2MjItd2R0IiwgIm1lZGlhdGVrLG10NjU4OS13ZHQiOiBmb3IgTVQ3NjIyDQogCSJtZWRpYXRl
ayxtdDc2MjMtd2R0IiwgIm1lZGlhdGVrLG10NjU4OS13ZHQiOiBmb3IgTVQ3NjIzDQogCSJtZWRp
YXRlayxtdDc2Mjktd2R0IiwgIm1lZGlhdGVrLG10NjU4OS13ZHQiOiBmb3IgTVQ3NjI5DQotCSJt
ZWRpYXRlayxtdDgxODMtd2R0IiwgIm1lZGlhdGVrLG10NjU4OS13ZHQiOiBmb3IgTVQ4MTgzDQor
CSJtZWRpYXRlayxtdDgxODMtd2R0IjogZm9yIE1UODE4Mw0KIAkibWVkaWF0ZWssbXQ4NTE2LXdk
dCIsICJtZWRpYXRlayxtdDY1ODktd2R0IjogZm9yIE1UODUxNg0KIA0KIC0gcmVnIDogU3BlY2lm
aWVzIGJhc2UgcGh5c2ljYWwgYWRkcmVzcyBhbmQgc2l6ZSBvZiB0aGUgcmVnaXN0ZXJzLg0KLS0g
DQoyLjE4LjANCg==

