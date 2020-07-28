Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2739A2307E6
	for <lists+linux-watchdog@lfdr.de>; Tue, 28 Jul 2020 12:43:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728797AbgG1Kna (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 28 Jul 2020 06:43:30 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:33607 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728792AbgG1Kna (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 28 Jul 2020 06:43:30 -0400
X-UUID: 4e98730129154569b105a3edbcc1276c-20200728
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Vw0DxIhTdcEZPoiobHT5ttzLEGNxB/oQgeF1lIhMVFU=;
        b=GQYxSu/KNCHk2svT0yv0uoEXhlaa90Vbz2LcFt4E9zx+qkkmlUl30Fm/IfOtLh8Wk8BumAzuKAzi5bverywOUIEwPoovaC5R+owf/lI/c8x/OUT/GoomPfo5PngP2ur6yx4s/NMGk+82lam4Y7CBNwSbodTj/SblXFOv3xZxubc=;
X-UUID: 4e98730129154569b105a3edbcc1276c-20200728
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw01.mediatek.com
        (envelope-from <crystal.guo@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 443568072; Tue, 28 Jul 2020 18:43:28 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 28 Jul 2020 18:43:27 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 28 Jul 2020 18:43:24 +0800
From:   Crystal Guo <crystal.guo@mediatek.com>
To:     <linux@roeck-us.net>, <robh+dt@kernel.org>,
        <matthias.bgg@gmail.com>
CC:     <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
        <seiya.wang@mediatek.com>, Crystal Guo <crystal.guo@mediatek.com>
Subject: [PATCH 3/3] arm64: dts: mt8183: Add rst-num property
Date:   Tue, 28 Jul 2020 18:42:29 +0800
Message-ID: <1595932949-7033-3-git-send-email-crystal.guo@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1595932949-7033-1-git-send-email-crystal.guo@mediatek.com>
References: <1595932949-7033-1-git-send-email-crystal.guo@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

QWRkIHJzdC1udW0gcHJvcGVydHkgaW4gd2F0Y2hkb2cgbm9kZQ0KDQpTaWduZWQtb2ZmLWJ5OiBD
cnlzdGFsIEd1byA8Y3J5c3RhbC5ndW9AbWVkaWF0ZWsuY29tPg0KLS0tDQogYXJjaC9hcm02NC9i
b290L2R0cy9tZWRpYXRlay9tdDgxODMuZHRzaSB8IDEgKw0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKQ0KDQpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9t
dDgxODMuZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTgzLmR0c2kNCmlu
ZGV4IDdiNzgxZWIuLmRlY2YxNTYgMTAwNjQ0DQotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL21l
ZGlhdGVrL210ODE4My5kdHNpDQorKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210
ODE4My5kdHNpDQpAQCAtMzMyLDYgKzMzMiw3IEBADQogCQkJY29tcGF0aWJsZSA9ICJtZWRpYXRl
ayxtdDgxODMtd2R0IiwNCiAJCQkJICAgICAibWVkaWF0ZWssbXQ2NTg5LXdkdCI7DQogCQkJcmVn
ID0gPDAgMHgxMDAwNzAwMCAwIDB4MTAwPjsNCisJCQlyc3QtbnVtID0gPDE5PjsNCiAJCQkjcmVz
ZXQtY2VsbHMgPSA8MT47DQogCQl9Ow0KIA0KLS0gDQoxLjguMS4xLmRpcnR5DQo=

