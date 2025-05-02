Return-Path: <linux-watchdog+bounces-3413-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E1BAA7343
	for <lists+linux-watchdog@lfdr.de>; Fri,  2 May 2025 15:19:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E1E1F1BA31CD
	for <lists+linux-watchdog@lfdr.de>; Fri,  2 May 2025 13:19:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BC882561AD;
	Fri,  2 May 2025 13:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fq2bSkYM"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9484255F5C
	for <linux-watchdog@vger.kernel.org>; Fri,  2 May 2025 13:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746191908; cv=none; b=Kwry0mGX3nABIyvWEkY0vRcyHz6QR6gCFtfhFTIrlHE4FQk5xZAprtg+zkXc1tD1znGbegMST3uv7wkU213xAs42QD8GyFE+V70Mmy7ZBExGEtU67pL85bIca747RShia7G50KVl6SVRfHx5HG+3M2EOf0WApq5Ed5CZL9biGq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746191908; c=relaxed/simple;
	bh=X/UXMHXf/RhMlrDKgR4/ge5TpOg8I3dflZnq+YhC0gg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uWH8EFEd0vsTLD5GWGdrRZC2XP+VwTSdAJOtgfdNt12CyTuJbxSEjfqLV0+Vbo8XNgWjfNpe8Kc8Q3a7ecZS/lXAGMXgO8oVwUcnBMqf//pOAxk8UxFMtqo2wJhh3wtYQ+y81Vbby8HQwaKjBTklamAy3koo3qh5vw/Y3vkX5EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fq2bSkYM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542DBSww017711
	for <linux-watchdog@vger.kernel.org>; Fri, 2 May 2025 13:18:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	slRaTmGfvy9G5pnb2zsQsGNa8ozzrVBB4Ulmgs5zT0c=; b=fq2bSkYMyE5XOc2C
	sruvyiDJRJnK5lXHhgziF+2AWu7zpi4mlShNh+gsO/YM557etnfUgbqGMspxBePa
	71xcMskhUJRWwaBdYUvsiGWUj6duBmFwGs7iLhqTdkqa8Piwi5hA8IveD3bes7x4
	GRZ6GnuAZNx7C44hUnW0fKSSI0FNlM8U8Oa9TualmZj8herJ0NlZ7fpbtVYN/Orq
	856V/ciu02h84Xia1L9M4oV1gKhfEX8bwgZHMQ2+m5nPfX+Yv1wq/w6u3QJZOQJq
	Wvm6y2KcK4sJBfGtMxGyaiWDgpFJFErTcbco3GlkJ8tnAlTfVSuxhIMFn8uJOuz4
	HU3/mA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u78dt3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Fri, 02 May 2025 13:18:25 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-73917303082so1539200b3a.3
        for <linux-watchdog@vger.kernel.org>; Fri, 02 May 2025 06:18:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746191905; x=1746796705;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=slRaTmGfvy9G5pnb2zsQsGNa8ozzrVBB4Ulmgs5zT0c=;
        b=ogw/xdJ7Z2FvJtXR/YNr7oqWH4RUonnCaPR1q2epaUOTgzHa1Z57Iq+250uHQoNlzD
         Vgi1DSru+1QlQQH4LXBBsvVvNYe4VG/sNSBD26e1e5vK/in/kn0i4ZuMGK0L2o9BojEs
         4HecXPFlED9k0bcsPji4HB3OIN8PzVuEc4t8L5X+IAo+U5v9sE0GX86pxvy70lkPT9fI
         TfGp3UF8DBBvI8Rsji4jM/xTmVWbFW2bGbz/K0NZzba8Ae+bBdXozRMuC4m83NcmlTQL
         /hO9RL/qV6T1FJH7pLzfBif6J5Hj1lsYmY3aEZ1ymsnudR0MxeyrFEhU8bWAw5v+YX8Y
         PdBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWisdub29M0yb+JuS4P05iOYigHguCeIe7Z8Wh2rJx5ibuCmRLKeR9GhmOYDiTOLXbn/Jqo2PREv4TznDgJOA==@vger.kernel.org
