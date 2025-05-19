Return-Path: <linux-watchdog+bounces-3523-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDE8ABB786
	for <lists+linux-watchdog@lfdr.de>; Mon, 19 May 2025 10:42:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 647137A0507
	for <lists+linux-watchdog@lfdr.de>; Mon, 19 May 2025 08:40:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BB2F27935D;
	Mon, 19 May 2025 08:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nSnDfaHo"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6151E26B95B
	for <linux-watchdog@vger.kernel.org>; Mon, 19 May 2025 08:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747643681; cv=none; b=VtmJPOf+qWyItO5jipp6HC6GGp6bx1LU02iRbSFycaMEOHbmbAvvmNhEKNjvxXjsVAZ9x7l//z4jhthbz+8xF0U9BwpEg4//haCvnpK37xA77ce8VdDXNHBTLRA4GqwFn+Rc8HwT5DueTMrmDVXON9y7HLNP9oI+PLFrYrAi6/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747643681; c=relaxed/simple;
	bh=mUzO2xSu3EpTivKyV8Um9rHqn8YSH3zDDY76ndIIIq4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BUG4srh4k8TI/Zu//5io9xGIQ+0Sn5qbIFzFylPt2yAaD/u/l3iTnHOmXYkJGDNRbilPEUIBOqztyl1EUvrk1pi8UQK8L1a2roY8+4jFRpceFnZaMvNgBhwtLz+9x7i8YfLJVzfgD1bqWpQLo633ED6QrMm5mQ8DiqlxESmSJIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nSnDfaHo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54INvls9030233
	for <linux-watchdog@vger.kernel.org>; Mon, 19 May 2025 08:34:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GcUkx+YKqco1Xw2nHjFM9i9LbYE7u4pXF1Mr2WP4S/E=; b=nSnDfaHoEEJJoj9y
	eX5buC4t4K8XZU9FB51bZ6YeH8zvXFqAS/9Eo75nlz70Z1qT8Ih87F7Zo7UD9Pyi
	o9dn/OgCqtl7k2dvXqqcg3N7ibQGBV1t53tmiaKxSJYCXR4eErfRdNhWLF98EquN
	aDYB9Wesvoh2OaWmDk78BdEKV6sa6oTi6Ew52Y8XvLN2XccnZkEd1eoxjWnOg+Fd
	Bp4notia+ZT82kUJ6lN2VRXP28f8Fm8zb6QULBKUm1KsuhINo5hFHaYPt/voW1BT
	jJKgKnvHwqPbNtMcIRYKOZQoAigoynYIIEduE+EL7J3XAFTYf/NR3Rzb8vl7R4wd
	vDSVAQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4kmm3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Mon, 19 May 2025 08:34:38 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7429f7f9ee3so2623310b3a.2
        for <linux-watchdog@vger.kernel.org>; Mon, 19 May 2025 01:34:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747643677; x=1748248477;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GcUkx+YKqco1Xw2nHjFM9i9LbYE7u4pXF1Mr2WP4S/E=;
        b=AQs8V+qjztOyDPkR6RsTgyxLfBMRi/V5/naNt9BPwuSXbqV2vboESN+FUGs+5/Capn
         CKkmec+IirHgxsQVR199YkyEgEH0FRAVMcTq+i0uSrQD/4n1AOgdBG74GdW81g0lq8ML
         yKmr5SIP64fMFFqC+ZdJgdML8iLjeQ3hh1hprbjG+wMnpHpiOUB8KGaLhr+S43IFekPU
         hQbelhYGcmrjW9fJE878vjt6VQuO6Xx2Pf1StWofQKMjttJTYrsV7jmUuktYKLOpuDNL
         2pxeYF0Bb5AoxtWR8gictx8ombjLEtovTIi5x2W6xmQUMtU7EAFwQFnyw3/Pp6TLsFDJ
         XN7g==
X-Forwarded-Encrypted: i=1; AJvYcCXizE1lcbs09QTqXLglr1czAt/65ScNikUisRi1YnJBW2WjR1bwlhTM8Yn9OMZd1BKevt2zItRha/IJ2bxitQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb5zjoojReZibq5ghbEi864jLAwc2PrTI7QuWUcWlZTZ+Qd1K5
	gu9onTnnYxpbksgcJ1FZzNLqqRbuEXgUdKqYJL623ohuA5zNhDwiXOoDoReAJty0cy5LuVS/4qw
	AVwPmj0n8u7/uYq+31ZF5Dcx2CXeo+yzzwgcL8eub8dR1cXKqM1TmrqIphZ6YMkBePlUEAg==
