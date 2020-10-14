Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C6E928E124
	for <lists+linux-watchdog@lfdr.de>; Wed, 14 Oct 2020 15:20:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731180AbgJNNTs (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 14 Oct 2020 09:19:48 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:53234 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728823AbgJNNTr (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 14 Oct 2020 09:19:47 -0400
X-UUID: 0154a878d9b14e00899e794e02fcf838-20201014
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=UUXMeFr2hHlJSZLi34HcTDGs0TPXgBJAsi0hvj0UIoM=;
        b=Mai4hb19Mo/gQgfTgYRdaX4mwRcuYFRVVzyoL0sNCokDxYp5igdRYAgIkwBeSqn8wG650v9epvmidUk/rJ+ov+ecJNcA0ViEIWGba16NitAyN0gsVD7CSsZWkYCXjeP+F2WGLCCV0JY6t/uSRJ2Fr9cXwUi+SlEVMLgHKs5GoTU=;
X-UUID: 0154a878d9b14e00899e794e02fcf838-20201014
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
        (envelope-from <crystal.guo@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1068368378; Wed, 14 Oct 2020 21:19:41 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Oct 2020 21:19:38 +0800
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
Subject: [v6,1/4] dt-binding: mediatek: watchdog: fix the description of compatible
Date:   Wed, 14 Oct 2020 21:19:33 +0800
Message-ID: <20201014131936.20584-2-crystal.guo@mediatek.com>
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

