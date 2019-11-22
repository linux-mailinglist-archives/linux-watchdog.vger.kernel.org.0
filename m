Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D76B41069C2
	for <lists+linux-watchdog@lfdr.de>; Fri, 22 Nov 2019 11:16:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726526AbfKVKQz (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 22 Nov 2019 05:16:55 -0500
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:51717 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726500AbfKVKQy (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 22 Nov 2019 05:16:54 -0500
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id xAMA86rG020312;
        Fri, 22 Nov 2019 11:16:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=5DIkP7J4Od3cu9fEP+WtS76yeid/xn6aBWh+jjvduDs=;
 b=pjf03vQ76bqyo0ksxNbSDQLUqJOWbylg4Aztt6DUMokuqoE3Xe3ENi+pB/1vBJ8SGms6
 kdrR4Mwvpb6olA6ZGfqYBQijrsfnf4OVSx5CWEy91YmwzvGvFeUrib27R8n09cIVAv14
 2JyLh4NHBauvqrmg0aacrZMYgLJlzj6j+ubVYOdbJBNj2+kdCPMAGFElt6W7zF23y13l
 nXhWutZ2kfxd5pRgSmof7aFyf42beZI/ATejhBprGMBJK3Xsgpzb4QD1M5b5Ouva8sAt
 REUu4896iLuEVSz6beyZNQ4bGuoRJtegkYaNbXWUB1y7dnYLWqgrTgwL6P7u/vVbsQ5z 6g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2wa9usr6rh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 22 Nov 2019 11:16:18 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0B10210002A;
        Fri, 22 Nov 2019 11:16:17 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CF8032B41B8;
        Fri, 22 Nov 2019 11:16:17 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 22 Nov 2019 11:16:17
 +0100
From:   Benjamin Gaignard <benjamin.gaignard@st.com>
To:     <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <alexandre.torgue@st.com>
CC:     <linux-watchdog@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: [PATCH v3] dt-bindings: watchdog: Convert stm32 watchdog bindings to json-schema
Date:   Fri, 22 Nov 2019 11:16:16 +0100
Message-ID: <20191122101616.14351-1-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-22_01:2019-11-21,2019-11-22 signatures=0
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Convert the STM32 watchdog binding to DT schema format using json-schema

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
changes in version 3:
- fix typo in clock-names enum
  
changes in version 2:
- remove trailer space
- add Christophe in the maintainers list

 .../devicetree/bindings/watchdog/st,stm32-iwdg.txt | 26 ----------
 .../bindings/watchdog/st,stm32-iwdg.yaml           | 55 ++++++++++++++++++++++
 2 files changed, 55 insertions(+), 26 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.txt
 create mode 100644 Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.txt b/Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.txt
deleted file mode 100644
index d8f4430b0a13..000000000000
--- a/Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.txt
+++ /dev/null
@@ -1,26 +0,0 @@
-STM32 Independent WatchDoG (IWDG)
----------------------------------
-
-Required properties:
-- compatible: Should be either:
-  - "st,stm32-iwdg"
-  - "st,stm32mp1-iwdg"
-- reg: Physical base address and length of the registers set for the device
-- clocks: Reference to the clock entry lsi. Additional pclk clock entry
-  is required only for st,stm32mp1-iwdg.
-- clock-names: Name of the clocks used.
-  "lsi" for st,stm32-iwdg
-  "lsi", "pclk" for st,stm32mp1-iwdg
-
-Optional Properties:
-- timeout-sec: Watchdog timeout value in seconds.
-
-Example:
-
-iwdg: watchdog@40003000 {
-	compatible = "st,stm32-iwdg";
-	reg = <0x40003000 0x400>;
-	clocks = <&clk_lsi>;
-	clock-names = "lsi";
-	timeout-sec = <32>;
-};
diff --git a/Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.yaml b/Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.yaml
new file mode 100644
index 000000000000..928588091710
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/st,stm32-iwdg.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics STM32 Independent WatchDoG (IWDG) bindings
+
+maintainers:
+  - Yannick Fertre <yannick.fertre@st.com>
+  - Christophe Roullier <christophe.roullier@st.com>
+
+allOf:
+  - $ref: "watchdog.yaml#"
+
+properties:
+  compatible:
+    enum:
+      - st,stm32-iwdg
+      - st,stm32mp1-iwdg
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Low speed clock
+      - description: Optional peripheral clock
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    items:
+      enum: [ lsi, pclk ]
+    minItems: 1
+    maxItems: 2
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+examples:
+  - |
+    #include <dt-bindings/clock/stm32mp1-clks.h>
+    watchdog@5a002000 {
+      compatible = "st,stm32mp1-iwdg";
+      reg = <0x5a002000 0x400>;
+      clocks = <&rcc IWDG2>, <&rcc CK_LSI>;
+      clock-names = "pclk", "lsi";
+      timeout-sec = <32>;
+    };
+
+...
-- 
2.15.0

