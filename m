Return-Path: <linux-watchdog+bounces-2100-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A09B9924E4
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Oct 2024 08:34:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E4CED1F228D8
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Oct 2024 06:34:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01FD416630A;
	Mon,  7 Oct 2024 06:34:18 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF2B15B13C;
	Mon,  7 Oct 2024 06:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728282857; cv=none; b=Wn5Kmo7npKAVOa6YLF/1UBXWjcpXy2KriTAbFOb5zex3z6q2zDqCBxFJ47MLXKElDD4vvHP0b5PJHPdLk/p5aCcyGkS28X3z0BQ3LpxCs4AsL0YmxQyOUhOaIpUNAWkNqlOsCo8cTmTfQaJSKQoSOsP1n/F+vbcNNc8yquoqm9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728282857; c=relaxed/simple;
	bh=QKnsrnHH4rF8FOuJI0h9zOVDsyQQPZgRzSvWRKKjZhw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GSu57UaMDTfaoQDbxF6ZRWekoiAs1wbIzcN9SmU+imYjR+FpYeEuTe9tj/qSrk1C44imzLQJG3GEtpHnEjkH2B35WTopToU0giJevhpZDTyEOI6bYN6ZQ5P9/wzTb0BuquVSdOQxEJNrKjC3kv5DuJWcmUPrw2NBMPu3mO69HG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Mon, 7 Oct
 2024 14:34:08 +0800
Received: from aspeedtech.com (192.168.10.152) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 7 Oct 2024 14:34:08 +0800
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: <patrick@stwcx.xyz>, <wim@linux-watchdog.org>, <linux@roeck-us.net>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>
CC: <Peter.Yin@quantatw.com>, <Patrick_NC_Lin@wiwynn.com>,
	<Bonnie_Lo@wiwynn.com>, <DELPHINE_CHIU@wiwynn.com>, <BMC-SW@aspeedtech.com>
Subject: [PATCH 1/4] dt-bindings: watchdog: aspeed: Add property for WDT SW reset
Date: Mon, 7 Oct 2024 14:34:05 +0800
Message-ID: <20241007063408.2360874-2-chin-ting_kuo@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241007063408.2360874-1-chin-ting_kuo@aspeedtech.com>
References: <20241007063408.2360874-1-chin-ting_kuo@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add "aspeed,restart-sw" property to distinguish normal WDT
reset from system restart triggered by SW consciously.

Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
---
 .../bindings/watchdog/aspeed,ast2400-wdt.yaml         | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/aspeed,ast2400-wdt.yaml b/Documentation/devicetree/bindings/watchdog/aspeed,ast2400-wdt.yaml
index be78a9865584..6cc3604c295a 100644
--- a/Documentation/devicetree/bindings/watchdog/aspeed,ast2400-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/aspeed,ast2400-wdt.yaml
@@ -95,6 +95,17 @@ properties:
       array with the first word defined using the AST2600_WDT_RESET1_* macros,
       and the second word defined using the AST2600_WDT_RESET2_* macros.
 
+  aspeed,restart-sw:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: >
+      Normally, ASPEED WDT reset may occur when system hangs or reboot
+      triggered by SW consciously. However, system doesn't know whether the
+      restart is triggered by SW consciously since the reset event flag is
+      the same as normal WDT timeout reset. With this property, SW can
+      restart the system immediately and directly without wait for WDT
+      timeout occurs. The reset event flag is also different from the normal
+      WDT reset. This property is only supported since AST2600 platform.
+
 required:
   - compatible
   - reg
-- 
2.34.1


