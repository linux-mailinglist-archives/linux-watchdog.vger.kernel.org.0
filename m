Return-Path: <linux-watchdog+bounces-3653-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 41348AD39C4
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 Jun 2025 15:47:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 85E20189B328
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 Jun 2025 13:46:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48A3729CB47;
	Tue, 10 Jun 2025 13:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="omTnmL4b"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8C729C33F
	for <linux-watchdog@vger.kernel.org>; Tue, 10 Jun 2025 13:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749563147; cv=none; b=uwqubbUYDRNFBwbloshgE0d7urlmt+Ap4K0WXjOPHQ1mU01yTTPWrZ/Z70GZDa/wRJvqVidjQEavy3G3Y/ViJV+c7DPkskAqndgNqViYhwdwM1fW7kayiJ4CDCgDjhUhZWNWrIsX0H9mkwcH0VRvHDLyP+z7HsWxfo140n7w1Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749563147; c=relaxed/simple;
	bh=qodg/qJgptXiBp36gN6zPzfmpF/ldoJtnRNBNm4szJw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PNUtonyiRoTbHg0TfI2eOGnoyD9goEKypP4JD9opHzpz+4iLmFXzJWll5gW237a/jBH7uvXbiQpzPh9EuD46/2QQGhF1iyJ04XluTTtRLjjoOkHDhGaOxhxoO5x0lpD4R9S9VYBk8pQG6kAy0hTVxzrq30yNQEsJuc5Ue5Qxfu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=omTnmL4b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A6aNK1000933
	for <linux-watchdog@vger.kernel.org>; Tue, 10 Jun 2025 13:45:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4mIEeWqs0Eroebgunj8ZpmJbv/vEwYm2mCE1jLGUifA=; b=omTnmL4bq0zxc++M
	c7BHD3US+kpzfMj6Jf+egd/uyOgki87MPJSvz/6wYhWjyqvy+3C/fX6l06aak5CB
	+eu40BLeQKGgIxT49On56I2h87NdIzlwuPoLtNFlyxaWQj/4FuI/JmprkzMkJ9O6
	DBYe5eqYNfHsGRjxbywPVN3y8fhpQ8UGLe4V6lydnOskQdIVK0j/DJYOiY9plOFP
	NYAwmeNbsh5B42AFXQfvSzPEKQRu+OGkeesHvkfm4lFQvfM5UZ7lRccRyKHX0S8Q
	cqeEPTlzbSgtK58qdch+7kOVc7iPu/lPh2/PNLmC8poLFvgMbZGpWooVP5rAVCLW
	KEMe7A==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475v2tc9uf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Tue, 10 Jun 2025 13:45:44 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-74834bc5d37so5342049b3a.0
        for <linux-watchdog@vger.kernel.org>; Tue, 10 Jun 2025 06:45:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749563143; x=1750167943;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4mIEeWqs0Eroebgunj8ZpmJbv/vEwYm2mCE1jLGUifA=;
        b=Z5mqFwYXwVy/Ep5wHo5IKv3UJTqdrrcBRcIV809Vx1A2XlCXyl4375mP9iNtlivcnv
         KC5PwZfL9C7ZK0M2t3TDUn5Z5dDqWRGwi8xLhCsSzTnLC3s3tf4+K2aFF00EG2UvGRY5
         jlu/inpVGehZPNP7yetMOIxE2EE4ZuCp1Mr4acttxy14DVUlGO6Vx7pyQ0jq4prl+47n
         fDjIduqOF2RfKFIPUjdtZuCngKTs3uoc5icv1jweEmdJ29gfNqgnhrY5R+U+3Ndn8PXI
         nNH+Q4ChmmLUMWu22i+zvZ7f7bO2znUtasAFbCtYScs/7MUbbZZfcs/GGaDOQf1O1KBU
         XPhw==
X-Forwarded-Encrypted: i=1; AJvYcCUS/M+qZpr6/wP/3AV52L1GbgxYYQOYYMbnoKoBx5N/y/z02IJ3fnW0rhiZjX3Ind6DuplMQZ0tH9VGlRRvkA==@vger.kernel.org
X-Gm-Message-State: AOJu0YykPKFXgCAq4ErJONVCzTPnqKc5zUvk1PneCMGEze7oQr/7/Y3e
	lQBllQHw1LNuTc2RMxztfOUAXqlNRRalLCfv85o1rkhvktyw4DFa+bwmsRWhYsfkiJ/nfhXlcZ6
	SseVtDkbmXuZQJa52TfGU9qo3QdoyRV2cvlgs3IvTSzcXB3eHJ5vLBOVrHHbyhsbDSZ3M/Q==
