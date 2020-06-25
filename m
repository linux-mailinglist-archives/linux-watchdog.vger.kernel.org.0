Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E33A420A5CE
	for <lists+linux-watchdog@lfdr.de>; Thu, 25 Jun 2020 21:29:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406291AbgFYT3Z (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 25 Jun 2020 15:29:25 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:51963 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2406293AbgFYT3Z (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 25 Jun 2020 15:29:25 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1593113364; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=6povPrmreL0VVqG2ffIM23YUf9TbsIQ/By4vC7QiKZY=; b=F7iNXfX3VmOSbAQr23CAATAIAh4EZVm6AeCHMpseIVo7i5asSW581WcLhKsLBVY7YuL39TWC
 JcEyiI6ClLyHRZ0GZNzMJhETeHGJ4XAIDO4XY6RQ4BF7AO8ujaYru1qEzQBq/3/gEzjH2oN4
 gP58BLO5U8UOQ8ucKlQ+LuSnPGY=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyJmNTk5OSIsICJsaW51eC13YXRjaGRvZ0B2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n11.prod.us-west-2.postgun.com with SMTP id
 5ef4fb144c9690533a5ab6fe (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 25 Jun 2020 19:29:24
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4366CC433C8; Thu, 25 Jun 2020 19:29:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8CB77C433C8;
        Thu, 25 Jun 2020 19:29:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8CB77C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Rob Herring <robh@kernel.org>
Subject: [RESEND PATCHv3 1/2] dt-bindings: watchdog: Convert QCOM watchdog timer bindings to YAML
Date:   Fri, 26 Jun 2020 00:59:04 +0530
Message-Id: <77b47aad9d17cb4ec8359bdbbb30c33d818117e6.1593112534.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <cover.1593112534.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1593112534.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Convert QCOM watchdog timer bindings to DT schema format using
json-schema.

Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/watchdog/qcom-wdt.txt | 28 ------------
 .../bindings/watchdog/qcom-wdt.yaml           | 44 +++++++++++++++++++
 2 files changed, 44 insertions(+), 28 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/watchdog/qcom-wdt.txt
 create mode 100644 Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.txt b/Documentation/devicetree/bindings/watchdog/qcom-wdt.txt
deleted file mode 100644
index 41aeaa2ff0f8..000000000000
--- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.txt
+++ /dev/null
@@ -1,28 +0,0 @@
-Qualcomm Krait Processor Sub-system (KPSS) Watchdog
----------------------------------------------------
-
-Required properties :
-- compatible : shall contain only one of the following:
-
-			"qcom,kpss-wdt-msm8960"
-			"qcom,kpss-wdt-apq8064"
-			"qcom,kpss-wdt-ipq8064"
-			"qcom,kpss-wdt-ipq4019"
-			"qcom,kpss-timer"
-			"qcom,scss-timer"
-			"qcom,kpss-wdt"
-
-- reg : shall contain base register location and length
-- clocks : shall contain the input clock
-
-Optional properties :
-- timeout-sec : shall contain the default watchdog timeout in seconds,
-                if unset, the default timeout is 30 seconds
-
-Example:
-	watchdog@208a038 {
-		compatible = "qcom,kpss-wdt-ipq8064";
-		reg = <0x0208a038 0x40>;
-		clocks = <&sleep_clk>;
-		timeout-sec = <10>;
-	};
diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
new file mode 100644
index 000000000000..5448cc537a03
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Krait Processor Sub-system (KPSS) Watchdog timer
+
+maintainers:
+  - Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
+
+allOf:
+  - $ref: watchdog.yaml#
+
+properties:
+  compatible:
+    enum:
+      - qcom,kpss-timer
+      - qcom,kpss-wdt
+      - qcom,kpss-wdt-apq8064
+      - qcom,kpss-wdt-ipq4019
+      - qcom,kpss-wdt-ipq8064
+      - qcom,kpss-wdt-msm8960
+      - qcom,scss-timer
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
+    watchdog@208a038 {
+      compatible = "qcom,kpss-wdt-ipq8064";
+      reg = <0x0208a038 0x40>;
+      clocks = <&sleep_clk>;
+      timeout-sec = <10>;
+    };
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

