Return-Path: <linux-watchdog+bounces-2982-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2A4A3EAD2
	for <lists+linux-watchdog@lfdr.de>; Fri, 21 Feb 2025 03:36:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1518119C3CA8
	for <lists+linux-watchdog@lfdr.de>; Fri, 21 Feb 2025 02:36:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39BDB1D86FF;
	Fri, 21 Feb 2025 02:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="MjOyxfCS"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620831D6DDD;
	Fri, 21 Feb 2025 02:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.156.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740105385; cv=none; b=Ny7rK+AUeOW7/JOH2gnFrQNDI2SsBVYze7qYGBMLExR+5lxIFfnlZGK0UzM1ca9k+NWdW1XaNjsAznMsnMw+5h2kvTTYFySe0mRTwZrVzlj04Vt07TOD8riNdNGprQbm7ERBloWcJi492gN2lr2fZ2To98IlvdQXuzSYEYhykzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740105385; c=relaxed/simple;
	bh=VqTu4nppqqlBq/VZAIHyMyHkdtdVObY0u7hXFwd8HdU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YwwITpMQXIHz6Dk4ucN4Hk8wZbfAc4ktApm4XPhgMS6mKFOZCdb8tYf8hUoimrjqT0z1z25yBI5JqJP7UAIKmTVjlGVzi87x6jKfVq2GXXRfkgdi3zar/nsFtPWHxkOq5oyjRprrVpDugHdXQ+Fwc14OMC7ce9krSOmFOMScTps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=MjOyxfCS; arc=none smtp.client-ip=67.231.156.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51KL8v1q028904;
	Thu, 20 Feb 2025 18:36:08 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfpt0220; bh=y
	udWezXlfftzuF3RFWfaWuFDvNQm9x3qNmDMXd3OOUY=; b=MjOyxfCSUrpDTYnh/
	PfwpISIZMOYByPdXAty9MgFcxc2v0971UXO2EUzGGgAa6+di8E/D5svto/e59HSS
	BqMqqLiaJt4gpaq/T8Zw7aZoopAebDDH3hA3OgF33E2HIhNRdy277MQgGtr/owLy
	1Pku3lWeaNyoPkMYOov2HvyNTSOANho3mUDfNguLTRfPZh5SfE98J8vIM9dBi6zV
	ssBQP93qXFJ+kL7ioZ4yQLnCZl5WcKH0LbD/INYO1pxPUIZRN+ZbIj01ocSmUf6J
	qZvjkUdSMopF2EtVXWrg3RO9qjOXFpvZw3HiR8Xgk+pR7c7HVXUZb7PpzKFB5W6X
	2ZEpQ==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 44xc24rnb8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 18:36:08 -0800 (PST)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 20 Feb 2025 18:36:07 -0800
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Thu, 20 Feb 2025 18:36:07 -0800
Received: from tx2-sever.caveonetworks.com (unknown [10.110.141.15])
	by maili.marvell.com (Postfix) with ESMTP id 28C123F708C;
	Thu, 20 Feb 2025 18:36:07 -0800 (PST)
From: George Cherian <george.cherian@marvell.com>
To: <wim@linux-watchdog.org>, <linux@roeck-us.net>, <corbet@lwn.net>
CC: <linux-watchdog@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        George Cherian <george.cherian@marvell.com>
Subject: [PATCH 2/2] watchdog: sbsa_gwdt: Enable the WDOG_STOP_ON_PANIC
Date: Fri, 21 Feb 2025 02:35:50 +0000
Message-ID: <20250221023550.2092232-2-george.cherian@marvell.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250221023550.2092232-1-george.cherian@marvell.com>
References: <20250221023550.2092232-1-george.cherian@marvell.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: QwdYUEhnYmHFtEzpbHkNampRzp5I6eOb
X-Proofpoint-ORIG-GUID: QwdYUEhnYmHFtEzpbHkNampRzp5I6eOb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_09,2025-02-20_02,2024-11-22_01

Enable the watchdog stop on panic feature if the module
parameter panicnotify is set. sbsa_gwdt.panicnotify=1 will
disable the watchdog in panic situations.

This helps in avoiding watchdog reset while booting kdump kernel.

Signed-off-by: George Cherian <george.cherian@marvell.com>
---
 Documentation/watchdog/watchdog-parameters.rst | 3 +++
 drivers/watchdog/sbsa_gwdt.c                   | 6 ++++++
 2 files changed, 9 insertions(+)

diff --git a/Documentation/watchdog/watchdog-parameters.rst b/Documentation/watchdog/watchdog-parameters.rst
index 0a0119edfa82..3d7a02d12dc3 100644
--- a/Documentation/watchdog/watchdog-parameters.rst
+++ b/Documentation/watchdog/watchdog-parameters.rst
@@ -523,6 +523,9 @@ sbsa_gwdt:
     nowayout:
 	Watchdog cannot be stopped once started
 	(default=kernel config parameter)
+    panicnotify:
+	Watchdog to be stopped after kernel panic
+	(default=0, don't stop watchdog on panic)
 
 -------------------------------------------------
 
diff --git a/drivers/watchdog/sbsa_gwdt.c b/drivers/watchdog/sbsa_gwdt.c
index 5f23913ce3b4..f289a0b32d30 100644
--- a/drivers/watchdog/sbsa_gwdt.c
+++ b/drivers/watchdog/sbsa_gwdt.c
@@ -116,6 +116,9 @@ MODULE_PARM_DESC(nowayout,
 		 "Watchdog cannot be stopped once started (default="
 		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
 
+static int panicnotify;
+module_param(panicnotify, int, 0);
+MODULE_PARM_DESC(panicnotify, "after kernel panic, do: 0 = don't stop wd(*)  1 = stop wd");
 /*
  * Arm Base System Architecture 1.0 introduces watchdog v1 which
  * increases the length watchdog offset register to 48 bits.
@@ -307,6 +310,9 @@ static int sbsa_gwdt_probe(struct platform_device *pdev)
 	if (status & SBSA_GWDT_WCS_EN)
 		set_bit(WDOG_HW_RUNNING, &wdd->status);
 
+	if (!nowayout && panicnotify)
+		watchdog_stop_on_panic(wdd);
+
 	if (action) {
 		irq = platform_get_irq(pdev, 0);
 		if (irq < 0) {
-- 
2.34.1


