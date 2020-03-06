Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70A6017BF16
	for <lists+linux-watchdog@lfdr.de>; Fri,  6 Mar 2020 14:38:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726090AbgCFNiC (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 6 Mar 2020 08:38:02 -0500
Received: from mail.baikalelectronics.com ([87.245.175.226]:37304 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726307AbgCFNiC (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 6 Mar 2020 08:38:02 -0500
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 98D7F80307C2;
        Fri,  6 Mar 2020 13:28:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 00CjeEVMtjHR; Fri,  6 Mar 2020 16:28:18 +0300 (MSK)
From:   <Sergey.Semin@baikalelectronics.ru>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        <linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/7] dt-bindings: watchdog: dw-wdt: Add watchdog TOPs array property
Date:   Fri, 6 Mar 2020 16:27:42 +0300
In-Reply-To: <20200306132747.14701-1-Sergey.Semin@baikalelectronics.ru>
References: <20200306132747.14701-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Message-Id: <20200306132818.98D7F80307C2@mail.baikalelectronics.ru>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Serge Semin <Sergey.Semin@baikalelectronics.ru>

In case if DW Watchdog IP core is built with WDT_USE_FIX_TOP == false,
a custom timeout periods are used to preset the timer counter. In
this case that periods should be specified in a new "snps,watchdog-tops"
property of the DW watchdog dts node.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Signed-off-by: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Paul Burton <paulburton@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
---
 .../bindings/watchdog/snps,dw-wdt.yaml        | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
index 8b30f9601c38..1b3b71351628 100644
--- a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
@@ -46,6 +46,21 @@ properties:
     description: Phandle to the DW Watchdog reset lane.
     maxItems: 1
 
+  snps,watchdog-tops:
+    description: |
+      DW APB Watchdog custom timer intervals - Timeout Period ranges (TOPs).
+      Each TOP is a number loaded into the watchdog counter at the moment of
+      the timer restart. The counter decrementing happens each tick of the
+      reference clock. Therefore the TOPs array is equivalent to an array of
+      the timer expiration intervals supported by the DW APB Watchdog. Note
+      DW APB Watchdog IP-cores might be synthesized with fixed TOP values,
+      in which case this property is unnecessary.
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32-array
+      - items:
+          minItems: 16
+          maxItems: 16
+
 additionalProperties: false
 
 required:
@@ -63,4 +78,19 @@ examples:
       clocks = <&per_base_clk>;
       resets = <&wdt_rst>;
     };
+
+  - |
+    watchdog1: watchdog@ffd02000 {
+      compatible = "snps,dw-wdt";
+      reg = <0xffd02000 0x1000>;
+      interrupts = <0 171 4>;
+      clocks = <&per_base_clk>;
+      clock-names = "tclk";
+      snps,watchdog-tops = <0x000000FF 0x000001FF 0x000003FF
+                            0x000007FF 0x0000FFFF 0x0001FFFF
+                            0x0003FFFF 0x0007FFFF 0x000FFFFF
+                            0x001FFFFF 0x003FFFFF 0x007FFFFF
+                            0x00FFFFFF 0x01FFFFFF 0x03FFFFFF
+                            0x07FFFFFF>;
+    };
 ...
-- 
2.25.1

