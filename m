Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70471233033
	for <lists+linux-watchdog@lfdr.de>; Thu, 30 Jul 2020 12:22:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725892AbgG3KWY (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 30 Jul 2020 06:22:24 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:28213 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728960AbgG3KWY (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 30 Jul 2020 06:22:24 -0400
X-UUID: 9905e934e2b741ec9c4fe77dfe937de2-20200730
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=G6HeZr3xVZvC12t/cmuV9GZ3u6QAq9e6j97h583fwvQ=;
        b=Uwp9v1rdAQL4Vjv7C5YAhFcOydTO5cJYmdMUJMINYkmLuZiLyfGi+6vuxqL0n7W2q/hvqpXQziu8jIbIz9a5xwx6HdAD8JBYZ/Lrcl5e5k+vH8OpMs17WZSjLWeQu97ERTIjDgnx/eI7NsRuVedh6A90QeYmts4AIpq/g6rD7RQ=;
X-UUID: 9905e934e2b741ec9c4fe77dfe937de2-20200730
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw02.mediatek.com
        (envelope-from <crystal.guo@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1684985185; Thu, 30 Jul 2020 18:22:20 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 30 Jul 2020 18:22:16 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 30 Jul 2020 18:22:16 +0800
From:   Crystal Guo <crystal.guo@mediatek.com>
To:     <linux@roeck-us.net>, <robh+dt@kernel.org>,
        <matthias.bgg@gmail.com>
CC:     <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
        <seiya.wang@mediatek.com>
Subject: add watchdog support for mt8192 
Date:   Thu, 30 Jul 2020 18:21:45 +0800
Message-ID: <1596104510-11113-1-git-send-email-crystal.guo@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

djMgY2hhbmdlczoNCjEuc2VwYXJhdGUgZml4aW5nIGNvbXBhdGlibGVzIGRlc2NyaXB0aW9uIGFu
ZCBhZGRpbmcgbmV3IGJvYXJkIHdpdGggdHdvIHBhdGNoZXMuDQoyLnVwZGF0ZSBtdDgxODMgRFRT
SSBmb3Igc3luYyB3aXRoIHRoZSBiaW5kaW5nLCB3aGlsZSBtdDI3MTIgRFRTSSBoYXMgbm8gd2F0
Y2hkb2cgbm9kZSwNCnRodXMgbm90IHVwZGF0ZSBpdCB0b2dldGhlci4NCg0KDQp2MiBjaGFuZ2Vz
Og0KaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMTY5MDcyOS8NCmh0dHBzOi8v
cGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTE2OTA3MzEvDQpodHRwczovL3BhdGNod29yay5r
ZXJuZWwub3JnL3BhdGNoLzExNjkwNzE5Lw0KDQoNCnYxIGNoYW5nZXM6DQpodHRwczovL3BhdGNo
d29yay5rZXJuZWwub3JnL3BhdGNoLzExNjgwNDk1Lw0KaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVs
Lm9yZy9wYXRjaC8xMTY4MDQ5Ny8NCg0KQ3J5c3RhbCBHdW8gKDUpOg0KICBkdC1iaW5kaW5nOiBt
ZWRpYXRlazogd2F0Y2hkb2c6IGZpeCB0aGUgZGVzY3JpcHRpb24gb2YgY29tcGF0aWJsZQ0KICBh
cm02NDogZHRzOiBtdDgxODM6IHVwZGF0ZSB3YXRjaGRvZyBkZXZpY2Ugbm9kZQ0KICBkdC1iaW5k
aW5nOiBtZWRpYXRlazogbXQ4MTkyOiB1cGRhdGUgbXRrLXdkdCBkb2N1bWVudA0KICBkdC1iaW5k
aW5nOiBtdDgxOTI6IGFkZCB0b3ByZ3UgcmVzZXQtY29udHJvbGxlciBoZWFkIGZpbGUNCiAgd2F0
Y2hkb2c6IG10ODE5MjogYWRkIHdkdCBzdXBwb3J0DQoNCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5n
cy93YXRjaGRvZy9tdGstd2R0LnR4dCAgICAgICB8ICA1ICsrLS0NCiBhcmNoL2FybTY0L2Jvb3Qv
ZHRzL21lZGlhdGVrL210ODE4My5kdHNpICAgICAgICAgICB8ICAzICstLQ0KIGRyaXZlcnMvd2F0
Y2hkb2cvbXRrX3dkdC5jICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDYgKysrKysNCiAuLi4v
ZHQtYmluZGluZ3MvcmVzZXQtY29udHJvbGxlci9tdDgxOTItcmVzZXRzLmggICB8IDMwICsrKysr
KysrKysrKysrKysrKysrKysNCiA0IGZpbGVzIGNoYW5nZWQsIDQwIGluc2VydGlvbnMoKyksIDQg
ZGVsZXRpb25zKC0pDQogY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvZHQtYmluZGluZ3MvcmVz
ZXQtY29udHJvbGxlci9tdDgxOTItcmVzZXRzLmgNCg==

