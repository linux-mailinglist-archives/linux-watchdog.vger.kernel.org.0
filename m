Return-Path: <linux-watchdog+bounces-4765-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D1DCFE872
	for <lists+linux-watchdog@lfdr.de>; Wed, 07 Jan 2026 16:19:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 92F73300289B
	for <lists+linux-watchdog@lfdr.de>; Wed,  7 Jan 2026 15:19:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66FDE38F223;
	Wed,  7 Jan 2026 15:18:37 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net [60.248.80.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9423036CDED;
	Wed,  7 Jan 2026 15:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.248.80.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767799117; cv=none; b=dznTHctaIA5Sp6ky8vHhI3CGnKmN2PeuwlPKDcJf8UGc5IVvAlKLz0r/XXclwAiT9BOK4L6T+BseTWuPBPvwhtBJKyE1+7ZxBn5k/KiscSo4zda+ZauDyv5YSpfByb86BawMCuVThnKRrvpX7Ok/gm1tcYlvQ/hJXoSB3Fpfo2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767799117; c=relaxed/simple;
	bh=ByP5M+GbuP4OYo96WubsHMcB4OppmQzFijJfi8uMeyM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aSw51ttjFzy5WySrE42bzt7L7Q8cmJI5JLMoGmyhcF6OEE7zXH8VZF4Ai89vnTfeQBYIOv9KQ3DDKHJxylia5G5FRq+aSPN//lN7rga5QSZJDa42M8q4G6O15ex//PLLHQ20hSq8bS+Opg32YqRaevffCKh5tOA9ySIgPZ1XNpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=permerror header.from=andestech.com; spf=pass smtp.mailfrom=andestech.com; arc=none smtp.client-ip=60.248.80.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from Atcsqr.andestech.com (localhost [127.0.0.2] (may be forged))
	by Atcsqr.andestech.com with ESMTP id 607EqoOF083241;
	Wed, 7 Jan 2026 22:52:50 +0800 (+08)
	(envelope-from cl634@andestech.com)
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTPS id 607EpCgE082713
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Wed, 7 Jan 2026 22:51:12 +0800 (+08)
	(envelope-from cl634@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 7 Jan
 2026 22:51:12 +0800
From: CL Wang <cl634@andestech.com>
To: <cl634@andestech.com>, <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-watchdog@vger.kernel.org>, <tim609@andestech.com>
Subject: [PATCH 1/3] dt-bindings: watchdog: Add support for Andes ATCWDT200
Date: Wed, 7 Jan 2026 22:50:55 +0800
Message-ID: <20260107145058.213334-2-cl634@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260107145058.213334-1-cl634@andestech.com>
References: <20260107145058.213334-1-cl634@andestech.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 607EqoOF083241

Add the devicetree binding documentation for the Andes ATCWDT200
watchdog timer, including supported properties and usage examples.

Signed-off-by: CL Wang <cl634@andestech.com>
---
 .../watchdog/andestech,ae350-wdt.yaml         | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/andestech,ae350-wdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/andestech,ae350-wdt.yaml b/Documentation/devicetree/bindings/watchdog/andestech,ae350-wdt.yaml
new file mode 100644
index 000000000000..4726bd6734d8
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/andestech,ae350-wdt.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/andestech,ae350-wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Andes ATCWDT200 Watchdog Timer
+
+maintainers:
+  - CL Wang <cl634@andestech.com>
+
+allOf:
+  - $ref: watchdog.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - andestech,qilai-wdt
+          - const: andestech,ae350-wdt
+      - const: andestech,ae350-wdt
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  andestech,clock-source:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - andestech,clock-source
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    watchdog@f0500000 {
+        compatible = "andestech,ae350-wdt";
+        reg = <0xf0500000 0x20>;
+        clocks = <&clk_wdt>;
+        andestech,clock-source = <0>;
+    };
-- 
2.34.1