X-Gm-Message-State: AOJu0YylNy7qQfgXPOeWP0zz0ES+apTG6/KzbceuY4co51Z8tszp43pp
	tLJmly8T2OV50KweJ3179zK0nfeDtjA1zjrvXduC+iNlIa8v+hYGYJf9JtyryqCs0oHl/3T9rU6
	WnivJSNTyaiRz/D+XAurTD0nOud75LS9DXAl0J9ztB2seqdCPzbcdj8oJyIO11g+6BQ==
X-Gm-Gg: ASbGncssK8e9L+ZOoU543kvSesWUNm20gzci8tYMUIKEL3c65SUw+rXei4TRxxSm1T8
	N0g1Hw+VzzjtjZGAB4mAW04+wpbOWit2Oyuq1pkUJjkUobV6jc1h4ELsjIl4e8mWvS+JA0SnkG0
	oKeMfXXhULHfG+qsMv6DGMmwuUsIyzMZu4OtrbgbVaF5cUHVti0/deAy1LWbvUEV41ds/6Q9wwy
	iWI2WiB18DnZMWv2G1soPpom2DHH4evZonGz3M3g3LVOhB/7hFwXEtvYqOY4NOFyFDopFcBn+sF
	xEqKMsEotz05YH863L+5vkRPWTytmtxnHpA6RJD0MOwZqpg93NXGhhg57fHsIgCjyAYyJ/aBY5H
	7xuWOlDLbd2wWdqzevOrxniEkuAYC4PnlSPucbqYyq6YSsy8=
X-Received: by 2002:a05:6a21:a4c1:b0:1f5:7d57:8309 with SMTP id adf61e73a8af0-20cded42f75mr4269950637.21.1746191905038;
        Fri, 02 May 2025 06:18:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIFfSud8d4mhQtZmSV13r5D5SAuSAGajEnvH4vksJceLIMOcleS8DtsqVRRObuGzRFbXdvnQ==
X-Received: by 2002:a05:6a21:a4c1:b0:1f5:7d57:8309 with SMTP id adf61e73a8af0-20cded42f75mr4269912637.21.1746191904673;
        Fri, 02 May 2025 06:18:24 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058dbb939sm1525886b3a.61.2025.05.02.06.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 06:18:24 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Fri, 02 May 2025 18:47:52 +0530
Subject: [PATCH v3 4/4] watchdog: qcom: add support to read the restart
 reason from IMEM
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250502-wdt_reset_reason-v3-4-b2dc7ace38ca@oss.qualcomm.com>
References: <20250502-wdt_reset_reason-v3-0-b2dc7ace38ca@oss.qualcomm.com>
In-Reply-To: <20250502-wdt_reset_reason-v3-0-b2dc7ace38ca@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, bod.linux@nxsw.ie
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746191883; l=3927;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=X/UXMHXf/RhMlrDKgR4/ge5TpOg8I3dflZnq+YhC0gg=;
 b=mat02aZTLGdQNdCaBVC5tsHJnRdKr/A8cgsxGVrffovzn5TYZj1m196gCiS+pmpV/7Lm7akLK
 +6a9BrRnogFCzDFNO43HFJOq6dSKkWmVH1Tx5Pl8FAlmjil6oY1ehtD
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDEwNSBTYWx0ZWRfX1TlrjoWl3dKj g+kwlW3tTPWiuesaAzAdjsBPmdy/j91qxJ5Ny0q7K7NzSrronx792q/asYtjJF9D5y7ZTBIk7P0 ZSnXD5a8H3+G9Hu1PH2zHeF6dLN2/owJljAifwUgTLKP/yxctAlDwdkcEDtWQDAX/tUCb3EzNad
 Cet/Fnx0fvXmnmbHLZDOL/IcICA3ch09hMuKrGaKW5gy87Bsj/zqZTjtryZucSsQesLzhbSgl3x BBQHThFO2JQ4y+p8R61eIGHFW8l44COTYGE9aecfDdeExcNgWL7XOhATVuiclX/r8B3tow8tH+p IUWt5lLLIFprlEgswb+6WdYFkidWPi/UiVYirQbY4kEd8JY66n89nZ0ierF0jBy6aMwl9VUckZA
 wuq+8Ynvib7vK4cpujAlT3oV/Xhsy1FwQmqy1qjAeIEZ47NE/CUiOLq5U8HaxwCleCb4Wv+7
