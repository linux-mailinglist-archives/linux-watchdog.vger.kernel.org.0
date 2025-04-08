Return-Path: <linux-watchdog+bounces-3237-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5ABA7F8C1
	for <lists+linux-watchdog@lfdr.de>; Tue,  8 Apr 2025 10:59:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B850D3B8F9D
	for <lists+linux-watchdog@lfdr.de>; Tue,  8 Apr 2025 08:53:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 035102673B5;
	Tue,  8 Apr 2025 08:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pFtMc5Cj"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7522E264F9A
	for <linux-watchdog@vger.kernel.org>; Tue,  8 Apr 2025 08:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744102240; cv=none; b=YxMt7XwW8Gka8ttDQ4T2cJFYabVbIV5rJrgfVh6u2ZUt/iK+OoXNQW/mzgcoVN6zLtHiW/87LP9oevoYfxjpeNjeU0xkmhw0OXhZR3ISWFEkpOv23mg/OKO206llVHEjHGNUrzyOzxyWcuG//IBP/uHAnK5Bl/kH5RSEP8e5gJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744102240; c=relaxed/simple;
	bh=2gPWJwQ9nkl6gP7/v0hkdihLo0d1p/EeJz3iO3462RA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Go77qgpnHpWm8wfssFzyJiRhfMguim51drHIR+2cGokTNaBy+QXR4O+uHdExq+dO0lNb6oy8+rj9pGQK7xQxlR8PEnXlNCPWHpUWHqyXTmH+x2H1zf1kQ4BaEygqJJvQjKdZf1KiMo/IN8evSueGdCV0avRS8K2/rKZLmlCFHZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pFtMc5Cj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5382GMqM000856
	for <linux-watchdog@vger.kernel.org>; Tue, 8 Apr 2025 08:50:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/zNMINPbbkWSgbjS3GT3zoPIt8rKYvAoMRG44wNvnhE=; b=pFtMc5CjxnZPXT1X
	FyciRSK4XKvmZ4zUKNaCQ1ckFE8OzEFjvBank8DUN2He/keoqQyyGPtokI1yWU/2
	YwWc84i0Qhh3eYftR6aaZEbK7vnAvsW5rWUC0LXYf3ExwtUXVZ+7Fe1apxpbCQvF
	vXBBtcgGGvHkoR4NektmuDGsHLaNQmJEzvHMA3RtmsNNulkfEViAxuVwPrkGcoXt
	bEZtuAPGE0jik3h0dzw8IR1yNz/fUCMFWJ4+gqXWQpO4phaaCnWY9Mc7SXrmdug7
	EO9PsItHzU22I/vecHAXrATsZV8bxhddSdk1Od4LmGXTGRIxnD50wDpdXfGd4jRl
	dGf9mA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbe7596-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Tue, 08 Apr 2025 08:50:38 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3032f4ea8cfso5511426a91.3
        for <linux-watchdog@vger.kernel.org>; Tue, 08 Apr 2025 01:50:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744102220; x=1744707020;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/zNMINPbbkWSgbjS3GT3zoPIt8rKYvAoMRG44wNvnhE=;
        b=H4jtHPML8WTwZ5oHUYJdd1eRJL+FGXGP3p/4NQo427q6oCt2GhjLJNrZLuQcLIyfvW
         DVhV1Fk/YUMwZodopSnvr0c/qS2LgKaBxKpSD8IhmbqNE8KcV+a/l7baHFLXfXe29gSc
         DwT8Z1lmFg08BBpgq8R2kqNKB6W1CvpfLFwxlcdx1rmGPyxz2iRIU4X9Lg9beajIPINp
         65XpuKFqJ4GvpNcQ5kwpLBebGArLY+++/EP+TDCZWIvZyj5WzxuAYwKm9/RoTNsOIJ7e
         /+AgtNQ3kV8ZsoQnjlpWfbNznCVG65UqYlrwEQMGzGRh8D2HROxWS4fXdoYf1S/Xgeey
         rZ+g==
X-Forwarded-Encrypted: i=1; AJvYcCUenE+M1vsZE1j2HcX+vgRUrqL+xG7mc2ygKBb4XNyurXE4OIaaUmVJighpd9nXjYce+OQIAbQdqIB3/cBPlA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvG+szeJ4zsPEcUwCKF11J0LT/AkPq6owmy2lwrDxC4MicjQ6U
	ILEqWGNTrNkReQnJWUPkG9Id39DsdGW2u6wY18pLjxYN5kyYQhiTzTDduO7dw78AfYFwI6R5DGb
	BYNV/xqWx99qcvA/CR4t+sl0StaMZhyfMF+q1yBB+kmuxn0xgOFonL7lZSDqDn0vwkQ==
X-Gm-Gg: ASbGncsHu9h/RayBg9Eo7xcu+Lu065fiqR2E8Hcg4iMN+MZiiorTtd+x91kg93MK3ZV
	YUvY0US/3AsvX1rym7S/zxHYT29XSvOSX4GGOoAO51drQJKxAPBVllopTGkks5HZFOa8v/ayUCd
	zKg/mJ3xxSk3ps/gPPTgCqkHCuMZuP8jon4BAnlvUBYkJE59y/KQZIl7VcHeh/PQbpri4A44aoZ
	kvzn7ic4KVF9QvlG5Nv65kA1QrWSrWRU5LQjTrHViLXLDzwAPOR8KUZk4pBhrjUmruKMeI2atZ9
	rNxVPjlsoXN+JraIgugX3qqxeBGc4ybXaipLrjA+nqfw0goNSdUrVsTOeCo5PM9d4QuncT+SXie
	yqThRya332SFZ4cCvl6qZZ3leV9ay78p5EJCF8O58eESz4aXwSfM=
