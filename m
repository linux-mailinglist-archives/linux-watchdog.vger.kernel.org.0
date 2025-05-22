Return-Path: <linux-watchdog+bounces-3570-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF5EAC0455
	for <lists+linux-watchdog@lfdr.de>; Thu, 22 May 2025 07:58:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F8EEA20AAC
	for <lists+linux-watchdog@lfdr.de>; Thu, 22 May 2025 05:57:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B32741F4C8B;
	Thu, 22 May 2025 05:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="dtc5EZQQ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9881F3B89;
	Thu, 22 May 2025 05:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.148.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747893476; cv=none; b=jLftSx+aORX46A5Qxnsh38TseoQS6B7Ug4Z7Bw3hIZrmYWyN3axgJ8GLA0JXymNfEQnKrETKTbuVOoI289L2963muTGa+N0jYo22j52PCwz3ztGvbfEvHOeS8BzfqLEXLbNkHx2VFnUaTT4PacHxMYATDr7OQv1/Rb+ToprJVzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747893476; c=relaxed/simple;
	bh=3WeuTWf00a8CIQ6rDioYC/Y6x+vib4vbWBWfGv2pM1Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Gef50hJSJibDvlYrWSMsl4YOCDc1B2Gz0wGUoCDWvB/5Cw+rWgVFLLidGXiVyE4zEN/ZBLALlYvVVOduoNn7CcK/4ty5ed37fP3CZKS35wQvYBA8mEoA5dZtmpBgz0JqTHZs1Vz6JtP/MpackG9kYMP7Yub1yKyOBp8m14NElZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=dtc5EZQQ; arc=none smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LNWNwG010290;
	Wed, 21 May 2025 22:57:38 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfpt0220; bh=X
	kkuJza7kOUufs/cQ2lXoFNA3GSdaOGpzSuPaapYVyw=; b=dtc5EZQQVfzERy3NI
	sL+8LgpxmoLHDWtuk7J+y7oZ1fwCRKCDigg/gXzqok8k3gR1k2PicHFJD7xlUSg5
	/aLdOb7j1Dx9ssKphuRWe0gwyLqRn/47/WABKGX0tBhnkD1H9TF4OdQbYMZ0m0QF
	KYBeuhQ/9ZZoP90a6ASX32AnrzvlAkEorSl936w88jWxS8pH5F1Fs3jlmdIWYdtD
	5AzN/V5wmffbg4nVgsLp4xjlVGwFhwaVuGQXJrordtz6igtEV6BYkwwznQHWEuXe
	3s0oWoyDRwpKXjllYpivkt5VQs81EGceEw6jvpKlIgtn0JWtaECZ/2LPA4XuDGrK
	K6EvA==
Received: from dc6wp-exch02.marvell.com ([4.21.29.225])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 46srka8j99-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 22:57:38 -0700 (PDT)
Received: from DC6WP-EXCH02.marvell.com (10.76.176.209) by
 DC6WP-EXCH02.marvell.com (10.76.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Wed, 21 May 2025 22:57:36 -0700
Received: from maili.marvell.com (10.69.176.80) by DC6WP-EXCH02.marvell.com
 (10.76.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Wed, 21 May 2025 22:57:36 -0700
Received: from tx2-sever.caveonetworks.com (unknown [10.110.141.15])
	by maili.marvell.com (Postfix) with ESMTP id 82CC33F708E;
	Wed, 21 May 2025 22:57:36 -0700 (PDT)
From: George Cherian <george.cherian@marvell.com>
To: <linux@roeck-us.net>, <wim@linux-watchdog.org>, <a.fatoum@pengutronix.de>
CC: <linux-watchdog@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "George
 Cherian" <george.cherian@marvell.com>
Subject: [RESEND PATCH v5 2/2] drivers: sbsa_gwdt: Enable the reset_on_panic feature
Date: Thu, 22 May 2025 05:57:15 +0000
Message-ID: <20250522055715.3533356-3-george.cherian@marvell.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250522055715.3533356-1-george.cherian@marvell.com>
References: <20250522055715.3533356-1-george.cherian@marvell.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: hMS1bauiqjSZkET81TUw7f6W7F-orrRX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDA1NyBTYWx0ZWRfX5wuRj8St0l7o NblrE3eVhUE5lTdoDPs2BapLxsggi34t/Z63L7QETKo05KcP6nfgNIc5HEAnddyhrtxFyTAdZXw OGBOsnmLo9LHsvaHTPdFR3c5aeEJZNjVANT/tMWiWyq0aZRWiBrOKs2iEA31DlerMM0IXQp6iPA
 lz/Zx4tMAzCx/HSTcYEtIMCMPNXH/vv/nF2JFeA+KgmSSRDH1SE3zCgH125qr6iyapU4DvLa28t sbGFSYRlX5KVb0B1/cmAOoPuvUifUUu1uEj4UiG3IHxH8Ri4MqOs03sK2yB768T4MrMj/H19ceB i+KBypVGNePPoDX6vDPGFg7RMZ/Tb+MEJeaX9i2ZvyhzhOSQyPrt75efPJw1qA3g2ULFF6wKXmq
 dPO0iyEMvjv3dnXS5Tma/axIDSTqrfBiCpnuaYylaYYEjy8K8FDSez5LilD102jpaylxhd0f
X-Proofpoint-ORIG-GUID: hMS1bauiqjSZkET81TUw7f6W7F-orrRX
X-Authority-Analysis: v=2.4 cv=Bp+dwZX5 c=1 sm=1 tr=0 ts=682ebcd2 cx=c_pps a=gIfcoYsirJbf48DBMSPrZA==:117 a=gIfcoYsirJbf48DBMSPrZA==:17 a=dt9VzEwgFbYA:10 a=M5GUcnROAAAA:8 a=vEtRRzcOuqZZwul3seoA:9 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_03,2025-05-20_03,2025-03-28_01

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


