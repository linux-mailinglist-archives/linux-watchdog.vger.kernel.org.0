Return-Path: <linux-watchdog+bounces-3245-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A54CA81C2D
	for <lists+linux-watchdog@lfdr.de>; Wed,  9 Apr 2025 07:35:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 148F01B6363C
	for <lists+linux-watchdog@lfdr.de>; Wed,  9 Apr 2025 05:35:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 267151DC745;
	Wed,  9 Apr 2025 05:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="g+7CZB21"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918E31DE2C2;
	Wed,  9 Apr 2025 05:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.148.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744176926; cv=none; b=K9Yv9UTVqdpukpsyn9Bn3svQx22TIvucUS7yDtRv6IFDjsFlNM/SNnxgfZKFydSsGgU/+aZT6KtvOXLbFZGoNTqEd499Polw14N2XUNc/UCeOyUuFig8/FyRPXN2DI4HzTIwiSwZ59aAN7p2HfA1xkZP0BYHwbIXi0Gt4OnWt0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744176926; c=relaxed/simple;
	bh=3WeuTWf00a8CIQ6rDioYC/Y6x+vib4vbWBWfGv2pM1Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qYNnvsBamHMlRxTpOspgTIwKz8YBfhF5QBznTmADyGJNuGQkj5i/OMfH/FzcJtZ8YkqjAMK+YKKC8HCe+V9RnZPjVZ7vFA9neDL/EH6XvIlpMpyA8uP7gGI16+7NK0iSmzjVbQEl9haJ3CLE0p9kwVA+FlHQO2eGplZCo306qqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=g+7CZB21; arc=none smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Received: from pps.filterd (m0431384.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538K8hSg028449;
	Tue, 8 Apr 2025 22:35:00 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfpt0220; bh=X
	kkuJza7kOUufs/cQ2lXoFNA3GSdaOGpzSuPaapYVyw=; b=g+7CZB21CZ/G5bOI0
	QsxlNSaZHKMAd47cr2ecAGjWjzvXBy7PrIJpjwWxzZvkWJ0hY/4PIIIwikWFDKBK
	Qeva4GexuTMzvMpRpuA8Wqd5dfAU6vcqhTs+a/25rsm/r0fw5aCy7ONk0jKomZzJ
	0gLMJADuf7g3XnQqYUYDZQ5SVFg2TqoFTvCo4HKt9SC7HSoEAtCmK/Bwnurm4SPY
	C6LyXBZx7MT4KKXMr2V5fmQQ7ih3UZX2DvEGa+Wa5yOf5zlO3Xy5AMG0lD4nyPi+
	x3vx/NVHkyftSeFIflLrzpT4JOXktYqd3ChfOiuwOnO6a81HN7FRo/Xot+6lk1gk
	FwT9Q==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 45ursc736j-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Apr 2025 22:34:59 -0700 (PDT)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 8 Apr 2025 22:34:58 -0700
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Tue, 8 Apr 2025 22:34:58 -0700
Received: from tx2-sever.caveonetworks.com (unknown [10.110.141.15])
	by maili.marvell.com (Postfix) with ESMTP id 479395B693B;
	Tue,  8 Apr 2025 22:34:58 -0700 (PDT)
From: George Cherian <george.cherian@marvell.com>
To: <linux@roeck-us.net>, <wim@linux-watchdog.org>, <a.fatoum@pengutronix.de>
CC: <linux-watchdog@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "George
 Cherian" <george.cherian@marvell.com>
Subject: [PATCH v5 2/2] drivers: sbsa_gwdt: Enable the reset_on_panic feature
Date: Wed, 9 Apr 2025 05:34:52 +0000
Message-ID: <20250409053452.3173447-3-george.cherian@marvell.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250409053452.3173447-1-george.cherian@marvell.com>
References: <20250409053452.3173447-1-george.cherian@marvell.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: j5w_w3ihiBzAmfSxaN2LCi3xMhAVW--Q
X-Authority-Analysis: v=2.4 cv=M85NKzws c=1 sm=1 tr=0 ts=67f60703 cx=c_pps a=rEv8fa4AjpPjGxpoe8rlIQ==:117 a=rEv8fa4AjpPjGxpoe8rlIQ==:17 a=XR8D0OoHHMoA:10 a=M5GUcnROAAAA:8 a=vEtRRzcOuqZZwul3seoA:9 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-ORIG-GUID: j5w_w3ihiBzAmfSxaN2LCi3xMhAVW--Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_02,2025-04-08_04,2024-11-22_01

Set the WDIOF_OPS_ATOMIC for sbsa_gwdt driver, since the ops are atomic.
Also set the reset_on_panic timeout, this enables the panic notifier to
be registered by watchdog core and use the reset_on_panic timeout to be
configured in case of kernel panic. reset_on_panic is by default set to
60sec. This can be modified runtime via sysfs.

Signed-off-by: George Cherian <george.cherian@marvell.com>
---
 drivers/watchdog/sbsa_gwdt.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/watchdog/sbsa_gwdt.c b/drivers/watchdog/sbsa_gwdt.c
index 5f23913ce3b4..fd5095137712 100644
--- a/drivers/watchdog/sbsa_gwdt.c
+++ b/drivers/watchdog/sbsa_gwdt.c
@@ -92,6 +92,7 @@ struct sbsa_gwdt {
 };
 
 #define DEFAULT_TIMEOUT		10 /* seconds */
+#define DEFAULT_RESET_ON_PANIC_TIMEOUT		60 /* seconds */
 
 static unsigned int timeout;
 module_param(timeout, uint, 0);
@@ -242,6 +243,7 @@ static const struct watchdog_info sbsa_gwdt_info = {
 	.options	= WDIOF_SETTIMEOUT |
 			  WDIOF_KEEPALIVEPING |
 			  WDIOF_MAGICCLOSE |
+			  WDIOF_OPS_ATOMIC |
 			  WDIOF_CARDRESET,
 };
 
@@ -291,6 +293,7 @@ static int sbsa_gwdt_probe(struct platform_device *pdev)
 	wdd->ops = &sbsa_gwdt_ops;
 	wdd->min_timeout = 1;
 	wdd->timeout = DEFAULT_TIMEOUT;
+	wdd->reset_on_panic = DEFAULT_RESET_ON_PANIC_TIMEOUT;
 	watchdog_set_drvdata(wdd, gwdt);
 	watchdog_set_nowayout(wdd, nowayout);
 	sbsa_gwdt_get_version(wdd);
-- 
2.34.1


