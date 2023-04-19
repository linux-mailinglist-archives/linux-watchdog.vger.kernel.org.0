Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA4D36E7952
	for <lists+linux-watchdog@lfdr.de>; Wed, 19 Apr 2023 14:07:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230141AbjDSMHD (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 19 Apr 2023 08:07:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjDSMHC (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 19 Apr 2023 08:07:02 -0400
Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E13DC172;
        Wed, 19 Apr 2023 05:07:01 -0700 (PDT)
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
        by mx0b-0016f401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33JAffKk016288;
        Wed, 19 Apr 2023 05:06:43 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=pfpt0220;
 bh=Bgdb/hrTjHuJn/1SOfm2FVObXma7/i2K9WZQV6U0ZCw=;
 b=dP0cWmKPdO5JGyuQDMX6MiOpYvzZ7kYiVvDKLeb+5z277dmtuDMsfDWY5GKdcKFsgVIm
 6nHxDrwF7rg1Xmp7Ped0Q4IOTcmqcJQDwUqAFFAn9ZEmZx23pxRxahP5U2MRvdwG5r3+
 lugGmpV53NWhd7XBIY/Y45EqfGp7ysq/4DNuTH94US5OGnBUKGAmAYIT0RU5RfhTKqCS
 kN0/NVhxb+TAvVwgaNZeb2/sdGYK3tTU9oa1jUrMkHUeInnnXSFUTIjhFusvzRBs5BsK
 m/hfbQLZnTlCNsIzIfhWTeksat+nI4UndJQABAInIqEp4/b7qg7sH7eQ70rdeYQQ1XXM Nw== 
Received: from dc5-exch01.marvell.com ([199.233.59.181])
        by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 3q2917su0m-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Wed, 19 Apr 2023 05:06:43 -0700
Received: from DC5-EXCH01.marvell.com (10.69.176.38) by DC5-EXCH01.marvell.com
 (10.69.176.38) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Wed, 19 Apr
 2023 05:06:41 -0700
Received: from bbhushan2.marvell.com (10.69.176.80) by DC5-EXCH01.marvell.com
 (10.69.176.38) with Microsoft SMTP Server id 15.0.1497.48 via Frontend
 Transport; Wed, 19 Apr 2023 05:06:38 -0700
From:   Bharat Bhushan <bbhushan2@marvell.com>
To:     <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <sgoutham@marvell.com>
CC:     Bharat Bhushan <bbhushan2@marvell.com>
Subject: [PATCH 1/2 v2] dt-bindings: watchdog: marvell octeonTX2 GTI system watchdog driver
Date:   Wed, 19 Apr 2023 17:36:34 +0530
Message-ID: <20230419120635.3736-1-bbhushan2@marvell.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: Gu8GpDd9KkJECGpu5ZeZEWvNhA2mIwqf
X-Proofpoint-ORIG-GUID: Gu8GpDd9KkJECGpu5ZeZEWvNhA2mIwqf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-19_06,2023-04-18_01,2023-02-09_01
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add binding documentation for the Marvell octeonTX2
GTI system watchdog driver.

Signed-off-by: Bharat Bhushan <bbhushan2@marvell.com>
---
v2:
 - compatible changed from marvell-octeontx2-wdt to marvell,octeontx2-wdt
 - corrected type atchdog to watchdog 
 - Replaced hardcoding to use IRQ_TYPE_EDGE_RISING flag

 .../watchdog/marvell,octeontx2-wdt.yaml       | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/marvell,octeontx2-wdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/marvell,octeontx2-wdt.yaml b/Documentation/devicetree/bindings/watchdog/marvell,octeontx2-wdt.yaml
new file mode 100644
index 000000000000..96a979c4082d
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/marvell,octeontx2-wdt.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/marvell,octeontx2-wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Marvell OcteonTX2 GTI system watchdog
+
+allOf:
+  - $ref: watchdog.yaml#
+
+maintainers:
+  - Bharat Bhushan <bbhushan2@marvell.com>
+
+properties:
+  compatible:
+    const: marvell,octeontx2-wdt
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        watchdog@802000040000 {
+          compatible = "marvell,octeontx2-wdt";
+          reg = <0x00008020 0x00040000 0x00000000 0x00020000>;
+          interrupts = <0 38 IRQ_TYPE_EDGE_RISING>;
+        };
+    };
+
+...
-- 
2.17.1