X-Gm-Gg: ASbGnctsinbZN8HKEfq0v3rFM6KOffWOEuTweqB8deODjAOtyTM8yXUYCX+4dT/jhuh
	xicQzynDJDkqXt/A4fH2WZgzzNSMyxjuSQ1cMcCUmB5YXEeGLstv1YF5j6TaIBp5iMAJBE8j70b
	sdgYbHXo9uYN3OyoWUfmifWkzR0uIcSIYYNwG5tyenWXvrWF5uo64b3Dfu/lyA/qsMuwS/axu6W
	95xBl5dPMszN9pwz6Jd/qrc9xvQKIrvgguj9lYqqumrqQeNxSKXsDn+TK4avbnnNH1HNx3wrLou
	QS0QfwEkyFqpHTc8nLc+grhwKBJT6VkBydrgO8LmwqpH2T5YBNHvcPGdFBdVMQcvaYFr+lQKGWP
	8qVAnfRrQFqPpbgTaQyXxYcOuJIfh8SR4UKdDyBC4EbVP7i0=
X-Received: by 2002:a05:6300:8048:b0:218:bbb:c13c with SMTP id adf61e73a8af0-2180bbbc173mr11755958637.38.1747643677228;
        Mon, 19 May 2025 01:34:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzHKwpnMF/G5uWJCqmSSyVJ0NW+L3DiuThw+GwYy/efs9lHJFclcF5sQQK+SpSmsBwFyK7ng==
X-Received: by 2002:a05:6300:8048:b0:218:bbb:c13c with SMTP id adf61e73a8af0-2180bbbc173mr11755929637.38.1747643676777;
        Mon, 19 May 2025 01:34:36 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf5a2cesm5705475a12.9.2025.05.19.01.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 01:34:36 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 19 May 2025 14:04:04 +0530
Subject: [PATCH v4 4/5] watchdog: qcom: add support to get the bootstatus
 from IMEM
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-wdt_reset_reason-v4-4-d59d21275c75@oss.qualcomm.com>
References: <20250519-wdt_reset_reason-v4-0-d59d21275c75@oss.qualcomm.com>
In-Reply-To: <20250519-wdt_reset_reason-v4-0-d59d21275c75@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747643657; l=3709;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=mUzO2xSu3EpTivKyV8Um9rHqn8YSH3zDDY76ndIIIq4=;
 b=5pCTnDbSHpRWKO3dMBFMNUuE6wudIY44pGPTy7BMHe+3G8NojMyGvtxWq1HQzXqvsUuWc2Hq5
 Gdcw4d+XD4+DrY1KFpmFyThwJUJBrT+OV1QPSuAimTJSQeXYf1mcTbX
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-ORIG-GUID: cpmsj7ESus3KnZPnxfph40t9aYRn_YrB
X-Authority-Analysis: v=2.4 cv=C4bpyRP+ c=1 sm=1 tr=0 ts=682aed1e cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=1bKD8B96pFte2-3mT60A:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: cpmsj7ESus3KnZPnxfph40t9aYRn_YrB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA4MSBTYWx0ZWRfX78Mm6siNEdpO
 A58XThLtB40sfWrYxDjecbPRpbI04md/9gou1WrbxLUQesAVVDSkQZEqnJSsuPoU/Bct85NTYEe
 AO3k0nOUi6L4ZaW5DMF22ce0Y4oIDzIx/6wXJINprkaPgdauqsLgv8vymSydGdwWtCFtqPCKlGJ
 QljyHIV4NSRqA9WqTaH/HBBcFktY17KSwJ7thc2Z6pr8uHRRAYbm6ktEsznOQ1AhfY/EILmW3Il
 YLHhfJ2rwqqrKHpoa6qqJQYxhxek9iq3wMctjYoJj0nKKhKuu5vhKrS16qgj0MPZEA9CDZAqizm
 /OBkEVK0A0LusDdC57XQKvkBE01I+VswVLEWhIjlPIdJdi59x0qG907z2uPlX2hS/BAhqlLnmDD
 UVvWNM3To2ZGAjsjeKJPqSHtF8pYwt6KgkKkb6oYHbdbXgg3zFse2CibRCPsfOMDllU99XhD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_03,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0
 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190081

