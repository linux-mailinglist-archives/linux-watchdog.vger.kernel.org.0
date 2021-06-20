Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 567E33ADEEE
	for <lists+linux-watchdog@lfdr.de>; Sun, 20 Jun 2021 15:50:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229606AbhFTNwR (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 20 Jun 2021 09:52:17 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:52438 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S229593AbhFTNwQ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 20 Jun 2021 09:52:16 -0400
X-UUID: 4f2eacfa156d493aab67abee83d5c36b-20210620
X-UUID: 4f2eacfa156d493aab67abee83d5c36b-20210620
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <christine.zhu@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 35431974; Sun, 20 Jun 2021 21:49:59 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 20 Jun 2021 21:49:57 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 20 Jun 2021 21:49:57 +0800
From:   Christine Zhu <Christine.Zhu@mediatek.com>
To:     <linux@roeck-us.net>, <robh+dt@kernel.org>,
        <wim@linux-watchdog.org>, <matthias.bgg@gmail.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <seiya.wang@mediatek.com>,
        <linux-watchdog@vger.kernel.org>, <rex-bc.chen@mediatek.com>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>,
        <srv_heupstream@mediatek.com>
Subject: [v1,0/3] watchdog: mt8195: add wdt support
Date:   Sun, 20 Jun 2021 21:49:51 +0800
Message-ID: <20210620134954.15233-1-Christine.Zhu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

christine.zhu (3):
  dt-binding: mt8195: update mtk-wdt document
  dt-binding: mt8195: add toprgu reset-controller head file
  watchdog: mt8195: add wdt support

 .../devicetree/bindings/watchdog/mtk-wdt.txt  |  2 +-
 drivers/watchdog/mtk_wdt.c                    |  5 ++++
 include/dt-bindings/reset/mt8195-resets.h     | 29 +++++++++++++++++++
 3 files changed, 35 insertions(+), 1 deletion(-)


