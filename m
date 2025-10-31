Return-Path: <linux-watchdog+bounces-4485-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53029C246CD
	for <lists+linux-watchdog@lfdr.de>; Fri, 31 Oct 2025 11:22:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DCAEA3A8230
	for <lists+linux-watchdog@lfdr.de>; Fri, 31 Oct 2025 10:21:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDCE333DEE9;
	Fri, 31 Oct 2025 10:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jzW5tepR"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968723346B0;
	Fri, 31 Oct 2025 10:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761906075; cv=none; b=LyBD4EsGW7dLWdxTPm7n3tAY9OC2xmGa+Vl/d6X07YqDMezXV/k2wOsOnr3uNOg7VcMyWcMSUUOzhuoHzHXXnXpVeguClpfwiNKOCmYdsY6BBe+90LVd1Uf4iZkaAeMLxdJXMCb4G6Ggop0i3flv/KzGHBIZLEFyLU7qSId8N1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761906075; c=relaxed/simple;
	bh=eWgStNZQkKRckliNTzEBfeYbSqjsyecK1f1P6AlnbeI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MsGeiXvCWPO1BGJx1pRzFwMapsh/7DXEnauPdUCWoFmIX1WhPD77RuCfA9M3PIo156XN01sFMRFa0NsXl0sbgJOCDRzqvi7jMZIZwO2szyzh8qRKFrjZ3/kFFdpAS/2WeufHVlSg77VSTwgceT/ClbbD/zi9Dy6iYLohX7gRocA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jzW5tepR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 45DDBC4CEFB;
	Fri, 31 Oct 2025 10:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761906075;
	bh=eWgStNZQkKRckliNTzEBfeYbSqjsyecK1f1P6AlnbeI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=jzW5tepRDri9zBMyQsI47H4Tcikc4dqED8tfXWYePy7oBUJkTjHsrm0JWgOg1bFIW
	 saSV+IPVtFoHuWEBBcEV80z222xJrY3+f3ltEuTEqHqqQUQ2QPp4qeIKBOBHlwAqkC
	 VbyS/QgKtlbAzKKL8LmchdT4MmotRfOOH+yNvE24k8AnZjYXbrU/WTvrIuRdI6h09I
	 +YXnYOr5EvOkklH6kH+9UOVx/VQFVukDPsrmAWUZk4NVHn0WOVD4/n5b6ErzEyvk3c
	 oZvp8g38vC+U41lBTuC+a1IoFhWwmbuNMM+wq2LdyYj8Vm07Sdlb2VuwCIdXDapXt5
	 /pd900SL+HdeA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 305ABCCF9F8;
	Fri, 31 Oct 2025 10:21:15 +0000 (UTC)
From: Hrishabh Rajput via B4 Relay <devnull+hrishabh.rajput.oss.qualcomm.com@kernel.org>
Date: Fri, 31 Oct 2025 10:18:13 +0000
Subject: [PATCH v4 1/2] soc: qcom: smem: Register gunyah watchdog device
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-gunyah_watchdog-v4-1-7abb1ee11315@oss.qualcomm.com>
References: <20251031-gunyah_watchdog-v4-0-7abb1ee11315@oss.qualcomm.com>
In-Reply-To: <20251031-gunyah_watchdog-v4-0-7abb1ee11315@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761906073; l=2298;
 i=hrishabh.rajput@oss.qualcomm.com; s=20250903; h=from:subject:message-id;
 bh=ScMyepfgPdrQal4O/t/gi35G4I+goW0FS6p9YVcPjOI=;
 b=1qWdIsujLdCX86SfLztCocP3MKWXDMGJ61+zTsF+4d3pVKhPs7YKa2/Vs2YB0neeANKcrpgSO
 NeAIuM25vKbDor3Hv7CG76ynpZX1CQvn2IW3WHgWs5R4P0+km84l3DH
X-Developer-Key: i=hrishabh.rajput@oss.qualcomm.com; a=ed25519;
 pk=syafMitrjr3b/OYAtA2Im06AUb3fxZY2vJ/t4iCPmgw=
X-Endpoint-Received: by B4 Relay for
 hrishabh.rajput@oss.qualcomm.com/20250903 with auth_id=509
X-Original-From: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
Reply-To: hrishabh.rajput@oss.qualcomm.com

From: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>

To restrict gunyah watchdog initialization to Qualcomm platforms,
register the watchdog device in the SMEM driver.

When Gunyah is not present or Gunyah emulates MMIO-based
watchdog, we expect Qualcomm watchdog or ARM SBSA watchdog device to be
present in the devicetree. If none of these device nodes are detected,
we register the SMC-based Gunyah watchdog device.

Signed-off-by: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
---
 drivers/soc/qcom/smem.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index cf425930539e..40e4749fab02 100644
--- a/drivers/soc/qcom/smem.c
+++ b/drivers/soc/qcom/smem.c
@@ -1118,6 +1118,34 @@ static int qcom_smem_resolve_mem(struct qcom_smem *smem, const char *name,
 	return 0;
 }
 
+static int register_gunyah_wdt_device(void)
+{
+	struct platform_device *gunyah_wdt_dev;
+	struct device_node *np;
+
+	/*
+	 * When Gunyah is not present or Gunyah is emulating a memory-mapped
+	 * watchdog, either of Qualcomm watchdog or ARM SBSA watchdog will be
+	 * present. Skip initialization of SMC-based Gunyah watchdog if that is
+	 * the case.
+	 */
+	np = of_find_compatible_node(NULL, NULL, "qcom,kpss-wdt");
+	if (np) {
+		of_node_put(np);
+		return 0;
+	}
+
+	np = of_find_compatible_node(NULL, NULL, "arm,sbsa-gwdt");
+	if (np) {
+		of_node_put(np);
+		return 0;
+	}
+
+	gunyah_wdt_dev = platform_device_register_simple("gunyah-wdt", -1,
+							 NULL, 0);
+	return PTR_ERR_OR_ZERO(gunyah_wdt_dev);
+}
+
 static int qcom_smem_probe(struct platform_device *pdev)
 {
 	struct smem_header *header;
@@ -1236,11 +1264,20 @@ static int qcom_smem_probe(struct platform_device *pdev)
 	if (IS_ERR(smem->socinfo))
 		dev_dbg(&pdev->dev, "failed to register socinfo device\n");
 
+	ret = register_gunyah_wdt_device();
+	if (ret)
+		dev_dbg(&pdev->dev, "failed to register watchdog device\n");
+
 	return 0;
 }
 
 static void qcom_smem_remove(struct platform_device *pdev)
 {
+	/*
+	 * Gunyah watchdog is intended to be a persistent module. Hence, the
+	 * watchdog device is not unregistered.
+	 */
+
 	platform_device_unregister(__smem->socinfo);
 
 	hwspin_lock_free(__smem->hwlock);

-- 
2.43.0



