Return-Path: <linux-watchdog+bounces-3412-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FAFAA733C
	for <lists+linux-watchdog@lfdr.de>; Fri,  2 May 2025 15:18:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 299A7984F61
	for <lists+linux-watchdog@lfdr.de>; Fri,  2 May 2025 13:18:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 495C6255F3C;
	Fri,  2 May 2025 13:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ELlXN9VT"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD444254AF5
	for <linux-watchdog@vger.kernel.org>; Fri,  2 May 2025 13:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746191904; cv=none; b=bIZ3y1Y/Thi6NkVl5h+FpKRsZLFX9URPZhTGBWazAWgmnx3yEeX4eV1A/4zpZzrKFAl7lRq6lAP7zq2X2GQpAlbxoyu6/p4JSnLrFkw5hIGWdLFxuInwuidRYoRQBmS9cKkENCEbOtqcMwBbmU5pG9B2AkrSzs9R75h8/ZUEags=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746191904; c=relaxed/simple;
	bh=gwpUMbBpXzu5+reB0WmgsbjcDWnkBung9x+HZPAYJk4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XBm0QPUI9eNRtnnhDylo36UMAToSiUvoryz0Z2XR7mWayEom1MPqLriiBJi1R3P0R8DdBmnB2yrvOBP8VtlC8t2KBQAnfnqncElut15fap+QTG7nIqK5aTjny1VAqjR0G3ZhNc/N4mM/rYClv51ALnu9L35eg8Jsd+zZTqmHvHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ELlXN9VT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542D7Q8L016237
	for <linux-watchdog@vger.kernel.org>; Fri, 2 May 2025 13:18:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9vMvxizaT1xk4hie5Ubnws/xgswa1U+KGaDbkTzMKa0=; b=ELlXN9VTgH1/iTNv
	llV6kjC8VOW8N77AUJN1F8Rl0HWEqwvK0PQ3j3jvFqXlLBh1gG8rAzC4+O5YnFly
	u26TfYGxj8qplo2GVYowE6z5YOGvcBV/rosF6LD4UEj1fIsaPKMos502zsmwoOSg
	NJHnHiRa1FxHelydFsA39OG/L4DHzg+NBgGWjJ1vBqzVSj4TuZqYKYfI7EEHYyhj
	2Ft2ddLFfcI/7OVhwEN6KPYz0WXtIULKlntMnLk/R51VFeNNmnEJvoeVRDbWMGHn
	OHorjxKAzb0KpIdWvSUjDUBZs2OofMvRt7VJfLUeQaPiftLMAhkW5JrHwO2RotPe
	d5QDkw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u4gepu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Fri, 02 May 2025 13:18:21 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b1b2fa98c39so2122957a12.2
        for <linux-watchdog@vger.kernel.org>; Fri, 02 May 2025 06:18:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746191901; x=1746796701;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9vMvxizaT1xk4hie5Ubnws/xgswa1U+KGaDbkTzMKa0=;
        b=XG095xcXlN1kWUTlio103qSvYJ+4dcFIuPMEUQ1+iG7WJm1bBhi8/bOLTR+MjrMBA6
         iTp6sodH717EwPwLyklFF9euL4rZwW0wGl+0q/F2yOFw93ZfjpPGjyFgX/L+idal+b8K
         qC1uaUM9VskPiGTvjYo1fxyn0Qtoqu/QL6RaADD+gN0lRRMt2sMFLJDvUVAB8WDNfQqg
         L+WCFgB3YgpeObJVIObpnLDBNeoQJDomFnLBtnsmV+0CBnU4Jnz5aOv4UmD7q2xVxmhu
         qGOoXboEaXR1D7j5/YO1h2MSe1fCq3RSwg79g6RdaK9rCKgz3q9DNTygaZTItQycvaZY
         ed1w==
X-Forwarded-Encrypted: i=1; AJvYcCXUVld6cjA0IK4/hkaSZcZAQCGwuUaUXCCeBQzsSSW0d+5i6nzMAyR/pGYOXl5k6ew1X6+0ubk7Byt0wTD1cg==@vger.kernel.org
X-Gm-Message-State: AOJu0YykiNMQVWXDLOxJaYM26pUqbw9Idey+xJbjR01BHoRXdKo+Pfwb
	hFVK7bskWP52V+9ArafFL43fsIIPG6qfisFuX4vkDOUAZWvT05YZjGCchgPnRIH1u28oDEa95mq
	wlPi5bXDNEG1/2v/H+kmU5hL5sy1ru1xOpmzQzo1juXyjqBmAJ4DVImIyZcD+GF7UgA==
X-Gm-Gg: ASbGncukIR8BFjOGpcgy80TOfCAmFBX+CM8aOg6NL8fawxEkzperYspL/P7ZDuWB5CX
	HXDYcey/rDGLQbRTwRCOvI7BfBGkekxwoFIf3LvMJ6owMHITG1cR4t+W3z+cKdqRapZKSBkd17p
	Tx775wUTiy5zdrIiTGhkXvv+Ec3CZAUPOwfvA4zWBZNYe+cOyt8dnieyHroS1RfbvWIPYox/zO/
	ArQ3prvm+RA0R5j8Pd0SW8uoiNA09bV+cE5Bh5WBR50hTho5ryuzAaxlz6yKHHFe8/uCusmqUWK
	DLbOpnpcPM9UfN5NvzbEmyT/MQQR337ur50SNfhfnd122+mgV7vCgEWKBdAPRrCFojiMAcAc4px
	b0DOFl7nsBEGyRZfJk8qhkueqS8imt2zE56HwZE3EFJPmZ/o=
