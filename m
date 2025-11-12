Return-Path: <linux-watchdog+bounces-4563-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDC2C5440E
	for <lists+linux-watchdog@lfdr.de>; Wed, 12 Nov 2025 20:49:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9F22E4E2967
	for <lists+linux-watchdog@lfdr.de>; Wed, 12 Nov 2025 19:37:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0E0E351FAB;
	Wed, 12 Nov 2025 19:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cz+R4T7s"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4E52264BD;
	Wed, 12 Nov 2025 19:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762976129; cv=none; b=MqBuLb6s7NRuJPQupHMEGEZa+Fbavkcp/vv3qaU5AQUO2oF4fpQPhw2nZ4k8Wl5LVuB7HA+AuYVR8iWx6r6iL7Ox2qnWYmncey7EG0nXFD9R5EbGsnO4+iYdMzmnBMj8imVzfuBPWWqhFpornQZgVX3Nsw9p+t2a7ohmqNPnX2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762976129; c=relaxed/simple;
	bh=0CT0rUXzIoCKNlPxmd3yfGaMgZ50FSABpdJt5631nmE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fhui7l5IAi1c8pWbLy4AFs/S+7/2lTzo0Kcl+jgEihyJIREbULlnA71xn8JAkmIiSnkMWqzbqBmMkyXp87w/Tn1NmRIk3OB+5nhr7emGlaXCJd3rUZmRSsFXMfdnpP0BlySpoQqoBkT5MXgmjk/OLYfh5mw/fmlzl1afZ3r8b5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cz+R4T7s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0DD04C19425;
	Wed, 12 Nov 2025 19:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762976129;
	bh=0CT0rUXzIoCKNlPxmd3yfGaMgZ50FSABpdJt5631nmE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=cz+R4T7sRuUaehVxbqUvX8rXi/z9FHg3KLmy4jZgmYLbpTISxK8kOpvgZXJm6XVlc
	 TVhXm4GbirqVxH7L1tluINKOTIdltkg1l/E4yvp8Gs8+rJwHpB2tcaWS8w92JcuPzC
	 /WV7UTDQd7Scn+kUCDGZi2+nYZDEGHpkmyCwlH27ZAGm+NaKFjCvHQ/P4HWVyNugd1
	 wFJ0oJZrseZkOk+szLtwXpQ3SNF6qNW89fbcqUZvTtxTMRdKc7i3+FYZUq4D4jfZfD
	 2SprFTH6JY7detOEiH83nbjmE2N2VUdXbkxMibpsKX5bLQvfPwZwd6VKkpV4pT/TyR
	 W9E2NNqFOYZdg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB194CD3447;
	Wed, 12 Nov 2025 19:35:28 +0000 (UTC)
From: Hrishabh Rajput via B4 Relay <devnull+hrishabh.rajput.oss.qualcomm.com@kernel.org>
Date: Wed, 12 Nov 2025 19:35:20 +0000
Subject: [PATCH v6 1/2] firmware: qcom: scm: Register gunyah watchdog
 device
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-gunyah_watchdog-v6-1-38ad01f8dac0@oss.qualcomm.com>
References: <20251112-gunyah_watchdog-v6-0-38ad01f8dac0@oss.qualcomm.com>
In-Reply-To: <20251112-gunyah_watchdog-v6-0-38ad01f8dac0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762976127; l=2958;
 i=hrishabh.rajput@oss.qualcomm.com; s=20250903; h=from:subject:message-id;
 bh=ihRtg+QgtDeCPgDkjiTG9jFedS95/mYVU4OhxlJL6fo=;
 b=qr/+nlNWM7m1gi7nALrQv1Ic4vP02+T5SWPnVhsGuXPLsYPiZ4WZGvqb19SZKpAEmQWplKjRD
 Pa+Ykpj+6fGDSb/r111RIQYd5CVDXaf2sUziahnlDOd+q7AiD+t20s2
