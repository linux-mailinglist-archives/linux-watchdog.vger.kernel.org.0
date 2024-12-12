Return-Path: <linux-watchdog+bounces-2557-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4AC9EE404
	for <lists+linux-watchdog@lfdr.de>; Thu, 12 Dec 2024 11:23:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 561B916319E
	for <lists+linux-watchdog@lfdr.de>; Thu, 12 Dec 2024 10:23:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7695B1F2373;
	Thu, 12 Dec 2024 10:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="NMKWlrZJ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7B618B467;
	Thu, 12 Dec 2024 10:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733998995; cv=none; b=VgeW+6LHypG3vq7tE+Im9B3svezNXBRferDdP3fenTX4F1TseNsFLyl0S9meRaoWPyMhS4HCz5y0iU/P6V6iv4xgI/BMNYU4pT8yuM+KSaXqHH/QjC1eYDW8T8PdbtnExZeW9WcuzCyvUBHuHnPQUj8fQH5Z0ubyCHzRSOPnYNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733998995; c=relaxed/simple;
	bh=m/ZEM5rWMje0gye0dN1nFRvCN3Q6uae/ZVnP28Iu/AE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cuuf6++y9KZt8BP9KcuJX1ORSh03cony2fr+LCUlhc9rFokiziTANuYo5/ZnKcYG1EXV+MQi//q1SIC8T+zMlyVNk874esxbF7O0qFxsRT+E6gYb8dCYNVnoAUU0TBzqM7g4/bW0E6nIzNj1U9Uj4aV8pNswRPUirPbuAAJmvis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=NMKWlrZJ; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC6PZoi025473;
	Thu, 12 Dec 2024 11:22:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	imvmMoXZ9/lX7k57eRk+iPS5zu2P97QZjz1NfVU5Z6A=; b=NMKWlrZJKJ6GxD7r
	rCaYfH803/je5mfEepO6UXg4n9wv+cfKDkcZaVRqvu6kR4e54N80P0VafKtbg4Sy
	ovDkNyw4i6c0E+A+XZr4FnI0GaV/xz9EXW20bLTeI/zHNarRXIOtQkXzoJcS6iCD
	AvcWqshiK4iFC6J5nHHetdCDG6XpamqKZkd+YniA91sYrLj+tsovoLcJPbl8kuf2
	T7ikeHdfFrzWXbWE9IonQys1rrlUxVudIHxEg6l2wiYQywMukTdkzBRG2LxMUFgF
	bcNWRLAKDfKjD5bRudV2i9aKix+9dqppc0IbwS8ah6W2G4OuQc9guIynzgSOX/sL
	rnxdYA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43ftj7131f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 11:22:37 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9B35A40044;
	Thu, 12 Dec 2024 11:21:30 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D8C3A2698EA;
	Thu, 12 Dec 2024 11:20:55 +0100 (CET)
Received: from localhost (10.48.86.108) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 12 Dec
 2024 11:20:52 +0100
From: =?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?= <clement.legoffic@foss.st.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
	<linux@roeck-us.net>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>
CC: =?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?= <clement.legoffic@foss.st.com>,
        Marek Vasut <marex@denx.de>, <linux-watchdog@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] watchdog: stm32_iwdg: fix error message during driver probe
Date: Thu, 12 Dec 2024 11:20:50 +0100
Message-ID: <20241212102050.374501-1-clement.legoffic@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241211163457.301140-1-clement.legoffic@foss.st.com>
References: <20241211163457.301140-1-clement.legoffic@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

The commit 3ab1663af6c1 ("watchdog: stm32_iwdg: Add pretimeout support")
introduces the support for the pre-timeout interrupt.

The support for this interrupt is optional but the driver uses the
platform_get_irq() wich produces an error message during the driver
probe if we don't have any `interrupts` property in the DT.

Use the platform_get_irq_optional() API to get rid of the error message
as this property is optional.

Fixes: 3ab1663af6c1 ("watchdog: stm32_iwdg: Add pretimeout support")
Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
---
v1 -> v2: Change the commit message because it only prints an error
message and dont break the DT backward compatibility.

drivers/watchdog/stm32_iwdg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/stm32_iwdg.c b/drivers/watchdog/stm32_iwdg.c
index d700e0d49bb95..8ad06b54c5adc 100644
--- a/drivers/watchdog/stm32_iwdg.c
+++ b/drivers/watchdog/stm32_iwdg.c
@@ -286,7 +286,7 @@ static int stm32_iwdg_irq_init(struct platform_device *pdev,
 	if (!wdt->data->has_early_wakeup)
 		return 0;

-	irq = platform_get_irq(pdev, 0);
+	irq = platform_get_irq_optional(pdev, 0);
 	if (irq <= 0)
 		return 0;


base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
--
2.34.1


