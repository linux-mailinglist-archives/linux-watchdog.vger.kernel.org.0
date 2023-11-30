Return-Path: <linux-watchdog+bounces-50-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A79287FF89B
	for <lists+linux-watchdog@lfdr.de>; Thu, 30 Nov 2023 18:43:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4764AB20CA8
	for <lists+linux-watchdog@lfdr.de>; Thu, 30 Nov 2023 17:43:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8C5A58132;
	Thu, 30 Nov 2023 17:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BycyN/3C"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F1558104;
	Thu, 30 Nov 2023 17:43:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 315EAC433C8;
	Thu, 30 Nov 2023 17:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701366187;
	bh=glQ7vJRlyzl2+xsSW7kn8lsuhF+aXhOL0FI2Li/dzJk=;
	h=From:To:Cc:Subject:Date:From;
	b=BycyN/3CtipNGEFpKS82OrkkVPuTUAkQiUdpIRgj/4Gw3br5xOTlEU/iPVrraDfDu
	 Qgx66TtMjgMK4XjfVS2HF4/15P8ix09cu1WftYFAy5Mf0IMvANYm4wCJUBWDu6qVUs
	 5znw/3ERkJOzV2U7EAgidCzyFzgKO5UnYXcrKlnrgIrrh7s+e/2GDbkIE1eX7ZFI1A
	 ROYZE3QuYHRpDhhRErNp+EOCSx9tFui+NdNZlee2l43bk8vriTcqu2gEIiwV4xRNaT
	 VytoRtXTEi4qLOjjUfO2CYWlK4BEVQKFcUsws5vWCY9+Swl55HYHSRdJl8WUwMS7/A
	 FYASVBZAngr2Q==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan+linaro@kernel.org>)
	id 1r8l4e-0003Qw-1m;
	Thu, 30 Nov 2023 18:43:40 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH] dt-bindings: watchdog: qcom,pm8916-wdt: add parent spmi node to example
Date: Thu, 30 Nov 2023 18:42:54 +0100
Message-ID: <20231130174254.13180-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PM8916 watchdog is part of an SPMI PMIC, which lives on an SPMI bus.

Add a parent SPMI bus node with an '#address-cells' of 2 and
'#size-cells' of 0 instead of relying on the fact that the default
number of register cells happen to match (i.e. 1 + 1).

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 .../bindings/watchdog/qcom,pm8916-wdt.yaml    | 33 +++++++++++--------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/qcom,pm8916-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom,pm8916-wdt.yaml
index 568eb8480fc3..dc6af204e8af 100644
--- a/Documentation/devicetree/bindings/watchdog/qcom,pm8916-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/qcom,pm8916-wdt.yaml
@@ -30,22 +30,27 @@ examples:
     #include <dt-bindings/interrupt-controller/irq.h>
     #include <dt-bindings/spmi/spmi.h>
 
-    pmic@0 {
-        compatible = "qcom,pm8916", "qcom,spmi-pmic";
-        reg = <0x0 SPMI_USID>;
-        #address-cells = <1>;
+    spmi {
+        #address-cells = <2>;
         #size-cells = <0>;
 
-        pon@800 {
-            compatible = "qcom,pm8916-pon";
-            reg = <0x800>;
-            mode-bootloader = <0x2>;
-            mode-recovery = <0x1>;
-
-            watchdog {
-                compatible = "qcom,pm8916-wdt";
-                interrupts = <0x0 0x8 6 IRQ_TYPE_EDGE_RISING>;
-                timeout-sec = <60>;
+        pmic@0 {
+            compatible = "qcom,pm8916", "qcom,spmi-pmic";
+            reg = <0x0 SPMI_USID>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            pon@800 {
+                compatible = "qcom,pm8916-pon";
+                reg = <0x800>;
+                mode-bootloader = <0x2>;
+                mode-recovery = <0x1>;
+
+                watchdog {
+                    compatible = "qcom,pm8916-wdt";
+                    interrupts = <0x0 0x8 6 IRQ_TYPE_EDGE_RISING>;
+                    timeout-sec = <60>;
+                };
             };
         };
     };
-- 
2.41.0


