Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34C78368B5C
	for <lists+linux-watchdog@lfdr.de>; Fri, 23 Apr 2021 05:01:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240042AbhDWDBO (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 22 Apr 2021 23:01:14 -0400
Received: from mail-m17640.qiye.163.com ([59.111.176.40]:34812 "EHLO
        mail-m17640.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231552AbhDWDBN (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 22 Apr 2021 23:01:13 -0400
X-Greylist: delayed 416 seconds by postgrey-1.27 at vger.kernel.org; Thu, 22 Apr 2021 23:01:12 EDT
Received: from vivo-HP-ProDesk-680-G4-PCI-MT.vivo.xyz (unknown [58.250.176.229])
        by mail-m17640.qiye.163.com (Hmail) with ESMTPA id A94DF54039F;
        Fri, 23 Apr 2021 10:53:38 +0800 (CST)
From:   Wang Qing <wangqing@vivo.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Wang Qing <wangqing@vivo.com>
Subject: [PATCH V7 0/2] watchdog: mtk: support pre-timeout when the bark irq is available
Date:   Fri, 23 Apr 2021 10:53:21 +0800
Message-Id: <1619146403-12769-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
        oVCBIfWUFZQ0pNHVYeTUIYS05JTEtNTx9VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
        hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OCI6TCo*AT8STw00SzI3ECgh
        Hh4aCh1VSlVKTUpCSk9NT0pCSE5JVTMWGhIXVQwaFRwKEhUcOw0SDRRVGBQWRVlXWRILWUFZTkNV
        SU5LVUpMTVVJSUJZV1kIAVlBSk1CTzcG
X-HM-Tid: 0a78fca5ab2fd995kuwsa94df54039f
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Use the bark interrupt as the pretimeout notifier if available.
The pretimeout notification shall occur at timeout-sec/2.

Wang Qing (2):
  watchdog: mtk: support pre-timeout when the bark irq is available
  doc: mtk-wdt: support pre-timeout when the bark irq is available

 .../devicetree/bindings/watchdog/mtk-wdt.txt       |  5 ++
 drivers/watchdog/mtk_wdt.c                         | 76 ++++++++++++++++++++--
 2 files changed, 76 insertions(+), 5 deletions(-)

-- 
2.7.4

