Return-Path: <linux-watchdog+bounces-3544-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DCEABD2A8
	for <lists+linux-watchdog@lfdr.de>; Tue, 20 May 2025 11:03:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F1AAE176C87
	for <lists+linux-watchdog@lfdr.de>; Tue, 20 May 2025 09:03:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0763C21CFFD;
	Tue, 20 May 2025 09:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="RB8b8hbi"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D3A211497;
	Tue, 20 May 2025 09:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747731778; cv=none; b=VhwzFGD6EFxhGPdu9h46SzIB0qAyiuYyND040OQC5kVlXP3okAjl+m0NldCwM5i/Biz9mvvYNtCDyMljU+y+WMldlz4ooemfJodE5MbPzesOukFRn8wRscaaugwFiBgDxcMW61v5lvej26UsS/Ftl9hNK+IAlrY1Dl7ugQfAdjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747731778; c=relaxed/simple;
	bh=TWLgt09FaRbBxtK2loDYI9NojLCYcYDlUEYg6GGCD/k=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OjVxtVSTWe0gDWfi9rlgYt4xgXfB5du7n4uRacKnj2g+shYQpe51nbkEqEIw0DvBPxiFPuYz2fSmPH1k9PiA3u4JepkNgv59x7ZWPqj086tuLC/+rbu7POJFxtRSi1hkihjLpMkfL/83EE567LO+iTlKYOX/Wrl7lZ4JBbzcJTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=RB8b8hbi; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54K7gvHw014039;
	Tue, 20 May 2025 11:02:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	LlTxhPCeEp6mSZq7lExD4bZqPrY3pQAprG/owac7STA=; b=RB8b8hbifDduPhh8
	YfcydHK76FHWuz8s0Dy21q9wVeAEMLgq4Y9SNAFXDVugTnR/Az/DIGYVBTTzs3AP
	yWxj/TRA0kbejIyM1XN8kcKryXCKY54sJd104u1O32cfPZGAhImehwXH7cI6yB3z
	YQJS+VvxdbgSc5fmWfVsYQH5Pt8xdNuX4ZUrv0csg5wmGpaQls0ti28L159ydPk8
	bKHVGX7kOQs6JX4BM2hmq+iNsJ0hB1+gRmbY72HWP94WQ5sBQSVET0xVBrEZkke9
	iadu7rfH72jzG+xo7klSirVBTNDiYr2HMc+GQe7gejqreYzZPWq0eOP9ARNzlKOS
	82bMOA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46phbgkvsk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 11:02:39 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E1F4C40077;
	Tue, 20 May 2025 11:01:17 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EDB0FB3FF9D;
	Tue, 20 May 2025 10:59:56 +0200 (CEST)
Received: from localhost (10.48.86.132) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 20 May
 2025 10:59:56 +0200
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Julius Werner <jwerner@chromium.org>, Evan Benn <evanbenn@chromium.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
	<linux@roeck-us.net>, <linux-watchdog@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: Antonio Borneo <antonio.borneo@foss.st.com>,
        <linux-stm32@st-md-mailman.stormreply.com>
Subject: [PATCH v2] watchdog: arm_smc_wdt: get wdt status through SMCWD_GET_TIMELEFT
Date: Tue, 20 May 2025 10:59:52 +0200
Message-ID: <20250520085952.210723-1-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250519170055.205544-1-antonio.borneo@foss.st.com>
References: <20250519170055.205544-1-antonio.borneo@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SAFCAS1NODE1.st.com (10.75.90.11) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_04,2025-05-16_03,2025-03-28_01

The optional SMCWD_GET_TIMELEFT command can be used to detect if
the watchdog has already been started.
See the implementation in OP-TEE secure OS [1].

At probe time, check if the watchdog is already started and then
set WDOG_HW_RUNNING in the watchdog status. This will cause the
watchdog framework to ping the watchdog until a userspace watchdog
daemon takes over the control.

Link: https://github.com/OP-TEE/optee_os/commit/a7f2d4bd8632 [1]

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 drivers/watchdog/arm_smc_wdt.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/arm_smc_wdt.c b/drivers/watchdog/arm_smc_wdt.c
index 8f3d0c3a005fb..bbba23ace7b85 100644
--- a/drivers/watchdog/arm_smc_wdt.c
+++ b/drivers/watchdog/arm_smc_wdt.c
@@ -46,6 +46,8 @@ static int smcwd_call(struct watchdog_device *wdd, enum smcwd_call call,
 		return -ENODEV;
 	if (res->a0 == PSCI_RET_INVALID_PARAMS)
 		return -EINVAL;
+	if (res->a0 == PSCI_RET_DISABLED)
+		return -ENODATA;
 	if (res->a0 != PSCI_RET_SUCCESS)
 		return -EIO;
 	return 0;
@@ -131,10 +133,19 @@ static int smcwd_probe(struct platform_device *pdev)
 
 	wdd->info = &smcwd_info;
 	/* get_timeleft is optional */
-	if (smcwd_call(wdd, SMCWD_GET_TIMELEFT, 0, NULL))
-		wdd->ops = &smcwd_ops;
-	else
+	err = smcwd_call(wdd, SMCWD_GET_TIMELEFT, 0, NULL);
+	switch (err) {
+	case 0:
+		set_bit(WDOG_HW_RUNNING, &wdd->status);
+		fallthrough;
+	case -ENODATA:
 		wdd->ops = &smcwd_timeleft_ops;
+		break;
+	default:
+		wdd->ops = &smcwd_ops;
+		break;
+	}
+
 	wdd->timeout = res.a2;
 	wdd->max_timeout = res.a2;
 	wdd->min_timeout = res.a1;

base-commit: a5806cd506af5a7c19bcd596e4708b5c464bfd21
-- 
2.34.1


