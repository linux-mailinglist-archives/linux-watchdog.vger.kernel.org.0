Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E39E36A403
	for <lists+linux-watchdog@lfdr.de>; Sun, 25 Apr 2021 03:52:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231193AbhDYBxB (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 24 Apr 2021 21:53:01 -0400
Received: from mail-m17640.qiye.163.com ([59.111.176.40]:9722 "EHLO
        mail-m17640.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229580AbhDYBw5 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 24 Apr 2021 21:52:57 -0400
Received: from vivo-HP-ProDesk-680-G4-PCI-MT.vivo.xyz (unknown [58.251.74.232])
        by mail-m17640.qiye.163.com (Hmail) with ESMTPA id 1065E5401A0;
        Sun, 25 Apr 2021 09:52:16 +0800 (CST)
From:   Wang Qing <wangqing@vivo.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Wang Qing <wangqing@vivo.com>
Subject: [PATCH V9 2/2] doc: mtk-wdt: support pre-timeout when the bark irq is available
Date:   Sun, 25 Apr 2021 09:52:07 +0800
Message-Id: <1619315527-8171-3-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1619315527-8171-1-git-send-email-wangqing@vivo.com>
References: <1619315527-8171-1-git-send-email-wangqing@vivo.com>
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
        oVCBIfWUFZQkNOQ1YYQk1MHh9OH0odTRhVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
        hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PAg6Ojo5Mj8XHgNDIh4jVg0D
        Ey4wCjdVSlVKTUpCSEpOTkhNTE9OVTMWGhIXVQwaFRwKEhUcOw0SDRRVGBQWRVlXWRILWUFZTkNV
        SU5KVUxPVUlISVlXWQgBWUFJTU1KNwY+
X-HM-Tid: 0a7906ba320ed995kuws1065e5401a0
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add description of pre-timeout in mtk-wdt.

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
index e36ba60..8e27777
--- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
@@ -1,5 +1,8 @@
 Mediatek SoCs Watchdog timer
 
+The watchdog supports a pre-timeout interrupt that fires timeout-sec/2
+before the expiry.
+
 Required properties:
 
 - compatible should contain:
@@ -17,6 +20,7 @@ Required properties:
 - reg : Specifies base physical address and size of the registers.
 
 Optional properties:
+- interrupts: Watchdog pre-timeout (bark) interrupt.
 - timeout-sec: contains the watchdog timeout in seconds.
 - #reset-cells: Should be 1.
 
@@ -26,6 +30,7 @@ watchdog: watchdog@10007000 {
 	compatible = "mediatek,mt8183-wdt",
 		     "mediatek,mt6589-wdt";
 	reg = <0 0x10007000 0 0x100>;
+	interrupts = <GIC_SPI 139 IRQ_TYPE_NONE>;
 	timeout-sec = <10>;
 	#reset-cells = <1>;
 };
-- 
2.7.4