X-Gm-Gg: ASbGnct7Tq50vsvoqpd36Ohq+8oI4SWmPnWamKAnAtgnw2SjzGModGGaeEUgnHrVQP1
	eEBRNhuFFXkjOIAm8gfw6bpuJ/jRnUvyahhUZBKHeoCDRKTlRqKf2yQcOprMy5hhZ2lrzNLvZkL
	pys6Zp2XNQYto9DILc2yVWCFDpe6KvQglNE1RxpYjZdp4Pc5+Z5utqfkV6hp2tul058BBUUu35n
	8KKEb+wmmJurHUtx19gV81zJup6sJxjp1u+fbC+nBOHR+lR1PilIF6sgZwg9K7JKAo6FsgNdz2r
	7pUwTm6FFqe8eVWZMJAVmRKw78vqmy+fjD6sqyITOSHfzDltpnpISmgo0KhFkTEUfWAuosnOTey
	qnKhGgxn34GSxQXqFO4zAv3/fR5kHEjsfMSkfYJLJThBCaT4XrxpLeZyCfw==
X-Received: by 2002:a05:6a20:729f:b0:21a:ec1c:5842 with SMTP id adf61e73a8af0-21ee6897fb7mr25631343637.32.1749563142913;
        Tue, 10 Jun 2025 06:45:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXle56quYcGkL187PQrEfR1t2ZC0l/D9zmJLpQ87BsRlsZYNw5ms9DIz4OovX6axzP/0PQPA==
X-Received: by 2002:a05:6a20:729f:b0:21a:ec1c:5842 with SMTP id adf61e73a8af0-21ee6897fb7mr25631310637.32.1749563142543;
        Tue, 10 Jun 2025 06:45:42 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5ee70085sm5858107a12.25.2025.06.10.06.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:45:42 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 10 Jun 2025 19:15:20 +0530
Subject: [PATCH v5 4/5] watchdog: qcom: add support to get the bootstatus
 from IMEM
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-wdt_reset_reason-v5-4-2d2835160ab5@oss.qualcomm.com>
References: <20250610-wdt_reset_reason-v5-0-2d2835160ab5@oss.qualcomm.com>
In-Reply-To: <20250610-wdt_reset_reason-v5-0-2d2835160ab5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749563123; l=3796;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=qodg/qJgptXiBp36gN6zPzfmpF/ldoJtnRNBNm4szJw=;
 b=dzDC23v73Zw8FkncgGzm33P7WFmhs7dYkj4tln+4sd/97YIALm0eTFRNI0m1Vf6UZrP3JyaqB
 lNw2I+Z6kk0AxVCstl0NTPuRfMnpKSa8pnZmd8mIlPyyIt+deOONdT1
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-GUID: 0WUESZR_PTA7vzRMZaVaQUWf9wHn-AdY
X-Authority-Analysis: v=2.4 cv=GoxC+l1C c=1 sm=1 tr=0 ts=68483708 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=tIxvoA3mxl7b6XSbyz0A:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: 0WUESZR_PTA7vzRMZaVaQUWf9wHn-AdY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDEwOCBTYWx0ZWRfXxF+Cmu+DFjbZ
 b2/yi7F4hJxJ+BVt7X8NkcaMSU6lq92wtgRG2QxLyAaUcjod+EY/a3dWGR5UIrj28XBfg0Nardv
 BYNVGjK0BsP7kIxZVJLNN6jQR27i4FI8zI1BOS0F2I3N3arAIg9YEQecqR0w/xGPyn+j4qzFpS8
 ULej+Nzu8+hPCUNmTgKLDjlm0+MB0hHsZu7hvuEyFUIrsx2TlfVtXVQZwJ/9m8b946p33KfqrW8
 kA3hPQzlmx8EooeQGfi3v/76Kyo2CayEnBQJjM48FnywxkftdFNO9fVdIwer2JY1NfC7cr732k4
 cYbE8CCK6lJ0nqhJBirRNyQh/3IKcn5Bd/WwuMcOJcgvtUWdNSJNnuofG03ICA2xQuen5q5bhu8
 duZXfM/3DqT/ptXAjh7JellfWRnZN29fCN2BjEQEbzXIKGpJN6BvXDgdLAag2dC4qnmohHoY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0 impostorscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100108

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
Changes in v5:
	- Use dev_err_probe instead of dev_err

Changes in v4:
	- Kept only WDIOF_CARDRESET and dropped other codes
	- Renamed qcom_wdt_get_reason_reason() to
	  qcom_wdt_get_bootstatus()
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
 drivers/watchdog/qcom-wdt.c | 43 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 41 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
index dfaac5995c84c1f377023e6e62770c5548528a4c..795f409506c6bb1dfb26cd8af18bece3cc35aebf 100644
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
@@ -193,6 +195,42 @@ static const struct qcom_wdt_match_data match_data_kpss = {
 	.max_tick_count = 0xFFFFFU,
 };
 
+static int qcom_wdt_get_bootstatus(struct device *dev, struct qcom_wdt *wdt)
+{
+	unsigned int args[2];
+	struct regmap *imem;
+	unsigned int val;
+	int ret;
+
+	imem = syscon_regmap_lookup_by_phandle_args(dev->of_node, "sram",
+						    ARRAY_SIZE(args), args);
+	if (IS_ERR(imem)) {
+		ret = PTR_ERR(imem);
+		if (ret != -ENOENT) {
+			dev_err_probe(dev, ret, "Failed to lookup syscon\n");
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
+		dev_err_probe(dev, ret,
+			      "Failed to read the restart reason info\n");
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
@@ -273,8 +311,9 @@ static int qcom_wdt_probe(struct platform_device *pdev)
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


