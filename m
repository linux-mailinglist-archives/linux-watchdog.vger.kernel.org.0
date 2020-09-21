Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFF89271EA5
	for <lists+linux-watchdog@lfdr.de>; Mon, 21 Sep 2020 11:13:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726428AbgIUJNJ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 21 Sep 2020 05:13:09 -0400
Received: from mo-csw1515.securemx.jp ([210.130.202.154]:51586 "EHLO
        mo-csw.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726333AbgIUJNJ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 21 Sep 2020 05:13:09 -0400
Received: by mo-csw.securemx.jp (mx-mo-csw1515) id 08L9CfUo012337; Mon, 21 Sep 2020 18:12:41 +0900
X-Iguazu-Qid: 34treFjs2xXJyKrQTy
X-Iguazu-QSIG: v=2; s=0; t=1600679560; q=34treFjs2xXJyKrQTy; m=gbiaxuyCzYDoNgwfL9/q6Db0r1xGHEPBSgp3giPTl3c=
Received: from imx2.toshiba.co.jp (imx2.toshiba.co.jp [106.186.93.51])
        by relay.securemx.jp (mx-mr1510) id 08L9CdoU017405;
        Mon, 21 Sep 2020 18:12:39 +0900
Received: from enc01.toshiba.co.jp ([106.186.93.100])
        by imx2.toshiba.co.jp  with ESMTP id 08L9CdL8013031;
        Mon, 21 Sep 2020 18:12:39 +0900 (JST)
Received: from hop001.toshiba.co.jp ([133.199.164.63])
        by enc01.toshiba.co.jp  with ESMTP id 08L9CcQ4018177;
        Mon, 21 Sep 2020 18:12:39 +0900
From:   Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     Rob Herring <robh+dt@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     punit1.agrawal@toshiba.co.jp, yuji2.ishikawa@toshiba.co.jp,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-watchdog@vger.kernel.org,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Subject: [PATCH v4 1/2] watchdog: bindings: Add binding documentation for Toshiba Visconti watchdog device
Date:   Mon, 21 Sep 2020 18:12:34 +0900
X-TSB-HOP: ON
Message-Id: <20200921091235.299774-2-nobuhiro1.iwamatsu@toshiba.co.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200921091235.299774-1-nobuhiro1.iwamatsu@toshiba.co.jp>
References: <20200921091235.299774-1-nobuhiro1.iwamatsu@toshiba.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add documentation for the binding of Toshiba Visconti SoC's watchdog.

Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Reviewed-by: Punit Agrawal <punit1.agrawal@toshiba.co.jp>
---
 .../watchdog/toshiba,visconti-wdt.yaml        | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/toshiba,visconti-wdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/toshiba,visconti-wdt.yaml b/Documentation/devicetree/bindings/watchdog/toshiba,visconti-wdt.yaml
new file mode 100644
index 000000000000..345e8b308e1b
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/toshiba,visconti-wdt.yaml
@@ -0,0 +1,52 @@
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
+  timeout-sec: true
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
+            timeout-sec = <20>;
+        };
+    };
-- 
2.27.0

