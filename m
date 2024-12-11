Return-Path: <linux-watchdog+bounces-2537-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B909ED229
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 Dec 2024 17:37:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86AEA283133
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 Dec 2024 16:37:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D026619FA93;
	Wed, 11 Dec 2024 16:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="v6qHGIBW"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D303624635B;
	Wed, 11 Dec 2024 16:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733935033; cv=none; b=Ag6TS3nMGmKf2ylcTlOt1CQroF26vGzm60MbJN06huKoRqdu+jwGt5H+lWmYVfK0f7DbKaVs7xHYI1jUllDOAKH1S8/FQAj6A80GqwM2+W0z2acRKJ0Vw0+dawOLFtFtD/7JWuEeZ7W5enPpbgId5W0Ac0a5RKr1fp+AceaEl3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733935033; c=relaxed/simple;
	bh=XCyqkzb8aw28SJgDwljq8SlA1BWNkl7yTHRol9/M9Ug=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fjNRykQ1BrKZjEGkR/cMWv1D1P+mHhDW08p8RdW5r1x0wsUzBpUfJRF+RGWRZdrhILjxWkZSs2cT0EBBy1Qv+OgdKtX264pDUEl34JeK0HfsNUL98yX56ldGtJHrbjKxWJP1F4fmRTTm2o7CnS7ImhJIxQs4QB7p/lMqO8DQDOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=v6qHGIBW; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BBDm6Z1014727;
	Wed, 11 Dec 2024 17:36:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=PXiCCXsVfW/h9LtVSBuu5+
	pxnV9XWp/7D8xOOI/76mU=; b=v6qHGIBWdpcdy0A+GRWq4r6uPGDOSASWQMIovH
	qyiB9GPJiNIvORrT9nax951FzOYMFWGto99bdsY2H0tlW04RTVlEOwgMps32QSte
	TZaMEqyZ5NcQYEfwXPkdOviIVPUpPdefoUVawj/hDcDlQd5ypKMWEvz2uLTqc3CP
	ul7GtS0rhWQC8hXJoMtN7Pi/LnZBBuq76QYlLeN/ClexYXDk52n4n5Tal0hMAOb8
	J1EKXQyRn6AY8cuVcSMz5kC9TKnkocgOivVwizZLnv4hLMsTZgNPZKftoZvCZgVD
	Mki2Fq/S8yJ7v+4a4Ye38RT7mqN0yaA5jP357YP9KYrmxALA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43ccnmc1wy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 17:36:33 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2D14140044;
	Wed, 11 Dec 2024 17:35:33 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8996D22D462;
	Wed, 11 Dec 2024 17:35:02 +0100 (CET)
Received: from localhost (10.48.86.108) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 11 Dec
 2024 17:34:59 +0100
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
Subject: [PATCH] watchdog: stm32_iwdg: fix DT backward compatibility
Date: Wed, 11 Dec 2024 17:34:57 +0100
Message-ID: <20241211163457.301140-1-clement.legoffic@foss.st.com>
X-Mailer: git-send-email 2.34.1
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

The support for this interrupt is optional but the driver mandates the
interrupts property in the device-tree, breaking the compatibility with
existing device-trees.

Use the platform_get_irq_optional() API to comply with existing
device-trees.

Fixes: 3ab1663af6c1 ("watchdog: stm32_iwdg: Add pretimeout support")
Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
---

Please consider merging this patch in the v6.13 cycle to avoid breaking
the compatibility of the existing device-tree.

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


