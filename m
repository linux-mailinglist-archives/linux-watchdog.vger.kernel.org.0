Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19A7A44F252
	for <lists+linux-watchdog@lfdr.de>; Sat, 13 Nov 2021 10:47:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235760AbhKMJui (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 13 Nov 2021 04:50:38 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:47937 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230482AbhKMJui (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 13 Nov 2021 04:50:38 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailnew.nyi.internal (Postfix) with ESMTP id BC77E580C06;
        Sat, 13 Nov 2021 04:47:45 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Sat, 13 Nov 2021 04:47:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
         h=from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm2; bh=TQ9hcmGxps5GZp3N9bxxRcf5+B
        NwI07/EPaXfrdG24I=; b=Dhf3UQmQJ9zrCQVxgDRKoKA/EiMuKMHvP3AmVpXqJa
        Mrd3MruhQGsXmJiUttc8PBKOrq33YWRfScx7lBZMnGQPvQ4nws6bg2OfFpGVwgfW
        bjTyUk/RhPFxE/gJxe/TFsNeSm0ubgmREYpx7kMCfoNzr51FpzLrOKurSHfNU3Wl
        /IpVFNrTcJei30jcX9sIUGkbXn27o30iWWjhWkcAuBxD8tDwVrDLYmQHj9OE4S3i
        3QuThN5RdComOsFsi4QwNSMYVle1+bEysKy3GnOfesUw1948bfEMbd4kwMM7+FHL
        zCTlGyQGX0QnJy862mvQCzx2Zv5Ugbmb6ZAzDtGOdQHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=TQ9hcmGxps5GZp3N9
        bxxRcf5+BNwI07/EPaXfrdG24I=; b=OnPb97xwBbA7+UDraNjr3WUmMVuaZWy0J
        a6OD4IqByEB0M7fQdawSnqDAnGS8QYylTMdwO2q1hkn3ELIGLXGeCIQc8nbtXnHH
        EtVLlpGJORoUdQf9YhbftWsmA4JBuVyLjRrUnvdRayJuo5KKZNBrGTlY9nnnfx6X
        ojkU3fhYZLbsviGzEhpV+ksN4RHyBPCc+uHpUI0oKEIFh0lJ0zZ11E6IeQpseCRH
        0iM29MhENEjA6OGPFObvSMtY3siPS6no5fe6PND+hrjuZnhQ8eJf7amLx3GUlFbz
        cVZIiRxwkYBM9/YAS10fRszyC/o5Dzhwlg5fuYgN1xqaqzzDEGbkg==
X-ME-Sender: <xms:wImPYbEppwLLFjQMu-e940coq_XnaA0U60KM98O9XK-JJ-BzM_KoBg>
    <xme:wImPYYXiw4WKrJX4l0UI2kEzmwL9-uAC7zS3o4B8pTYuZANXiw25VAv8wPpIp-U4Z
    8EL1GlbB2LAEZvblos>
X-ME-Received: <xmr:wImPYdJI5xGvu-d5cMOyn4E-qe_KrORSLJYjYhmhestao6VLu3y3RV7ulLy1tyO_h2F2XPCVhKASikb0aprwbm88cPkg6PRQe_8sFnc5-7n1MtvM3qFa-4HdGFiznA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrvdehgddtjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepufhvvghnucfrvght
    vghruceoshhvvghnsehsvhgvnhhpvghtvghrrdguvghvqeenucggtffrrghtthgvrhhnpe
    duffejkeevlefggfekkeevjeffgeekjedtjedtfeethfeludehkeehgfeuteekhfenucff
    ohhmrghinhepuggvvhhitggvthhrvggvrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepshhvvghnsehsvhgvnhhpvghtvghrrdguvghv
X-ME-Proxy: <xmx:wImPYZEZYu1BhVBjCxNmhGYro2Wu-Sns75HhL38yiQ_bLVbhJe-6Lg>
    <xmx:wImPYRXtrMF1XKTpnnCScSQfOWmortYE2WfO1Xw-gsTtw9KWRKAakA>
    <xmx:wImPYUNs5Blno1Qxuo3VJI57pxFptozburDpbxSkVAFz5f1JtEdxgw>
    <xmx:wYmPYZTA5BylJiTYWdFKNf0Bt5GpqTJacoLm4DQ4pEFCCTER5HjPww>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 13 Nov 2021 04:47:42 -0500 (EST)
From:   Sven Peter <sven@svenpeter.dev>
To:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc:     Sven Peter <sven@svenpeter.dev>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Hector Martin <marcan@marcan.st>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Mark Kettenis <mark.kettenis@xs4all.nl>,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] dt-bindings: watchdog: Add Apple Watchdog
Date:   Sat, 13 Nov 2021 10:47:31 +0100
Message-Id: <20211113094732.73889-1-sven@svenpeter.dev>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Apple SoCs come with a simple embedded watchdog. This watchdog is also
required in order to reset the SoC.

Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
 .../bindings/watchdog/apple,wdt.yaml          | 52 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/apple,wdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml b/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
new file mode 100644
index 000000000000..e58c56a6fdf6
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/apple,wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple SoC Watchdog
+
+allOf:
+  - $ref: "watchdog.yaml#"
+
+maintainers:
+  - Sven Peter <sven@svenpeter.dev>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - apple,t8103-wdt
+          - apple,t6000-wdt
+      - const: apple,wdt
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/apple-aic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    wdt: watchdog@50000000 {
+        compatible = "apple,t8103-wdt", "apple,wdt";
+        reg = <0x50000000 0x4000>;
+        clocks = <&clk>;
+        interrupts = <AIC_IRQ 123 IRQ_TYPE_LEVEL_HIGH>;
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 5b7a13f706fa..ba480837724d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1749,6 +1749,7 @@ F:	Documentation/devicetree/bindings/interrupt-controller/apple,aic.yaml
 F:	Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml
 F:	Documentation/devicetree/bindings/pci/apple,pcie.yaml
 F:	Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
+F:	Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
 F:	arch/arm64/boot/dts/apple/
 F:	drivers/i2c/busses/i2c-pasemi-core.c
 F:	drivers/i2c/busses/i2c-pasemi-platform.c
-- 
2.25.1

