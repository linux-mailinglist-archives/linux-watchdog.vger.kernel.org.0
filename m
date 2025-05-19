Return-Path: <linux-watchdog+bounces-3529-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D4720ABC51F
	for <lists+linux-watchdog@lfdr.de>; Mon, 19 May 2025 19:03:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A054B7A2F82
	for <lists+linux-watchdog@lfdr.de>; Mon, 19 May 2025 17:02:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6292B26AAB5;
	Mon, 19 May 2025 17:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="oNuqiAW1"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784D7288C13;
	Mon, 19 May 2025 17:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747674187; cv=none; b=bDrGblNmbUS7RTGudPacjqUzcVPVnQuuhymUklGvEuURywbL5HBcj2W6gQHXFiPD/dJXQyR7LIN9Uv96mkjq2ER4NRIN4JanqsSPW7P232mMqAHDoXQouPjXcsKwiVG00s+pd+on6kJh9ODGLMwRuZQxwfphpIP9FhT1HSEp9Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747674187; c=relaxed/simple;
	bh=id6sLlLT8e6OOCvWPFO2ag8J665oE4QuQbuDd62e+sA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Z2I0rrmRhyg/X6yrBrEcwAcv6tTA5LCt4S20+987ZePD8FXtfCw29oliO7mDkZi6PI7OVXHAn+fdcxtY4I8z86RS3yJtMJwl39qV7iOYqYoNBeE215m/9qOjY1Qj814ylG+NlOIUYZLZ8TjCR+T21I8lLzElq2z52NNOYTqd9MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=oNuqiAW1; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54JENVIQ010263;
	Mon, 19 May 2025 19:02:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=/GHcyFS0HynTNqpKjFvRFs
	q5Oc2635v1fvZXhZzErh0=; b=oNuqiAW1ifBHjNyvHpFVETOZ0KvqqrmF6zMp4Y
	8CVo/IWxBq/PvB/qyIW/QA2FP091vTAmFj9r0AazMhtMV7Q1gy27YsdfQFb3s3//
	qmeOQZjmaAl+jZA/JtktB3FkcfkTvp5UTgbA4z4qK+PKB0LG6+0YVpsY+NJvQ+Be
	+E/Ckl509SJvGeJW/DRlo6PQbj3cSMfdqY21Oqe3uxRu0k92+MFY9wg9nrXDQ5d+
	cfMXfTQRw9OOLpyaiiez2elqEdfztHh0KYF5mqRqID9nFFPzwG+HZfTUlFrtGob6
	raZADNeuPopF6ZcGaX8eYjCD+tz/aqs/TH0U33mnJa11dp4w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46pfka13yw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 May 2025 19:02:47 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9A48D40052;
	Mon, 19 May 2025 19:01:46 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5E64DAF7007;
	Mon, 19 May 2025 19:01:17 +0200 (CEST)
Received: from localhost (10.48.86.132) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 May
 2025 19:01:17 +0200
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Julius Werner <jwerner@chromium.org>, Evan Benn <evanbenn@chromium.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
	<linux@roeck-us.net>, <linux-watchdog@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: Antonio Borneo <antonio.borneo@foss.st.com>,
        <linux-stm32@st-md-mailman.stormreply.com>
Subject: [PATCH] watchdog: arm_smc_wdt: get wdt status through SMCWD_GET_TIMELEFT
Date: Mon, 19 May 2025 19:00:55 +0200
Message-ID: <20250519170055.205544-1-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
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
 definitions=2025-05-19_07,2025-05-16_03,2025-03-28_01

The optional SMCWD_GET_TIMELEFT command can be used to detect if
the watchdog has already been started.
See the implementation in OP-TEE secure OS [1].

If CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED is set, at probe time check
if the watchdog is already started and then set WDOG_HW_RUNNING in
the watchdog status. This will cause the watchdog framework to
ping the watchdog until a userspace watchdog daemon takes over the
control.

Link: https://github.com/OP-TEE/optee_os/commit/a7f2d4bd8632 [1]

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 drivers/watchdog/arm_smc_wdt.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/arm_smc_wdt.c b/drivers/watchdog/arm_smc_wdt.c
index 8f3d0c3a005fb..f1268f43327ea 100644
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
@@ -131,10 +133,20 @@ static int smcwd_probe(struct platform_device *pdev)
 
 	wdd->info = &smcwd_info;
 	/* get_timeleft is optional */
-	if (smcwd_call(wdd, SMCWD_GET_TIMELEFT, 0, NULL))
-		wdd->ops = &smcwd_ops;
-	else
+	err = smcwd_call(wdd, SMCWD_GET_TIMELEFT, 0, NULL);
+	switch (err) {
+	case 0:
+		if (IS_ENABLED(CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED))
+			set_bit(WDOG_HW_RUNNING, &wdd->status);
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


