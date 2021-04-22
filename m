Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA5F236778E
	for <lists+linux-watchdog@lfdr.de>; Thu, 22 Apr 2021 04:45:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232618AbhDVCqR (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 21 Apr 2021 22:46:17 -0400
Received: from mail-m121145.qiye.163.com ([115.236.121.145]:42950 "EHLO
        mail-m121145.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230319AbhDVCqR (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 21 Apr 2021 22:46:17 -0400
Received: from vivo-HP-ProDesk-680-G4-PCI-MT.vivo.xyz (unknown [58.251.74.232])
        by mail-m121145.qiye.163.com (Hmail) with ESMTPA id 431F68000E6;
        Thu, 22 Apr 2021 10:45:39 +0800 (CST)
From:   Wang Qing <wangqing@vivo.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Wang Qing <wangqing@vivo.com>
Subject: [PATCH V6 0/2] watchdog: mtk: support pre-timeout when the bark irq is available
Date:   Thu, 22 Apr 2021 10:45:30 +0800
Message-Id: <1619059532-17805-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
        oVCBIfWUFZGktJTlZNHktKTxhKTk4YT0hVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
        hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Mz46Qjo5LD8XEg83GkoMFTcw
        AQgwCRZVSlVKTUpCS05CTk9LS05IVTMWGhIXVQwaFRwKEhUcOw0SDRRVGBQWRVlXWRILWUFZTkNV
        SU5KVUxPVUlISVlXWQgBWUFKTUJPNwY+
X-HM-Tid: 0a78f777fea7b03akuuu431f68000e6
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Use the bark interrupt as the pretimeout notifier if available.
The pretimeout notification shall occur at timeout-sec/2.

Wang Qing (2):
  watchdog: mtk: support pre-timeout when the bark irq is available
  doc: mtk-wdt: support pre-timeout when the bark irq is available

 .../devicetree/bindings/watchdog/mtk-wdt.txt       |  3 ++
 drivers/watchdog/mtk_wdt.c                         | 53 ++++++++++++++++++++--
 2 files changed, 51 insertions(+), 5 deletions(-)

-- 
2.7.4

