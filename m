Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0936228E122
	for <lists+linux-watchdog@lfdr.de>; Wed, 14 Oct 2020 15:19:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731186AbgJNNTt (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 14 Oct 2020 09:19:49 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:60134 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726810AbgJNNTr (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 14 Oct 2020 09:19:47 -0400
X-UUID: acdd2535599348b394a899c357c3b3c5-20201014
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=0rbUbY5d6b/CqzMZNuO81lplf7j7vZlyTocLXWOmLaM=;
        b=m9R1pokPGauzmf59bT/trKuj/TH8qtbQQDy2yNSuUH4FAeFyT2rLbS4vYSjowpOJwnrbbbvWVfPlZmxtcuRtfVM+mfKnZ6MYzlHYOaophJ5CroFErjdlIjbq/nAMCSClbAK2QadlbshVmUusDoHVtiSZhqHisvUberq57EEttlo=;
X-UUID: acdd2535599348b394a899c357c3b3c5-20201014
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw02.mediatek.com
        (envelope-from <crystal.guo@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 2136793753; Wed, 14 Oct 2020 21:19:43 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Oct 2020 21:19:40 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 14 Oct 2020 21:19:39 +0800
From:   Crystal Guo <crystal.guo@mediatek.com>
To:     <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
CC:     <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
        <seiya.wang@mediatek.com>, Crystal Guo <crystal.guo@mediatek.com>
Subject: [v6,3/4] dt-binding: mt8192: add toprgu reset-controller head file
Date:   Wed, 14 Oct 2020 21:19:35 +0800
Message-ID: <20201014131936.20584-4-crystal.guo@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201014131936.20584-1-crystal.guo@mediatek.com>
References: <20201014131936.20584-1-crystal.guo@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: F5A6F80AD7BD25478AC14C6C4E8CC7DB10719FD8D2B222C1A33C1090362E511C2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

YWRkIHRvcHJndSByZXNldC1jb250cm9sbGVyIGhlYWQgZmlsZSBmb3IgTVQ4MTkyIHBsYXRmb3Jt
DQoNClNpZ25lZC1vZmYtYnk6IENyeXN0YWwgR3VvIDxjcnlzdGFsLmd1b0BtZWRpYXRlay5jb20+
DQpSZXZpZXdlZC1ieTogTWF0dGhpYXMgQnJ1Z2dlciA8bWF0dGhpYXMuYmdnQGdtYWlsLmNvbT4N
CkFja2VkLWJ5OiBHdWVudGVyIFJvZWNrIDxsaW51eEByb2Vjay11cy5uZXQ+DQotLS0NCiAuLi4v
cmVzZXQtY29udHJvbGxlci9tdDgxOTItcmVzZXRzLmggICAgICAgICAgfCAzMCArKysrKysrKysr
KysrKysrKysrDQogMSBmaWxlIGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKykNCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgaW5jbHVkZS9kdC1iaW5kaW5ncy9yZXNldC1jb250cm9sbGVyL210ODE5Mi1yZXNl
dHMuaA0KDQpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kdC1iaW5kaW5ncy9yZXNldC1jb250cm9sbGVy
L210ODE5Mi1yZXNldHMuaCBiL2luY2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQtY29udHJvbGxlci9t
dDgxOTItcmVzZXRzLmgNCm5ldyBmaWxlIG1vZGUgMTAwNjQ0DQppbmRleCAwMDAwMDAwMDAwMDAu
LmJlOWE3Y2EyNDViOQ0KLS0tIC9kZXYvbnVsbA0KKysrIGIvaW5jbHVkZS9kdC1iaW5kaW5ncy9y
ZXNldC1jb250cm9sbGVyL210ODE5Mi1yZXNldHMuaA0KQEAgLTAsMCArMSwzMCBAQA0KKy8qIFNQ
RFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wICovDQorLyoNCisgKiBDb3B5cmlnaHQgKGMp
IDIwMjAgTWVkaWFUZWsgSW5jLg0KKyAqIEF1dGhvcjogWW9uZyBMaWFuZyA8eW9uZy5saWFuZ0Bt
ZWRpYXRlay5jb20+DQorICovDQorDQorI2lmbmRlZiBfRFRfQklORElOR1NfUkVTRVRfQ09OVFJP
TExFUl9NVDgxOTINCisjZGVmaW5lIF9EVF9CSU5ESU5HU19SRVNFVF9DT05UUk9MTEVSX01UODE5
Mg0KKw0KKyNkZWZpbmUgTVQ4MTkyX1RPUFJHVV9NTV9TV19SU1QJCQkJCTENCisjZGVmaW5lIE1U
ODE5Ml9UT1BSR1VfTUZHX1NXX1JTVAkJCQkyDQorI2RlZmluZSBNVDgxOTJfVE9QUkdVX1ZFTkNf
U1dfUlNUCQkJCTMNCisjZGVmaW5lIE1UODE5Ml9UT1BSR1VfVkRFQ19TV19SU1QJCQkJNA0KKyNk
ZWZpbmUgTVQ4MTkyX1RPUFJHVV9JTUdfU1dfUlNUCQkJCTUNCisjZGVmaW5lIE1UODE5Ml9UT1BS
R1VfTURfU1dfUlNUCQkJCQk3DQorI2RlZmluZSBNVDgxOTJfVE9QUkdVX0NPTk5fU1dfUlNUCQkJ
CTkNCisjZGVmaW5lIE1UODE5Ml9UT1BSR1VfQ09OTl9NQ1VfU1dfUlNUCQkJMTINCisjZGVmaW5l
IE1UODE5Ml9UT1BSR1VfSVBVMF9TV19SU1QJCQkJMTQNCisjZGVmaW5lIE1UODE5Ml9UT1BSR1Vf
SVBVMV9TV19SU1QJCQkJMTUNCisjZGVmaW5lIE1UODE5Ml9UT1BSR1VfQVVESU9fU1dfUlNUCQkJ
CTE3DQorI2RlZmluZSBNVDgxOTJfVE9QUkdVX0NBTVNZU19TV19SU1QJCQkJMTgNCisjZGVmaW5l
IE1UODE5Ml9UT1BSR1VfTUpDX1NXX1JTVAkJCQkxOQ0KKyNkZWZpbmUgTVQ4MTkyX1RPUFJHVV9D
MktfUzJfU1dfUlNUCQkJCTIwDQorI2RlZmluZSBNVDgxOTJfVE9QUkdVX0MyS19TV19SU1QJCQkJ
MjENCisjZGVmaW5lIE1UODE5Ml9UT1BSR1VfUEVSSV9TV19SU1QJCQkJMjINCisjZGVmaW5lIE1U
ODE5Ml9UT1BSR1VfUEVSSV9BT19TV19SU1QJCQkyMw0KKw0KKyNkZWZpbmUgTVQ4MTkyX1RPUFJH
VV9TV19SU1RfTlVNCQkJCTIzDQorDQorI2VuZGlmICAvKiBfRFRfQklORElOR1NfUkVTRVRfQ09O
VFJPTExFUl9NVDgxOTIgKi8NCi0tIA0KMi4xOC4wDQo=

