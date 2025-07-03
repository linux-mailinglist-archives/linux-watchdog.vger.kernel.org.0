Return-Path: <linux-watchdog+bounces-3814-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B953FAF804E
	for <lists+linux-watchdog@lfdr.de>; Thu,  3 Jul 2025 20:38:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 733BC17AC61
	for <lists+linux-watchdog@lfdr.de>; Thu,  3 Jul 2025 18:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D001E2F3648;
	Thu,  3 Jul 2025 18:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ra39u5rH"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81002F3658;
	Thu,  3 Jul 2025 18:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751567721; cv=none; b=POpsLeM6r5tVepNZiz3YPL0Xxvtf6wRKyV6Ad0q+9mrYF5RC/5lwz8L5+caEsd7xM123+zuX5OfldP6JS7B6pcNyzjMsQT7Wy8urIe3tjF0/j8agbk/VPlyiOJg+HRMOuKhwhfghJ0d8Di97pNZkSjllkO5oGtqnM1AtpJlU74Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751567721; c=relaxed/simple;
	bh=n7GLNr9UDHNjVMK9+2vhYZZ+l51+bpe43hCwlqtOozU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m65iIKqMCTUHL9y++c1nVN4svNnrUyZu/qEXhAhR+dIwba1yz6GMEMnwaBImhi2j2DSrPcdXVuJofUaq9VsAIc83WbE7TDGkLaDULQDzrUetcfK/HG2zMbnc7xXnjT0YNmJKMmXNbBDFJyYr9wodsPl5RMXBWEDkbcA+B11sPoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ra39u5rH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09641C4CEEB;
	Thu,  3 Jul 2025 18:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751567721;
	bh=n7GLNr9UDHNjVMK9+2vhYZZ+l51+bpe43hCwlqtOozU=;
	h=From:To:Cc:Subject:Date:From;
	b=Ra39u5rHH5Aki9TT4pZUv6cxK1IpbZpvt3h9nm7JFOaP0Peisw2y3dpD3CseuWsgs
	 32ZMmqfNBu/1Ca1pImsTkDzWytd/CzVvu/Wj3JXBXhNj2ItZCrYFDEsDPBbtt3h91w
	 +Qt6ZheIOHnQyzt96g0f/b5F8ZYIUMBg1zJnpah3htCz63MpDtEHlKr10h/Xo6iE+p
	 gCb9FxdPAXZJ07KK/GX578/pQqStTnSV/tjHHLWwHxBaVJ5769QH7LTQHNc4fdKbRK
	 sTk8/TtXxkAV2yNzjZKyCCSRXarCyzn2k0pdb4onhPgPWPU7+tmcu/mfqWf/Q0HUd+
	 vAXvutW20fGbg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] watchdog: rti_wdt: Use of_reserved_mem_region_to_resource() for "memory-region"
Date: Thu,  3 Jul 2025 13:35:18 -0500
Message-ID: <20250703183518.2075108-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the newly added of_reserved_mem_region_to_resource() function to
handle "memory-region" properties.

The error handling is a bit different. "memory-region" is optional, so
failed lookup is not an error. But then an error in
of_address_to_resource() is treated as an error. However, that
distinction is not really important. Either the region is available
and usable or it is not. So now, it is just
of_reserved_mem_region_to_resource() which is checked for an error.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/watchdog/rti_wdt.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/watchdog/rti_wdt.c b/drivers/watchdog/rti_wdt.c
index d1f9ce4100a8..be7d7db47591 100644
--- a/drivers/watchdog/rti_wdt.c
+++ b/drivers/watchdog/rti_wdt.c
@@ -15,7 +15,7 @@
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/of.h>
-#include <linux/of_address.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/types.h>
@@ -214,7 +214,6 @@ static int rti_wdt_probe(struct platform_device *pdev)
 	struct rti_wdt_device *wdt;
 	struct clk *clk;
 	u32 last_ping = 0;
-	struct device_node *node;
 	u32 reserved_mem_size;
 	struct resource res;
 	u32 *vaddr;
@@ -299,15 +298,8 @@ static int rti_wdt_probe(struct platform_device *pdev)
 		}
 	}
 
-	node = of_parse_phandle(pdev->dev.of_node, "memory-region", 0);
-	if (node) {
-		ret = of_address_to_resource(node, 0, &res);
-		of_node_put(node);
-		if (ret) {
-			dev_err(dev, "No memory address assigned to the region.\n");
-			goto err_iomap;
-		}
-
+	ret = of_reserved_mem_region_to_resource(pdev->dev.of_node, 0, &res);
+	if (!ret) {
 		/*
 		 * If reserved memory is defined for watchdog reset cause.
 		 * Readout the Power-on(PON) reason and pass to bootstatus.
-- 
2.47.2


