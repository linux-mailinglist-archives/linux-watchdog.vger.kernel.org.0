Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D852B104E3E
	for <lists+linux-watchdog@lfdr.de>; Thu, 21 Nov 2019 09:43:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726170AbfKUInx (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 21 Nov 2019 03:43:53 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:46634 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726165AbfKUInx (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 21 Nov 2019 03:43:53 -0500
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id xAL8ggaE025989;
        Thu, 21 Nov 2019 09:43:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=GwWBHQ9N4yig6Dd7KbgCOG6gB1C+OQALGmmDk+pmewM=;
 b=BuQcLUSpXyNlazcUbw/2qq1STEtvc9EVxz3578cIOrRiF7FaZNl22wur2C0JSlbMs++k
 rUacF6+CS6E+wgGwiE4IMuUj4dWlGh5oWbNlf2XZ0AjPW7N/g8IPE7kUuH7wL7kE2hv9
 c1s6MsW+gL3BZ5nmp9wspcig3wx1n31U8GjTw+fv/G/+qTt51Z23tndGIwrgBsboyh88
 hJXutr759jifbXnE1kw0jDYwBOI+GGaZcY7UJhFREHwzj9NSBrVvU2UWFTAfIfwRhPD9
 1/UYGw47HZJOZg42z+1H7KJQzwjCVP8c4V6hZ4pmxFi4LtSOI6QWqn5RlnQqKB7/5USp 0A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx08-00178001.pphosted.com with ESMTP id 2wa9uvjg7g-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 21 Nov 2019 09:43:22 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DCD8B100038;
        Thu, 21 Nov 2019 09:43:20 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C2A4F2B05DD;
        Thu, 21 Nov 2019 09:43:20 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 21 Nov 2019 09:43:20
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
Subject: [PATCH v2] dt-bindings: watchdog: Convert stm32 watchdog bindings to json-schema
Date:   Thu, 21 Nov 2019 09:43:16 +0100
Message-ID: <20191121084316.13839-1-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG7NODE2.st.com (10.75.127.20) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-21_01:2019-11-20,2019-11-21 signatures=0
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Convert the STM32 watchdog binding to DT schema format using json-schema

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
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
index 000000000000..975b697930a4
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
+      enums: [ lsi, pclk ]
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

