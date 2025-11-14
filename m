Return-Path: <linux-watchdog+bounces-4583-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 04786C5BDAC
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Nov 2025 08:57:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B17914E3A05
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Nov 2025 07:57:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA5862F83AC;
	Fri, 14 Nov 2025 07:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hakqROMf"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E88242D7B;
	Fri, 14 Nov 2025 07:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763107037; cv=none; b=Q/x+iL2CcJdIEtJImNgLl2JJT2l3fKSt+A/hIVM+hiM+6k6bcX5Nn50NLouK/kNagiAizJsfGwTITlftgj/a1O+lMia0S1NrLgBEW8KBq5PO+L65F98N4O6GkGUGIiutFgMJUtcPWrF2b3X+7Y6RW3aNgaceAM3TU7gyiQNCzX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763107037; c=relaxed/simple;
	bh=HWKDWtj/LRiV7BL+rTBUHra5GQMtIevGfR7hL693fyQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tLSq7GA4SJmfcddMOrnYP5BzA2bCOtlWgHNtfEJHXgyMZXRObr3TmC1eYi792J+yaOgc03hj394CN/iajfvROkMCzdKHSyReapkn2eik0K3Q+PKr3MY0+LE6Vq4LUvWx2HNkLgtijHiF7ymWflNrRJF8YsjnCTVfl1qvNeY3Scc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hakqROMf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5601DC16AAE;
	Fri, 14 Nov 2025 07:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763107037;
	bh=HWKDWtj/LRiV7BL+rTBUHra5GQMtIevGfR7hL693fyQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hakqROMfwtyqMhGSvIxhv9ymO6ezAd1KLK/+aZQRRLZjTlmtGGmQabusb0Nz1wcZx
	 KmaV8UN2VQZsRzi89qTlMIkTtLQA+6Wt+qGqULAPFxw+RzjRViJlcTcfymF6JK0MwX
	 DiBa4neJP3vFxs2dLH3DY94fzZ0Ve1eJmXz+B21gknw1g/VCGf7Yj89xvMpmg2m+rr
	 YgMax2omydjnlKG744CeexHsR6eaAvh2iU9PATie+PB7FOwjDsooewbK8CuH198nYA
	 gvuCHUFMyrsUReFdMPtuX8P45NwhBQfi8qqOx82P94ADYU2zeIc68G9o2tSIJ11ryo
	 mPHX8UJRJOBVw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 430B4CDE021;
	Fri, 14 Nov 2025 07:57:17 +0000 (UTC)
From: Hrishabh Rajput via B4 Relay <devnull+hrishabh.rajput.oss.qualcomm.com@kernel.org>
Date: Fri, 14 Nov 2025 07:57:09 +0000
Subject: [PATCH v7 1/2] firmware: qcom: scm: Register gunyah watchdog
 device
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-gunyah_watchdog-v7-1-f5c155b941d5@oss.qualcomm.com>
References: <20251114-gunyah_watchdog-v7-0-f5c155b941d5@oss.qualcomm.com>
In-Reply-To: <20251114-gunyah_watchdog-v7-0-f5c155b941d5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763107035; l=2972;
 i=hrishabh.rajput@oss.qualcomm.com; s=20250903; h=from:subject:message-id;
 bh=mH1FtqxmuAuJ/cimaYrFZY8zY4j8ccxfBNlmtzOe46I=;
 b=8KC5sG1YrawMMbVOBNgRiMt9rW4SJBnyac1scac/mk0pKc5bHTeEK5xWZaDN0cSyva59QzJz2
 kGZgoq/7YO6BKVtIOCjn6n0ROLsqLzi5sDuaooriL28/diBWoGIrXv0
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
index e777b7cb9b12..14d0663316e6 100644
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
+	static const uuid_t gunyah_uuid = UUID_INIT(0xc1d58fcd, 0xa453, 0x5fdb,
+						    0x92, 0x65, 0xce, 0x36,
+						    0x67, 0x3d, 0x5f, 0x14);
+	static const char * const of_wdt_compatible[] = {
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



