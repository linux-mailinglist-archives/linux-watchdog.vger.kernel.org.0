Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 595EB3B1A53
	for <lists+linux-watchdog@lfdr.de>; Wed, 23 Jun 2021 14:39:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230225AbhFWMmE (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 23 Jun 2021 08:42:04 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:53559 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S230206AbhFWMmD (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 23 Jun 2021 08:42:03 -0400
X-UUID: df62b2099a42454c9e42c9a49a5af266-20210623
X-UUID: df62b2099a42454c9e42c9a49a5af266-20210623
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <christine.zhu@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1415695831; Wed, 23 Jun 2021 20:39:42 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Jun 2021 20:39:35 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Jun 2021 20:39:35 +0800
From:   Christine Zhu <Christine.Zhu@mediatek.com>
To:     <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
CC:     <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <seiya.wang@mediatek.com>
Subject: [v4,0/3] watchdog: mt8195: add wdt support 
Date:   Wed, 23 Jun 2021 20:38:51 +0800
Message-ID: <20210623123854.21941-1-Christine.Zhu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Supports MT8195 watchdog device. Supports MT8195 watchdog reset-controller feature.

Change since v3:
  -fix name formatting in Signed-off-bys and author for all the patches.

Change since v2:
  -fix typos in [v2,0/3] [v2,1/3] [v2,2/3].

Change since v1:
  -Remove the unneeded tag in [v1,1/3] [v1,2/3] [v1,3/3]
  -Add of_device_id of MT8195 in [v1,3/3]
  -use more proper prefixes, such as "dt-bindings: mediatek: mt8195:"
  -provide more information in the cover letter

Christine Zhu (3):
  dt-bindings: mediatek: mt8195: update mtk-wdt document
  dt-bindings: reset: mt8195: add toprgu reset-controller head file
  watchdog: mediatek: mt8195: add wdt support

 .../devicetree/bindings/watchdog/mtk-wdt.txt  |  1 +
 drivers/watchdog/mtk_wdt.c                    |  6 ++++
 .../reset-controller/mt8195-resets.h          | 29 +++++++++++++++++++
 3 files changed, 36 insertions(+)
 create mode 100644 include/dt-bindings/reset-controller/mt8195-resets.h


