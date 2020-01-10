Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B55821367D8
	for <lists+linux-watchdog@lfdr.de>; Fri, 10 Jan 2020 08:04:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727412AbgAJHEk (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 10 Jan 2020 02:04:40 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:53418 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726598AbgAJHEk (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 10 Jan 2020 02:04:40 -0500
X-UUID: 7c4966ef6ebd4e4bb66b3e1c999bb38a-20200110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=qWyPZmajFzIdhHdy5cLGELWLgjaEXWjuyCtLLW6rxa4=;
        b=itHAVCt2gfFerWNzUurt7DbuAfPEZCQFmSIigMdvlgfZt3c1Jwx0Zs5OPUJTC8gHgfwFeh1zc20GJUA/beRW1rdtqWn72Hgi4hJ8VSaQcOsQS/3yifiyYayzkJuEsEY8YtIdyolSiMvREe+RLBCTq1XHAucnwjcuPir/TTeKUmA=;
X-UUID: 7c4966ef6ebd4e4bb66b3e1c999bb38a-20200110
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <jiaxin.yu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1116906545; Fri, 10 Jan 2020 15:04:34 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 10 Jan 2020 15:04:04 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 10 Jan 2020 15:03:58 +0800
From:   Jiaxin Yu <jiaxin.yu@mediatek.com>
To:     <yong.liang@mediatek.com>, <wim@linux-watchdog.org>,
        <linux@roeck-us.net>, <p.zabel@pengutronix.de>,
        <matthias.bgg@gmail.com>, <linux-watchdog@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <chang-an.chen@mediatek.com>, <freddy.hsin@mediatek.com>
CC:     <yingjoe.chen@mediatek.com>, <sboyd@kernel.org>,
        Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: [PATCH v11 3/3] watchdog: mtk_wdt: mt2712: Add reset controller
Date:   Fri, 10 Jan 2020 15:04:22 +0800
Message-ID: <1578639862-14480-4-git-send-email-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1578639862-14480-1-git-send-email-jiaxin.yu@mediatek.com>
References: <1578639862-14480-1-git-send-email-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

QWRkIHJlc2V0IGNvbnRyb2xsZXIgZm9yIDI3MTIuDQpCZXNpZGVzIHdhdGNoZG9nLCBNVEsgdG9w
cmd1IG1vZHVsZSBhbHNhIHByb3ZpZGUgc3ViLXN5c3RlbSAoZWcsIGF1ZGlvLA0KY2FtZXJhLCBj
b2RlYyBhbmQgY29ubmVjdGl2aXR5KSBzb2Z0d2FyZSByZXNldCBmdW5jdGlvbmFsaXR5Lg0KDQpT
aWduZWQtb2ZmLWJ5OiB5b25nLmxpYW5nIDx5b25nLmxpYW5nQG1lZGlhdGVrLmNvbT4NClNpZ25l
ZC1vZmYtYnk6IEppYXhpbiBZdSA8amlheGluLnl1QG1lZGlhdGVrLmNvbT4NClJldmlld2VkLWJ5
OiBZaW5nam9lIENoZW4gPHlpbmdqb2UuY2hlbkBtZWRpYXRlay5jb20+DQpSZXZpZXdlZC1ieTog
UGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5kZT4NClJldmlld2VkLWJ5OiBSb2Ig
SGVycmluZyA8cm9iaEBrZXJuZWwub3JnPg0KUmV2aWV3ZWQtYnk6IEd1ZW50ZXIgUm9lY2sgPGdy
b2VjazdAZ21haWwuY29tPg0KLS0tDQogZHJpdmVycy93YXRjaGRvZy9tdGtfd2R0LmMgfCA2ICsr
KysrKw0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykNCg0KZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvd2F0Y2hkb2cvbXRrX3dkdC5jIGIvZHJpdmVycy93YXRjaGRvZy9tdGtfd2R0LmMNCmlu
ZGV4IGU4OGFhY2IwNDA0ZC4uZDZhNjM5M2Y2MDlkIDEwMDY0NA0KLS0tIGEvZHJpdmVycy93YXRj
aGRvZy9tdGtfd2R0LmMNCisrKyBiL2RyaXZlcnMvd2F0Y2hkb2cvbXRrX3dkdC5jDQpAQCAtOSw2
ICs5LDcgQEANCiAgKiBCYXNlZCBvbiBzdW54aV93ZHQuYw0KICAqLw0KIA0KKyNpbmNsdWRlIDxk
dC1iaW5kaW5ncy9yZXNldC1jb250cm9sbGVyL210MjcxMi1yZXNldHMuaD4NCiAjaW5jbHVkZSA8
ZHQtYmluZGluZ3MvcmVzZXQtY29udHJvbGxlci9tdDgxODMtcmVzZXRzLmg+DQogI2luY2x1ZGUg
PGxpbnV4L2RlbGF5Lmg+DQogI2luY2x1ZGUgPGxpbnV4L2Vyci5oPg0KQEAgLTY3LDYgKzY4LDEw
IEBAIHN0cnVjdCBtdGtfd2R0X2RhdGEgew0KIAlpbnQgdG9wcmd1X3N3X3JzdF9udW07DQogfTsN
CiANCitzdGF0aWMgY29uc3Qgc3RydWN0IG10a193ZHRfZGF0YSBtdDI3MTJfZGF0YSA9IHsNCisJ
LnRvcHJndV9zd19yc3RfbnVtID0gTVQyNzEyX1RPUFJHVV9TV19SU1RfTlVNLA0KK307DQorDQog
c3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfd2R0X2RhdGEgbXQ4MTgzX2RhdGEgPSB7DQogCS50b3By
Z3Vfc3dfcnN0X251bSA9IE1UODE4M19UT1BSR1VfU1dfUlNUX05VTSwNCiB9Ow0KQEAgLTMxNCw2
ICszMTksNyBAQCBzdGF0aWMgaW50IG10a193ZHRfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikN
CiAjZW5kaWYNCiANCiBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBtdGtfd2R0X2R0
X2lkc1tdID0gew0KKwl7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10MjcxMi13ZHQiLCAuZGF0
YSA9ICZtdDI3MTJfZGF0YSB9LA0KIAl7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10NjU4OS13
ZHQiIH0sDQogCXsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTgzLXdkdCIsIC5kYXRhID0g
Jm10ODE4M19kYXRhIH0sDQogCXsgLyogc2VudGluZWwgKi8gfQ0KLS0gDQoyLjE4LjANCg==

