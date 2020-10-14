Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 493E528E11E
	for <lists+linux-watchdog@lfdr.de>; Wed, 14 Oct 2020 15:19:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728844AbgJNNTs (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 14 Oct 2020 09:19:48 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:53256 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727721AbgJNNTq (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 14 Oct 2020 09:19:46 -0400
X-UUID: f39527c9ff35424a91fa20feeb0c18f8-20201014
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=VKbmk+q6TZp792M8YotOsz2Eix0rdiCGpnXktYfljzs=;
        b=KrFUI0fQZnYCJsT9rj2/FfJyHQk9IkMhm7ou2yfCkDe0MhvapxojZ0RgDvyIanOxFS9DVw4x/TZYiaq5drMYWNNOHzNgADWaG35JN/fCKOEQJ9CajopXaDkiKnMsKDxIRz5Yp2ty0pD6pEZvu5ckqNHNX8EMOZt6FFLaJLVhm9I=;
X-UUID: f39527c9ff35424a91fa20feeb0c18f8-20201014
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <crystal.guo@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1533085728; Wed, 14 Oct 2020 21:19:41 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Oct 2020 21:19:38 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 14 Oct 2020 21:19:37 +0800
From:   Crystal Guo <crystal.guo@mediatek.com>
To:     <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
CC:     <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
        <seiya.wang@mediatek.com>
Subject: [v6,0/4] watchdog: mt8192: add wdt support
Date:   Wed, 14 Oct 2020 21:19:32 +0800
Message-ID: <20201014131936.20584-1-crystal.guo@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: AACF75C595E88535A25ED18B74F5FCCC1B0D61D4691CD1ADFFED2FA5B29200222000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

VGhpcyBwYXRjaGVzIGFpbSB0byBhZGQgd2F0Y2hkb2cgc3VwcG9ydCBmb3IgTVQ4MTkyLg0KDQpj
aGFuZ2UgaW4gdjY6DQoxLiBhZGQgY2hhbmdlIGxvZy4NCjIuIHJlbW92ZSBSZXZpZXdlZC1ieSB0
YWcgb25bdjUsMi80XQ0KDQoNCmNoYW5nZSBpbiB2NToNCmZpeCB0eXBvcyBvbiBtdDgxOTItcmVz
ZXQuaCAoaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMTY5NzQ5My8pDQoNCg0K
Y2hhbmdlIGluIHY0Og0KanVzdCByZXZpc2UgdjMgY29tbWl0IG1lc3NhZ2VzLg0KW3Y0LDEvNV0g
Zml4IHRoZSBkZXNjcmlwdGlvbiBvZiBjb21wYXRpYmxlIGlzIFJldmlld2VkLWJ5OiBNYXR0aGlh
cyBhbmQgR3VlbnRlci4NClt2NCwyLzVdIHVwZGF0ZSB3YXRjaGRvZyBkZXZpY2Ugbm9kZSBmb3Ig
bXQ4MTgzIGlzIEFja2VkLWJ5OiBHdWVudGVyLCBhbmQgd2lsbA0KYmUgYXBwbGllZCB0byB2NS45
LW5leHQvZHRzNjQuDQpbdjQsNC81XSBhZGQgdG9wcmd1IHJlc2V0LWNvbnRyb2xsZXIgaGVhZCBm
aWxlIGZvciBNVDgxOTIgcGxhdGZvcm0gaXMgUmV2aWV3ZWQtYnk6IE1hdHRoaWFzLA0KYW5kIEFj
a2VkLWJ5OiBHdWVudGVyLg0KW3Y0LDUvNV0gYWRkIHN1cHBvcnQgZm9yIHdhdGNoZG9nIGRldmlj
ZSBmb3VuZCBpbiBNVDgxOTIgU29DIGlzIFJldmlld2VkLWJ5OiBNYXR0aGlhcyBhbmQgR3VlbnRl
ci4NCg0KDQpjaGFuZ2UgaW4gdjM6DQoxLiBzZXBhcmF0ZSBbdjIsMS8zXSB0byBmaXggdGhlIG9y
aWdpbmFsIG10MjcxMiBhbmQgbXQ4MTgzIGNvbXBhdGlibGVzIGFuZCBhZGQgbmV3IGJvYXJkIGFz
Og0KW3YzLDEvNV0gZml4IG10MjcxMiBhbmQgbXQ4MTgzIGRlc2NyaXB0aW9uIG9mIGNvbXBhdGli
bGUsIHNpbmNlIG10MjcxMg0KYW5kIG10ODE4MyBhbHNvIHByb3ZpZGUgc3ViLXN5c3RlbSBzb2Z0
d2FyZSByZXNldCBmZWF0dXJlcywgYnV0IG10NjU4OSBub3QNCnN1cHBvcnQgdGhpcyBmZWF0dXJl
LiAoUmV2aWV3ZWQtYnk6IE1hdHRoaWFzKQ0KW3YzLDIvNV0gdXBkYXRlIHdhdGNoZG9nIGRldmlj
ZSBub2RlIGZvciBtdDgxODMNClt2MywzLzVdIHVwZGF0ZSBtdGstd2R0IGRvY3VtZW50IGZvciBN
VDgxOTIgcGxhdGZvcm0NCjIuIFt2MywgNC81XSBpcyBzYW1lIGFzIFt2MiwyLzNdIChSZXZpZXdl
ZC1ieTogTWF0dGhpYXMpDQozLiBtb2RpZnkgdGhlIGNvbW1pdCBtZXNzYWdlIG9mIFt2MiwzLzNd
DQpbdjMsNS81XSBhZGQgc3VwcG9ydCBmb3Igd2F0Y2hkb2cgZGV2aWNlIGZvdW5kIGluIE1UODE5
MiBTb0MoUmV2aWV3ZWQtYnk6IE1hdHRoaWFzIGFuZCBHdWVudGVyKQ0KDQoNCnYyIGNoYW5nZXM6
DQpBYmFuZG9uIFYxIGNoYW5nZXMsYW5kIGFkZCB0aGUgZm9sbG93aW5nIGNoYW5nZXM6DQpbdjIs
MS8zXSB1cGRhdGUgbXRrLXdkdCBkb2N1bWVudCBmb3IgbXQyNzEyLCBtdDgxODMgYW5kIG10ODE5
Mi4NClt2MiwyLzNdIGFkZCB0b3ByZ3UgcmVzZXQtY29udHJvbGxlciBoZWFkIGZpbGUgZm9yIE1U
ODE5MiBwbGF0Zm9ybSAoUmV2aWV3ZWQtYnk6IE1hdHRoaWFzKQ0KW3YyLDMvM10gYWRkIHN1cHBv
cnQgZm9yIHdhdGNoZG9nIGRldmljZSBmb3VuZCBpbiBNVDgxOTIgU29DKCBSZXZpZXdlZC1ieTog
TWF0dGhpYXMpDQoNCg0KdjEgY2hhbmdlczoNCkluc3RlYWQgb2Ygc3VibWl0IHRoZSBtdDgxOTIt
cmVzZXQuaCwgZ2V0IHRoZSBudW1iZXIgb2YNCnJlc2V0IGJpdHMgZnJvbSBkdHNpIGRpcmVjdGx5
Lg0KDQpDcnlzdGFsIEd1byAoNCk6DQogIGR0LWJpbmRpbmc6IG1lZGlhdGVrOiB3YXRjaGRvZzog
Zml4IHRoZSBkZXNjcmlwdGlvbiBvZiBjb21wYXRpYmxlDQogIGR0LWJpbmRpbmc6IG1lZGlhdGVr
OiBtdDgxOTI6IHVwZGF0ZSBtdGstd2R0IGRvY3VtZW50DQogIGR0LWJpbmRpbmc6IG10ODE5Mjog
YWRkIHRvcHJndSByZXNldC1jb250cm9sbGVyIGhlYWQgZmlsZQ0KICB3YXRjaGRvZzogbXQ4MTky
OiBhZGQgd2R0IHN1cHBvcnQNCg0KIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3dhdGNoZG9nL210
ay13ZHQudHh0ICB8ICA1ICsrLS0NCiBkcml2ZXJzL3dhdGNoZG9nL210a193ZHQuYyAgICAgICAg
ICAgICAgICAgICAgfCAgNiArKysrDQogLi4uL3Jlc2V0LWNvbnRyb2xsZXIvbXQ4MTkyLXJlc2V0
cy5oICAgICAgICAgIHwgMzAgKysrKysrKysrKysrKysrKysrKw0KIDMgZmlsZXMgY2hhbmdlZCwg
MzkgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCiBjcmVhdGUgbW9kZSAxMDA2NDQgaW5j
bHVkZS9kdC1iaW5kaW5ncy9yZXNldC1jb250cm9sbGVyL210ODE5Mi1yZXNldHMuaA0KDQoNCg==