X-Proofpoint-GUID: PGSnNVZLZtuRKSNaqMCjAKqQYD5pcocg
X-Proofpoint-ORIG-GUID: PGSnNVZLZtuRKSNaqMCjAKqQYD5pcocg
X-Authority-Analysis: v=2.4 cv=b6Wy4sGx c=1 sm=1 tr=0 ts=6814c622 cx=c_pps a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=sQLmF_3sjJ1lx0YqgBUA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_01,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 suspectscore=0 mlxscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020105

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
function qcom_wdt_get_restart_reason() to read the restart reason from
IMEM.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
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
 drivers/watchdog/qcom-wdt.c | 40 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 38 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
index dfaac5995c84c1f377023e6e62770c5548528a4c..f2cb8bfdf53a5090bcfff6ea3a23005b629ef948 100644
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
@@ -42,6 +44,9 @@ struct qcom_wdt_match_data {
 	const u32 *offset;
 	bool pretimeout;
 	u32 max_tick_count;
+	const char *imem_compatible;
+	unsigned int restart_reason_offset;
+	unsigned int non_secure_wdt_val;
 };
 
 struct qcom_wdt {
@@ -185,6 +190,9 @@ static const struct qcom_wdt_match_data match_data_ipq5424 = {
 	.offset = reg_offset_data_kpss,
 	.pretimeout = true,
 	.max_tick_count = 0xFFFFFU,
+	.imem_compatible = "qcom,ipq5424-imem",
+	.restart_reason_offset = 0x7b0,
+	.non_secure_wdt_val = 0x5,
 };
 
 static const struct qcom_wdt_match_data match_data_kpss = {
@@ -193,6 +201,29 @@ static const struct qcom_wdt_match_data match_data_kpss = {
 	.max_tick_count = 0xFFFFFU,
 };
 
+static int  qcom_wdt_get_restart_reason(struct qcom_wdt *wdt,
+					const struct qcom_wdt_match_data *data)
+{
+	struct regmap *imem;
+	unsigned int val;
+	int ret;
+
+	imem = syscon_regmap_lookup_by_compatible(data->imem_compatible);
+	if (IS_ERR(imem))
+		return PTR_ERR(imem);
+
+	ret = regmap_read(imem, data->restart_reason_offset, &val);
+	if (ret) {
+		dev_err(wdt->wdd.parent, "failed to read the restart reason info\n");
+		return ret;
+	}
+
+	if (val == data->non_secure_wdt_val)
+		wdt->wdd.bootstatus = WDIOF_CARDRESET;
+
+	return 0;
+}
+
 static int qcom_wdt_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -273,8 +304,13 @@ static int qcom_wdt_probe(struct platform_device *pdev)
 	wdt->wdd.parent = dev;
 	wdt->layout = data->offset;
 
-	if (readl(wdt_addr(wdt, WDT_STS)) & 1)
-		wdt->wdd.bootstatus = WDIOF_CARDRESET;
+	ret = qcom_wdt_get_restart_reason(wdt, data);
+	if (ret == -ENODEV) {
+		if (readl(wdt_addr(wdt, WDT_STS)) & 1)
+			wdt->wdd.bootstatus = WDIOF_CARDRESET;
+	} else if (ret) {
+		return ret;
+	}
 
 	/*
 	 * If 'timeout-sec' unspecified in devicetree, assume a 30 second

-- 
2.34.1