When the system boots up after a watchdog reset, the EXPIRED_STATUS bit
in the WDT_STS register is cleared. To identify if the system was
restarted due to WDT expiry, XBL update the information in the IMEM region.
Update the driver to read the restart reason from IMEM and populate the
bootstatus accordingly.

With the CONFIG_WATCHDOG_SYSFS enabled, user can extract the information
as below:

cat /sys/devices/platform/soc@0/f410000.watchdog/watchdog/watchdog0/bootstatus
32

For backward compatibility, keep the EXPIRED_STATUS bit check. Add a new
function qcom_wdt_get_bootstatus() to read the restart reason from
IMEM.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v4:
	- Kept only WDIOF_CARDRESET and dropped other codes
	- Renamed qcom_wdt_get_reason_reason() to qcom_wdt_get_bootstatus()
	- Moved the existing check inside qcom_wdt_get_bootstatus()
	- Dropped the device data and put all the details in the DT node
Changes in v3:
	- Split the introduction of device data into separate patch
	- s/bootloaders/XBL - for clarity of which bootloader is
	  involved
	- Mention the sysfs path on to extract this information
	- s/compatible/imem_compatible in the device data structure to
	  avoid the confusion / better naming
Changes in v2:
	- Use the syscon API to access the IMEM region
	- Handle the error cases returned by qcom_wdt_get_restart_reason
	- Define device specific data to retrieve the IMEM compatible,
	  offset and the value for non secure WDT, which allows to
	  extend the support for other SoCs
---
 drivers/watchdog/qcom-wdt.c | 42 ++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 40 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
index 006f9c61aa64fd2b4ee9db493aeb54c8fafac818..adbf21ae2ef15ae2faec57c6ec01c38924bc4955 100644
--- a/drivers/watchdog/qcom-wdt.c
+++ b/drivers/watchdog/qcom-wdt.c
@@ -7,9 +7,11 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
 #include <linux/watchdog.h>
 
 enum wdt_reg {
@@ -187,6 +189,41 @@ static const struct qcom_wdt_match_data match_data_kpss = {
 	.max_tick_count = 0xFFFFFU,
 };
 
+static int qcom_wdt_get_bootstatus(struct device *dev, struct qcom_wdt *wdt)
+{
+	unsigned int args[2];
+	struct regmap *imem;
+	unsigned int val;
+	int ret;
+
+	imem = syscon_regmap_lookup_by_phandle_args(dev->of_node, "qcom,imem",
+						    ARRAY_SIZE(args), args);
+	if (IS_ERR(imem)) {
+		ret = PTR_ERR(imem);
+		if (ret != -ENOENT) {
+			dev_err(dev, "failed to lookup syscon: %d\n", ret);
+			return ret;
+		}
+
+		/* Fallback to the existing check */
+		if (readl(wdt_addr(wdt, WDT_STS)) & 1)
+			wdt->wdd.bootstatus = WDIOF_CARDRESET;
+
+		return 0;
+	}
+
+	ret = regmap_read(imem, args[0], &val);
+	if (ret) {
+		dev_err(dev, "failed to read the restart reason info\n");
+		return ret;
+	}
+
+	if (val == args[1])
+		wdt->wdd.bootstatus = WDIOF_CARDRESET;
+
+	return 0;
+}
+
 static int qcom_wdt_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -267,8 +304,9 @@ static int qcom_wdt_probe(struct platform_device *pdev)
 	wdt->wdd.parent = dev;
 	wdt->layout = data->offset;
 
-	if (readl(wdt_addr(wdt, WDT_STS)) & 1)
-		wdt->wdd.bootstatus = WDIOF_CARDRESET;
+	ret = qcom_wdt_get_bootstatus(dev, wdt);
+	if (ret)
+		return ret;
 
 	/*
 	 * If 'timeout-sec' unspecified in devicetree, assume a 30 second

-- 
2.34.1


