Return-Path: <linux-watchdog+bounces-4609-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E6116C68E70
	for <lists+linux-watchdog@lfdr.de>; Tue, 18 Nov 2025 11:48:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id BEC9E355EA7
	for <lists+linux-watchdog@lfdr.de>; Tue, 18 Nov 2025 10:45:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5375034E755;
	Tue, 18 Nov 2025 10:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aWzbuKBR"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B9E25D216;
	Tue, 18 Nov 2025 10:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763462689; cv=none; b=GCogQpjVPAOsGY3F7T3l4ufryOhXer5VJR5hbbB6Dogq9asaIxHv5j5XE8C/+0w8g7XXDU+jyDDJ/aYDA5HNnUSu4O4CznYfuehT6f8mWfMFYhYCFB+jDFQhpfEmLWS/O4wkvYZavhHLPUcOp/PH++Myd9bEKT3EuqXOqbglodQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763462689; c=relaxed/simple;
	bh=UZDVC5fBYnMaX1QSUvDcQX1lppwFfrHW+TCOhbvOF0Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DUGGsvRuMY4m2GcCf5XKMYxX76+tOCb44+FDlKf09DtShliR98A24BOjJ2OvH1g+ynMMKO2XAXKOW82HTXae5yzrF3Qo7kUZHWCKJ4zoeHxoqbNdWrVtZufZ8cCtRRyulrhsCSuNxtKG3S71rrz76Fjv9z3qaAouuSX17BHFU9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aWzbuKBR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6402CC4AF12;
	Tue, 18 Nov 2025 10:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763462687;
	bh=UZDVC5fBYnMaX1QSUvDcQX1lppwFfrHW+TCOhbvOF0Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=aWzbuKBRlpJ4mkrvo0Owpn0eBUh1YcFhYISpgfhJNgCephEjwrE6pd2Jb6EroFhUn
	 p1z9X7rRpSaPJ16oTapuE0hMx2e3HXgdT08COQCp9Lsq2A4Ba+bk3aXNJFFSHQniJs
	 NYwIMP86zRbE7hIm4CXHgC0VUucJeAPDY32O7KbqoGSi2tH5vk8RCrBeBnygDMGY02
	 CEXRrcEluArr/BR6iTWqTYTlHdicp9sStRAb+vwEuSYlYznRKGS5unip2Ss3//M81O
	 U9e+hdWQCBNTfrSVougsazby9PBy1VfG1Q1RMM6205OypCKdbIgm4wjQHh9QnKC/Ql
	 ksAeR4pUDDu6w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4DC1CED603;
	Tue, 18 Nov 2025 10:44:46 +0000 (UTC)
From: Hrishabh Rajput via B4 Relay <devnull+hrishabh.rajput.oss.qualcomm.com@kernel.org>
Date: Tue, 18 Nov 2025 10:40:56 +0000
Subject: [PATCH v8 1/2] firmware: qcom: scm: Register gunyah watchdog
 device
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-gunyah_watchdog-v8-1-e5de12e2eef5@oss.qualcomm.com>
References: <20251118-gunyah_watchdog-v8-0-e5de12e2eef5@oss.qualcomm.com>
In-Reply-To: <20251118-gunyah_watchdog-v8-0-e5de12e2eef5@oss.qualcomm.com>
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
 Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>, 
 Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763462685; l=3159;
 i=hrishabh.rajput@oss.qualcomm.com; s=20250903; h=from:subject:message-id;
 bh=QbkS8wQmsdaH9hxqcJKHmMF3zy0+rk83vbojYup0nis=;
 b=gVDUcqCT8uilTx+PA2i+JG2EVYlbohA3RQt/Rd3MXidZhg+B6kVeJd0o/w4u2uouMzvsAVH7i
 bxboKgORvb3DdhhM89uHN4ZgSzVSUwaQ0d2r+sct6HFYdTRJTNMMn5b
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

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Tested-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
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