X-Received: by 2002:a17:90b:2809:b0:2ff:7031:e380 with SMTP id 98e67ed59e1d1-306a4865159mr23874326a91.10.1744102220435;
        Tue, 08 Apr 2025 01:50:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGEzlsUBlxlFv2r3IZhFuiNr9c+0kg5FQh1gTuWqSU0AZ+aCFkkyQ3LnD7iwnP1Llub+ztplA==
X-Received: by 2002:a17:90b:2809:b0:2ff:7031:e380 with SMTP id 98e67ed59e1d1-306a4865159mr23874298a91.10.1744102220116;
        Tue, 08 Apr 2025 01:50:20 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3057cb5a823sm10480846a91.34.2025.04.08.01.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 01:50:19 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 08 Apr 2025 14:19:55 +0530
Subject: [PATCH RFC 5/6] watchdog: qcom-wdt: add support to read the
 restart reason from IMEM
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-wdt_reset_reason-v1-5-e6ec30c2c926@oss.qualcomm.com>
References: <20250408-wdt_reset_reason-v1-0-e6ec30c2c926@oss.qualcomm.com>
In-Reply-To: <20250408-wdt_reset_reason-v1-0-e6ec30c2c926@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744102197; l=2693;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=2gPWJwQ9nkl6gP7/v0hkdihLo0d1p/EeJz3iO3462RA=;
 b=txQ48fik5cOdcfeFlw6D25CynH5OMrke1E4zv1RwFiiWeAuIUtYFzYqv6n2nvRjdEPPwB6Wds
 uix2zbEC6HcBC0GRe+MJUsR1wAcCLuvpLv8NSBVWfEvQy4OilbdE9h0
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-GUID: n4dUdBuswfHvCul5csQupPDXlFyWimeF
X-Authority-Analysis: v=2.4 cv=T7OMT+KQ c=1 sm=1 tr=0 ts=67f4e35e cx=c_pps a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=wRHcB2d8lc4RNk_KFh8A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: n4dUdBuswfHvCul5csQupPDXlFyWimeF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_03,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080063

When the system boots up after a watchdog reset, the EXPIRED_STATUS bit
in the WDT_STS register is cleared. To identify if the system was restarted
due to WDT expiry, bootloaders update the information in the IMEM region.
Update the driver to read the restart reason from IMEM and populate the
bootstatus accordingly.

For backward compatibility, keep the EXPIRED_STATUS bit check. Add a new
function qcom_wdt_get_restart_reason() to read the restart reason from
IMEM.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/watchdog/qcom-wdt.c | 40 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
index 006f9c61aa64fd2b4ee9db493aeb54c8fafac818..54d6eaa132ab9f63e1312a69ad51b7a14f78fe2d 100644
--- a/drivers/watchdog/qcom-wdt.c
+++ b/drivers/watchdog/qcom-wdt.c
@@ -9,6 +9,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/platform_device.h>
 #include <linux/watchdog.h>
 
@@ -22,6 +23,8 @@ enum wdt_reg {
 
 #define QCOM_WDT_ENABLE		BIT(0)
 
+#define NON_SECURE_WDT_RESET	0x5
+
 static const u32 reg_offset_data_apcs_tmr[] = {
 	[WDT_RST] = 0x38,
 	[WDT_EN] = 0x40,
@@ -187,6 +190,39 @@ static const struct qcom_wdt_match_data match_data_kpss = {
 	.max_tick_count = 0xFFFFFU,
 };
 
+static int  qcom_wdt_get_restart_reason(struct qcom_wdt *wdt)
+{
+	struct device_node *np;
+	struct resource imem;
+	void __iomem *base;
+	int ret;
+
+	np = of_find_compatible_node(NULL, NULL, "qcom,restart-reason-info");
+	if (!np)
+		return -ENOENT;
+
+	ret = of_address_to_resource(np, 0, &imem);
+	of_node_put(np);
+	if (ret < 0) {
+		dev_err(wdt->wdd.parent, "can't translate OF node address\n");
+		return ret;
+	}
+
+	base = ioremap(imem.start, resource_size(&imem));
+	if (!base) {
+		dev_err(wdt->wdd.parent, "failed to map restart reason info region\n");
+		return -ENOMEM;
+	}
+
+	memcpy_fromio(&ret, base, sizeof(ret));
+	iounmap(base);
+
+	if (ret == NON_SECURE_WDT_RESET)
+		wdt->wdd.bootstatus = WDIOF_CARDRESET;
+
+	return 0;
+}
+
 static int qcom_wdt_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -267,7 +303,9 @@ static int qcom_wdt_probe(struct platform_device *pdev)
 	wdt->wdd.parent = dev;
 	wdt->layout = data->offset;
 
-	if (readl(wdt_addr(wdt, WDT_STS)) & 1)
+	ret = qcom_wdt_get_restart_reason(wdt);
+	if (ret == -ENOENT &&
+	    readl(wdt_addr(wdt, WDT_STS)) & 1)
 		wdt->wdd.bootstatus = WDIOF_CARDRESET;
 
 	/*

-- 
2.34.1


