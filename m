Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25E3823A024
	for <lists+linux-watchdog@lfdr.de>; Mon,  3 Aug 2020 09:16:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725965AbgHCHPw (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 3 Aug 2020 03:15:52 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:2131 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725855AbgHCHPv (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 3 Aug 2020 03:15:51 -0400
X-UUID: 512139ea9b274e4ab6be6c490eb51832-20200803
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=4JRgEhC0y2uoVXRxy4HPGAXTygiS88WJhGSDBUxynbA=;
        b=YwMwPif0srpRpC20kJ5hh593xQyK1M0eVwU5J6vyE5tS3Oo8jhUevGuchgPA5RMqHw3MpdETJCmNosATBxw04k3NPFuicAKMtCDyZg61dNdXaNKAkmFpFEyr0n7b7+7x9Q97XsVCXF6yWHsBKgxa9zrVNUkPoIOyK/cvJ2MDssc=;
X-UUID: 512139ea9b274e4ab6be6c490eb51832-20200803
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw01.mediatek.com
        (envelope-from <crystal.guo@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1747843160; Mon, 03 Aug 2020 15:15:47 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 3 Aug 2020 15:15:44 +0800
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
        <seiya.wang@mediatek.com>
Subject: [v4,0/5] watchdog: mt8192: add wdt support
Date:   Mon, 3 Aug 2020 15:14:56 +0800
Message-ID: <20200803071501.30634-1-crystal.guo@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

djQgY2hhbmdlczoNCnJldmlzZSBjb21taXQgbWVzc2FnZXMuDQoNCnYzIGNoYW5nZXM6DQpodHRw
czovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzExNjkyNzMxLw0KaHR0cHM6Ly9wYXRjaHdv
cmsua2VybmVsLm9yZy9wYXRjaC8xMTY5Mjc2Ny8NCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5v
cmcvcGF0Y2gvMTE2OTI3MjkvDQpodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzEx
NjkyNzcxLw0KaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMTY5MjczMy8NCg0K
Q3J5c3RhbCBHdW8gKDUpOg0KICBkdC1iaW5kaW5nOiBtZWRpYXRlazogd2F0Y2hkb2c6IGZpeCB0
aGUgZGVzY3JpcHRpb24gb2YgY29tcGF0aWJsZQ0KICBhcm02NDogZHRzOiBtdDgxODM6IHVwZGF0
ZSB3YXRjaGRvZyBkZXZpY2Ugbm9kZQ0KICBkdC1iaW5kaW5nOiBtZWRpYXRlazogbXQ4MTkyOiB1
cGRhdGUgbXRrLXdkdCBkb2N1bWVudA0KICBkdC1iaW5kaW5nOiBtdDgxOTI6IGFkZCB0b3ByZ3Ug
cmVzZXQtY29udHJvbGxlciBoZWFkIGZpbGUNCiAgd2F0Y2hkb2c6IG10ODE5MjogYWRkIHdkdCBz
dXBwb3J0DQoNCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy93YXRjaGRvZy9tdGstd2R0LnR4dCAg
fCAgNSArKy0tDQogYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxODMuZHRzaSAgICAg
IHwgIDMgKy0NCiBkcml2ZXJzL3dhdGNoZG9nL210a193ZHQuYyAgICAgICAgICAgICAgICAgICAg
fCAgNiArKysrDQogLi4uL3Jlc2V0LWNvbnRyb2xsZXIvbXQ4MTkyLXJlc2V0cy5oICAgICAgICAg
IHwgMzAgKysrKysrKysrKysrKysrKysrKw0KIDQgZmlsZXMgY2hhbmdlZCwgNDAgaW5zZXJ0aW9u
cygrKSwgNCBkZWxldGlvbnMoLSkNCiBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9kdC1iaW5k
aW5ncy9yZXNldC1jb250cm9sbGVyL210ODE5Mi1yZXNldHMuaA0KDQoNCg==

