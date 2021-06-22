Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0459D3B0845
	for <lists+linux-watchdog@lfdr.de>; Tue, 22 Jun 2021 17:09:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231972AbhFVPLi (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 22 Jun 2021 11:11:38 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:39821 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S231680AbhFVPLh (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 22 Jun 2021 11:11:37 -0400
X-UUID: 973e2495fcbb4f89aa0581e71711c862-20210622
X-UUID: 973e2495fcbb4f89aa0581e71711c862-20210622
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
        (envelope-from <christine.zhu@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 337160652; Tue, 22 Jun 2021 23:09:20 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Jun 2021 23:09:20 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 22 Jun 2021 23:09:19 +0800
From:   Christine Zhu <Christine.Zhu@mediatek.com>
To:     <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
CC:     <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <inux-kernel@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <seiya.wang@mediatek.com>
Subject: [v2,0/3] watchdog: mt8195: add wdt support 
Date:   Tue, 22 Jun 2021 23:09:14 +0800
Message-ID: <20210622150917.29137-1-Christine.Zhu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Supports MT8195 watchdog device. Supports MT8195 watchdog reset-controller feature.

Change since v1:
  -remove the unneeded tag in [v1,1/3] [v1,2/3] [v1,3/3]
  -add of_device_id of MT8195 in [v1,3/3]
  -use more proper prefixes, such as "dt-bindings: mediatek: mt8195:"
  -provide more information in the cover letter

christine.zhu (3):
  dt-binding: mediatek: mt8195: update mtk-wdt document
  dt-binding: reset: mt8195: add toprgu reset-controller head file
  watchdog: mediatek: mt8195: add wdt support

 .../devicetree/bindings/watchdog/mtk-wdt.txt       |  2 +-
 drivers/watchdog/mtk_wdt.c                         |  6 +++++
 .../dt-bindings/reset-controller/mt8195-resets.h   | 29 ++++++++++++++++++++++
 3 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 include/dt-bindings/reset-controller/mt8195-resets.h