X-Received: by 2002:a05:6a21:1786:b0:1f5:8e39:9470 with SMTP id adf61e73a8af0-20cdfcfc862mr4645079637.31.1746191901009;
        Fri, 02 May 2025 06:18:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3vWB64AN3R+aqhJiA646DNNY2YvW+T/GKptK3r5zllmEiCgaz3jFKpQSKdxiGPuXwx1gfIQ==
X-Received: by 2002:a05:6a21:1786:b0:1f5:8e39:9470 with SMTP id adf61e73a8af0-20cdfcfc862mr4645043637.31.1746191900671;
        Fri, 02 May 2025 06:18:20 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058dbb939sm1525886b3a.61.2025.05.02.06.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 06:18:20 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Fri, 02 May 2025 18:47:51 +0530
Subject: [PATCH v3 3/4] watchdog: qcom: introduce the device data for
 IPQ5424 watchdog device
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250502-wdt_reset_reason-v3-3-b2dc7ace38ca@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746191883; l=1548;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=gwpUMbBpXzu5+reB0WmgsbjcDWnkBung9x+HZPAYJk4=;
 b=QADu0rUVoDu09hkso28bhGRBNTAXFfxP7Jw8a5UPLjcywek9SbOlxtIcL9OL651RyGZyqZuF1
 N/6HmcsbNCQAKIAVsjdaIssoRQ+FufXH5ZhXlR3+kHlahB0KOjDy4cI
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-ORIG-GUID: cF497wJvK-Cbz8RylMWXQQ45x8laBwkh
X-Authority-Analysis: v=2.4 cv=Yaq95xRf c=1 sm=1 tr=0 ts=6814c61d cx=c_pps a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=rRLmAKjRkRCCZZ2CrwwA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDEwNSBTYWx0ZWRfX9HgHUcp7f8zj B06lv+6Yst9Xx+2mLBraTKmL4bIiTktWAHhCdRn94MFwSisdt3zONofqj2iISTerL7eYUYIfNlQ tt58LmcpJWSGzGy24CfEl+qzCqJCeKlr/BE48VRdP+XcrSPjHdzSnZ5/tEyU/Eo6/v9IOdzhXts
 t5e4eydZpSOg1UrddJuzk2iSrJgwg+vpDjXBPSOvDNso3SZuwLy3bWqcR9vpIfTXOeUaHbFAlOJ 4IEXZAJ7uQexuCL9WB2WKqbZslL7d/p43jwBer0RlbdkG/J9ctistn/5ppauRqNVqQox43Dqfhi hbPOfW0EJC5W8r7nWXutkjJmPnWnT0l7Xznepr8W4GhltkCYvgqjhQZw3bp8JKzrzvpvIXGZ2dW
 510Zey8mnx3ZhD23qycsA+0U+GZRUkecT5OZKoX0TlHZzd3G3WXZGb05YmSMHXjNFDZIWSLC
X-Proofpoint-GUID: cF497wJvK-Cbz8RylMWXQQ45x8laBwkh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_01,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 clxscore=1015 suspectscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020105

To retrieve the restart reason from IMEM, certain device specific data
like IMEM compatible to lookup, location of IMEM to read, etc should be
defined. To achieve that, introduce the separate device data for IPQ5424
and add the required details subsequently.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v3:
	- New patch
---
 drivers/watchdog/qcom-wdt.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
index 006f9c61aa64fd2b4ee9db493aeb54c8fafac818..dfaac5995c84c1f377023e6e62770c5548528a4c 100644
--- a/drivers/watchdog/qcom-wdt.c
+++ b/drivers/watchdog/qcom-wdt.c
@@ -181,6 +181,12 @@ static const struct qcom_wdt_match_data match_data_apcs_tmr = {
 	.max_tick_count = 0x10000000U,
 };
 
+static const struct qcom_wdt_match_data match_data_ipq5424 = {
+	.offset = reg_offset_data_kpss,
+	.pretimeout = true,
+	.max_tick_count = 0xFFFFFU,
+};
+
 static const struct qcom_wdt_match_data match_data_kpss = {
 	.offset = reg_offset_data_kpss,
 	.pretimeout = true,
@@ -322,6 +328,7 @@ static const struct dev_pm_ops qcom_wdt_pm_ops = {
 };
 
 static const struct of_device_id qcom_wdt_of_table[] = {
+	{ .compatible = "qcom,apss-wdt-ipq5424", .data = &match_data_ipq5424 },
 	{ .compatible = "qcom,kpss-timer", .data = &match_data_apcs_tmr },
 	{ .compatible = "qcom,scss-timer", .data = &match_data_apcs_tmr },
 	{ .compatible = "qcom,kpss-wdt", .data = &match_data_kpss },

-- 
2.34.1


