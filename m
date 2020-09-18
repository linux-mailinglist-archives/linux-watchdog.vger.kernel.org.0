Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96C682708CA
	for <lists+linux-watchdog@lfdr.de>; Sat, 19 Sep 2020 00:14:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726250AbgIRWOP (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 18 Sep 2020 18:14:15 -0400
Received: from mo-csw1515.securemx.jp ([210.130.202.154]:57722 "EHLO
        mo-csw.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726064AbgIRWOO (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 18 Sep 2020 18:14:14 -0400
Received: by mo-csw.securemx.jp (mx-mo-csw1515) id 08IMDhZ1007495; Sat, 19 Sep 2020 07:13:43 +0900
X-Iguazu-Qid: 34trYbPuXBQhSsR198
X-Iguazu-QSIG: v=2; s=0; t=1600467222; q=34trYbPuXBQhSsR198; m=VH63IcSVfFTAt05HyvO2YJEqK/SrboQK6x5bk1rP8HI=
Received: from imx12.toshiba.co.jp (imx12.toshiba.co.jp [61.202.160.132])
        by relay.securemx.jp (mx-mr1510) id 08IMDehk018999;
        Sat, 19 Sep 2020 07:13:40 +0900
Received: from enc02.toshiba.co.jp ([61.202.160.51])
        by imx12.toshiba.co.jp  with ESMTP id 08IMDenT019251;
        Sat, 19 Sep 2020 07:13:40 +0900 (JST)
Received: from hop101.toshiba.co.jp ([133.199.85.107])
        by enc02.toshiba.co.jp  with ESMTP id 08IMDd1e011727;
        Sat, 19 Sep 2020 07:13:40 +0900
From:   Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     Rob Herring <robh+dt@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     punit1.agrawal@toshiba.co.jp, yuji2.ishikawa@toshiba.co.jp,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-watchdog@vger.kernel.org,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Subject: [PATCH v2 1/2] watchdog: bindings: Add binding documentation for Toshiba Visconti watchdog device
Date:   Sat, 19 Sep 2020 07:13:36 +0900
X-TSB-HOP: ON
Message-Id: <20200918221337.257157-2-nobuhiro1.iwamatsu@toshiba.co.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200918221337.257157-1-nobuhiro1.iwamatsu@toshiba.co.jp>
References: <20200918221337.257157-1-nobuhiro1.iwamatsu@toshiba.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add documentation for the binding of Toshiba Visconti SoC's watchdog.

Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
---
 .../watchdog/toshiba,visconti-wdt.yaml        | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/toshiba,visconti-wdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/toshiba,visconti-wdt.yaml b/Documentation/devicetree/bindings/watchdog/toshiba,visconti-wdt.yaml
new file mode 100644
index 000000000000..721e38fa5a0f
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/toshiba,visconti-wdt.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2020 Toshiba Electronic Devices & Storage Corporation
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/watchdog/toshiba,visconti-wdt.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Toshiba Visconti SoCs PIUWDT Watchdog timer
+
+maintainers:
+  - Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
+
+allOf:
+  - $ref: watchdog.yaml#
+
+properties:
+  compatible:
+    enum:
+      - toshiba,visconti-wdt
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+examples:
+  - |
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        wdt_clk: wdt-clk {
+            compatible = "fixed-clock";
+            clock-frequency = <150000000>;
+            #clock-cells = <0>;
+        };
+
+        watchdog@28330000 {
+            compatible = "toshiba,visconti-wdt";
+            reg = <0 0x28330000 0 0x1000>;
+            clocks = <&wdt_clk>;
+        };
+    };
-- 
2.27.0