X-Developer-Key: i=hrishabh.rajput@oss.qualcomm.com; a=ed25519;
 pk=syafMitrjr3b/OYAtA2Im06AUb3fxZY2vJ/t4iCPmgw=
X-Endpoint-Received: by B4 Relay for
 hrishabh.rajput@oss.qualcomm.com/20250903 with auth_id=509
X-Original-From: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
Reply-To: hrishabh.rajput@oss.qualcomm.com

From: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>

To restrict Gunyah watchdog initialization to Qualcomm platforms running
under the Gunyah Hypervisor, register the watchdog device in the QCOM
SCM driver.

When Gunyah is not present or Gunyah emulates MMIO-based watchdog, we
expect Qualcomm watchdog or ARM SBSA watchdog device to be present in
the devicetree. First, we make sure we're running under the Gunyah
Hypervisor. Then we move to check if any of the above mentioned
watchdog device nodes are present, if not then we proceed to register
the SMC-based Gunyah watchdog device.

Signed-off-by: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 53 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index e777b7cb9b12..3f45cc69ef83 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2182,6 +2182,56 @@ int qcom_scm_qtee_callback_response(phys_addr_t buf, size_t buf_size,
 }
 EXPORT_SYMBOL(qcom_scm_qtee_callback_response);
 
+static void qcom_scm_gunyah_wdt_free(void *data)
+{
+	struct platform_device *gunyah_wdt_dev = data;
+
+	platform_device_unregister(gunyah_wdt_dev);
+}
+
+static void qcom_scm_gunyah_wdt_init(struct qcom_scm *scm)
+{
+	struct platform_device *gunyah_wdt_dev;
+	struct device_node *np;
+	bool of_wdt_available;
+	int i;
+	const uuid_t gunyah_uuid = UUID_INIT(0xc1d58fcd, 0xa453, 0x5fdb,
+					     0x92, 0x65, 0xce, 0x36,
+					     0x67, 0x3d, 0x5f, 0x14);
+	const char * const of_wdt_compatible[] = {
+		"qcom,kpss-wdt",
+		"arm,sbsa-gwdt",
+	};
+
+	/* Bail out if we are not running under Gunyah */
+	if (!IS_ENABLED(CONFIG_HAVE_ARM_SMCCC_DISCOVERY) ||
+	    !arm_smccc_hypervisor_has_uuid(&gunyah_uuid))
+		return;
+
+	/*
+	 * Gunyah emulates either of Qualcomm watchdog or ARM SBSA watchdog on
+	 * newer platforms. Bail out if we find them in the devicetree.
+	 */
+	for (i = 0; i < ARRAY_SIZE(of_wdt_compatible); i++) {
+		np = of_find_compatible_node(NULL, NULL, of_wdt_compatible[i]);
+		of_wdt_available = of_device_is_available(np);
+		of_node_put(np);
+		if (of_wdt_available)
+			return;
+	}
+
+	gunyah_wdt_dev = platform_device_register_simple("gunyah-wdt", -1,
+							 NULL, 0);
+	if (IS_ERR(gunyah_wdt_dev)) {
+		dev_err(scm->dev, "Failed to register Gunyah watchdog device: %ld\n",
+			PTR_ERR(gunyah_wdt_dev));
+		return;
+	}
+
+	devm_add_action_or_reset(scm->dev, qcom_scm_gunyah_wdt_free,
+				 gunyah_wdt_dev);
+}
+
 static void qcom_scm_qtee_free(void *data)
 {
 	struct platform_device *qtee_dev = data;
@@ -2448,6 +2498,9 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	/* Initialize the QTEE object interface. */
 	qcom_scm_qtee_init(scm);
 
+	/* Initialize the Gunyah watchdog platform device. */
+	qcom_scm_gunyah_wdt_init(scm);
+
 	return 0;
 }
 

-- 
2.43.0



