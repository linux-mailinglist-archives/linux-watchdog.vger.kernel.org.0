Return-Path: <linux-watchdog+bounces-2594-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 787D39F6197
	for <lists+linux-watchdog@lfdr.de>; Wed, 18 Dec 2024 10:29:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 81E2C7A633D
	for <lists+linux-watchdog@lfdr.de>; Wed, 18 Dec 2024 09:28:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 750941B0420;
	Wed, 18 Dec 2024 09:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="QLQb+rNa"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D021ACEBD;
	Wed, 18 Dec 2024 09:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734513901; cv=none; b=CmtKw2u/8eqjUuERLBhhTdB9TmMHz9ZqzQ9Mm490YX2sjsgwf+Tysss6NIKV8WqlFIjtt8X0VwJsE1ScRECMwitsOpXsPylEYlwMwOfYf4d83RIY/XZ38qj8QRBw0orRVuSci5H5tfL4+T9zCl5P/Gk7VGf5WhZRReYPTlGQmj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734513901; c=relaxed/simple;
	bh=pS5a23mNLFaqwRq9RbFQk0SbCcxj6cMigroNPA0HFQo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Lj1O5ewyuWSfXFAQN0WvJv3ozD4JQc0EUUITs7/Y5Z4vJdWLhxi2lYDg1YXWnHjWSL5AQC9qc9jW9dU5GGWgbSDREBNNWIVN1K+ZHEFaPUHKqtwSK69VWKHfOIHJnlexpyRWfW5tm93Sb3AnlHwLFey3IErhQH5bIW8IRGljjG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=QLQb+rNa; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BI60N1n011765;
	Wed, 18 Dec 2024 10:24:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	3LYXoEwAJCj2ohknL9orR3/jQcCX9UQUNp+RkioFs/s=; b=QLQb+rNaPGsLRKCL
	vxTe1kMHFocrEpOpXo5JVXEJs3ri5oYjn6FjuM7OLs9VUHUilYrL0e9WWrV8Xt1C
	sSCxe3P95YWNdY3aXu0sFLf8jEx9iM/0VrwNFzxkB2QZcArx3LmRVr6BYhgdesLG
	Bf8tjGMMZBjR6XgxaWnfFkdqbq4w6ku2hY7FSCYyuMPFi7vkzqZd//3JYDmlOaEr
	fGB+5HCQH/hZp9cZEWxFdUpG2CIbnyCw7x1dyiGGAnZ7SRvtQlIicmN4zlEcX7Nv
	1cB8sPM7xCd0M4fWAr0ZqsCMqRoaK3ZwiXg2W3ZEG674PjtiMD0ZeAYcW4OLV6zJ
	jG6QXA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43krrcrrt4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 10:24:27 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B14094004B;
	Wed, 18 Dec 2024 10:23:22 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 63B9025F1E3;
	Wed, 18 Dec 2024 10:22:30 +0100 (CET)
Received: from localhost (10.48.86.108) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 18 Dec
 2024 10:22:30 +0100
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
Subject: [PATCH v3] watchdog: stm32_iwdg: fix error message during driver probe
Date: Wed, 18 Dec 2024 10:22:27 +0100
Message-ID: <20241218092227.771133-1-clement.legoffic@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241212102050.374501-1-clement.legoffic@foss.st.com>
References: <20241212102050.374501-1-clement.legoffic@foss.st.com>
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
platform_get_irq() which produces an error message during the driver
probe if we don't have any `interrupts` property in the DT.

Use the platform_get_irq_optional() API to get rid of the error message
as this property is optional.

Fixes: 3ab1663af6c1 ("watchdog: stm32_iwdg: Add pretimeout support")
Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Reviewed-by: Marek Vasut <marex@denx.de>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
v1 -> v2: Change the commit message because it only prints an error
message and dont break the DT backward compatibility.

v2 -> v3: Fix typo in commit message 's/wich/which/g'.

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


