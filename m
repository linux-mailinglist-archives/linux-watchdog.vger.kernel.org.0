Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7B2A13BBB2
	for <lists+linux-watchdog@lfdr.de>; Wed, 15 Jan 2020 09:59:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729316AbgAOI6t (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 15 Jan 2020 03:58:49 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:49365 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729263AbgAOI6t (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 15 Jan 2020 03:58:49 -0500
X-UUID: cc6f242097ba4cc7be59d561ff9543f6-20200115
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=I69ahnkuv6CGMC6vN27rzSxh+MYCoqd9hH5ZoS8vk88=;
        b=H28O42VNXhRE9/A23YhuHV9ec2tqsYPOemnQG22DXsOA6txFka/FzDwg5oYeN1I5f49OjF6parGGHUGWPs/lwW8Hbg7hLArd8iwRONUPBsrWTPhUplcpJQgW86U1f1WC+lnAapAg37QuyHwFmkgWWj7Y4YTsoGN23RBiMGsbubA=;
X-UUID: cc6f242097ba4cc7be59d561ff9543f6-20200115
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
        (envelope-from <yong.liang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 833871855; Wed, 15 Jan 2020 16:58:41 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 15 Jan 2020 16:57:36 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 15 Jan 2020 16:58:46 +0800
From:   Yong Liang <yong.liang@mediatek.com>
To:     <yong.liang@mediatek.com>, <wim@linux-watchdog.org>,
        <linux@roeck-us.net>, <p.zabel@pengutronix.de>,
        <matthias.bgg@gmail.com>, <linux-watchdog@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <chang-an.chen@mediatek.com>, <freddy.hsin@mediatek.com>,
        <jiaxin.yu@mediatek.com>
CC:     <yingjoe.chen@mediatek.com>, <sboyd@kernel.org>
Subject: [PATCH v12 4/4] watchdog: mtk_wdt: mt2712: Add reset controller
Date:   Wed, 15 Jan 2020 16:58:28 +0800
Message-ID: <20200115085828.27791-5-yong.liang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200115085828.27791-1-yong.liang@mediatek.com>
References: <20200115085828.27791-1-yong.liang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

RnJvbTogInlvbmcubGlhbmciIDx5b25nLmxpYW5nQG1lZGlhdGVrLmNvbT4NCg0KQWRkIHJlc2V0
IGNvbnRyb2xsZXIgZm9yIDI3MTIuDQpCZXNpZGVzIHdhdGNoZG9nLCBNVEsgdG9wcmd1IG1vZHVs
ZSBhbHNhIHByb3ZpZGUgc3ViLXN5c3RlbSAoZWcsIGF1ZGlvLA0KY2FtZXJhLCBjb2RlYyBhbmQg
Y29ubmVjdGl2aXR5KSBzb2Z0d2FyZSByZXNldCBmdW5jdGlvbmFsaXR5Lg0KDQpTaWduZWQtb2Zm
LWJ5OiB5b25nLmxpYW5nIDx5b25nLmxpYW5nQG1lZGlhdGVrLmNvbT4NClNpZ25lZC1vZmYtYnk6
IEppYXhpbiBZdSA8amlheGluLnl1QG1lZGlhdGVrLmNvbT4NClJldmlld2VkLWJ5OiBZaW5nam9l
IENoZW4gPHlpbmdqb2UuY2hlbkBtZWRpYXRlay5jb20+DQpSZXZpZXdlZC1ieTogUGhpbGlwcCBa
YWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5kZT4NCi0tLQ0KIGRyaXZlcnMvd2F0Y2hkb2cvbXRr
X3dkdC5jIHwgNiArKysrKysNCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspDQoNCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL3dhdGNoZG9nL210a193ZHQuYyBiL2RyaXZlcnMvd2F0Y2hkb2cv
bXRrX3dkdC5jDQppbmRleCBlODhhYWNiMDQwNGQuLmQ2YTYzOTNmNjA5ZCAxMDA2NDQNCi0tLSBh
L2RyaXZlcnMvd2F0Y2hkb2cvbXRrX3dkdC5jDQorKysgYi9kcml2ZXJzL3dhdGNoZG9nL210a193
ZHQuYw0KQEAgLTksNiArOSw3IEBADQogICogQmFzZWQgb24gc3VueGlfd2R0LmMNCiAgKi8NCiAN
CisjaW5jbHVkZSA8ZHQtYmluZGluZ3MvcmVzZXQtY29udHJvbGxlci9tdDI3MTItcmVzZXRzLmg+
DQogI2luY2x1ZGUgPGR0LWJpbmRpbmdzL3Jlc2V0LWNvbnRyb2xsZXIvbXQ4MTgzLXJlc2V0cy5o
Pg0KICNpbmNsdWRlIDxsaW51eC9kZWxheS5oPg0KICNpbmNsdWRlIDxsaW51eC9lcnIuaD4NCkBA
IC02Nyw2ICs2OCwxMCBAQCBzdHJ1Y3QgbXRrX3dkdF9kYXRhIHsNCiAJaW50IHRvcHJndV9zd19y
c3RfbnVtOw0KIH07DQogDQorc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfd2R0X2RhdGEgbXQyNzEy
X2RhdGEgPSB7DQorCS50b3ByZ3Vfc3dfcnN0X251bSA9IE1UMjcxMl9UT1BSR1VfU1dfUlNUX05V
TSwNCit9Ow0KKw0KIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX3dkdF9kYXRhIG10ODE4M19kYXRh
ID0gew0KIAkudG9wcmd1X3N3X3JzdF9udW0gPSBNVDgxODNfVE9QUkdVX1NXX1JTVF9OVU0sDQog
fTsNCkBAIC0zMTQsNiArMzE5LDcgQEAgc3RhdGljIGludCBtdGtfd2R0X3Jlc3VtZShzdHJ1Y3Qg
ZGV2aWNlICpkZXYpDQogI2VuZGlmDQogDQogc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2Vf
aWQgbXRrX3dkdF9kdF9pZHNbXSA9IHsNCisJeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDI3
MTItd2R0IiwgLmRhdGEgPSAmbXQyNzEyX2RhdGEgfSwNCiAJeyAuY29tcGF0aWJsZSA9ICJtZWRp
YXRlayxtdDY1ODktd2R0IiB9LA0KIAl7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE4My13
ZHQiLCAuZGF0YSA9ICZtdDgxODNfZGF0YSB9LA0KIAl7IC8qIHNlbnRpbmVsICovIH0NCi0tIA0K
Mi4xOC4wDQo=

